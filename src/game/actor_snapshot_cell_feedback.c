#include "tingle/heap.h"
#include "tingle/touch_panel.h"
#include "tingle/types.h"

/* Convert a saved cell snapshot into randomized visual and spatial-audio feedback. */
extern const char data_020df4f0[];
extern u8 *data_021052fc;
extern u8 gActorInteractionResourceState[];
extern void *gSoundContext;
extern TouchPanelManager *gTouchPanelManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitComponents(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32Object_Destroy(void *vector);
extern void Position_AdjustForTerrainHeight(void *vector);
extern u32 genrand_int32(void);
extern void *ActorFeedbackResources_GetResource(u32 index);
extern void *TimedSpriteOffsetPresentation_Init(void *allocation, ...);
extern void PresentationList_AppendObject(void *manager, void *presentation);
extern void Sound_PlayEffectWithParameters(void *context, s32 sound, s32 variant,
                          s32 volume, s32 pan, s32 extra);
#ifdef __cplusplus
}
#endif

/*
 * Read signed cell coordinates from snapshot words +0x04/+0x08, convert them
 * to fixed point, and pass the temporary vector through Position_AdjustForTerrainHeight. Query
 * the runtime map object's virtual slot +0x2c; return zero after destroying the
 * vector unless decoded bits 10..13 equal one. For that cell class, choose
 * sprite variant 0/1/2 from one RNG sample, optionally play resource-record
 * one's packed cue with distance-based volume and touch-Y pan, then construct
 * resource one's offset presentation (offset zero, sprite-byte -1), register
 * it with the runtime presentation manager, destroy the vector, and return
 * one. A missing visual resource still returns one. Map, RNG, touch, sound,
 * heap, construction, registration, and temporary-vector calls have observable
 * engine or SDK effects; the matching fallback preserves retail arithmetic.
 */
s32 ActorFeedback_ProcessSnapshotCell(const void *snapshot)
{
    const s32 *saved = (const s32 *)snapshot;
    s32 position[4];
    u8 *map;
    u32 cell;
    u32 random;
    s32 variant;
    u8 *records;
    u16 packed;
    u8 *resource;
    void *presentation = 0;

    VecFx32Object_InitComponents(position, saved[1] << 12, saved[2] << 12, 0);
    Position_AdjustForTerrainHeight(position);
    map = *(u8 **)(data_021052fc + 0x2ed4);
    cell = (*(u32 (**)(void *, s32, s32))(*(u8 **)map + 0x2c))(
        map, position[1] >> 16, position[2] >> 16);
    if (((cell >> 10) & 0x0f) != 1) {
        VecFx32Object_Destroy(position);
        return 0;
    }

    random = genrand_int32();
    variant = random & 1;
    if ((random & 3) == 0)
        variant += 2;

    records = *(u8 **)(gActorInteractionResourceState + 4);
    packed = *(u16 *)(records + 6);
    if (packed != 0) {
        TouchPoint point;
        u8 *reference = *(u8 **)(data_021052fc + 0x2ea4);
        s32 dx = (*(s32 *)(reference + 0x1c) >> 12) -
                 (position[1] >> 12);
        s32 dy = (*(s32 *)(reference + 0x20) >> 12) -
                 (position[2] >> 12);
        s32 distanceSquared = dx * dx + dy * dy;
        s32 volume = distanceSquared > 0x4000
                         ? 0
                         : 120 - ((distanceSquared * 120) >> 14);
        TouchPanelManager_GetPoint(&point, gTouchPanelManager);
        Sound_PlayEffectWithParameters(gSoundContext, packed >> 7, packed & 0x7f,
                      volume, (s32)point.y - 0x80, 0);
    }

    resource = (u8 *)ActorFeedbackResources_GetResource(1);
    if (resource == 0) {
        VecFx32Object_Destroy(position);
        return 1;
    }
    {
        void *allocation = Heap_Alloc(0x14, data_020df4f0, 4, &gHeapContext);
        if (allocation != 0) {
            void *group = **(void ***)(data_021052fc + 0x2ea4 + 0x54);
            presentation = TimedSpriteOffsetPresentation_Init(
                allocation, position, variant, group,
                *(s32 *)(resource + 4), *(s32 *)(resource + 8),
                *(s32 *)(resource + 0x0c), 0, -1);
        }
    }
    PresentationList_AppendObject(data_021052fc + 0x2f7c, presentation);
    VecFx32Object_Destroy(position);
    return 1;
}
