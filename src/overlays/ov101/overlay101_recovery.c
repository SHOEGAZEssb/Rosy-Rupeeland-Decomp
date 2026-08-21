#include "tingle/types.h"

/*
 * Recovered overlay 101 debug equipment-selection scene.
 *
 * The scene scrolls through the 74 actor/equipment records, previews the
 * selected record's sound, publishes its identifier to the actor debug
 * selection metadata, and renders the current choice through the debug font.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gDebugFont;
extern void *gSoundContext;
extern u8 gSystemState[];
extern s16 gActorTargetSelectionMetadata[];
extern const u8 data_020ec568[];

extern void *data_ov101_0221d658[];
extern const char data_ov101_0221d684[];
extern const char data_ov101_0221d6a0[];
extern const char data_ov101_0221d6a8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Scene_Init(void *scene);
extern void Scene_Destroy(void *scene);
extern void *OverlayManager_GetGlobal(void);
extern void OverlayManager_UnloadOverlay(void *manager, s32 slot);
extern void Heap_Free(void *allocation);
extern void GraphicsSpriteRenderer_ClearTextBuffer(void *font);
extern void GraphicsSpriteRenderer_Printf(void *font, s32 x, s32 y,
                                           const char *format, ...);
extern void Sound_Play(void *context, u32 soundId, u32 variant);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the caller-owned scene, install overlay 101's vtable, and select
 * record zero. The returned pointer is the same scene allocation.
 */
void *func_ov101_0221d3e0(void *scene)
{
    Scene_Init(scene);
    FIELD(void **, scene, 0) = data_ov101_0221d658;
    FIELD(s16, scene, 0x24) = 0;
    return scene;
}

/*
 * Restore overlay 101's vtable during normal destruction, release overlay
 * slot three, destroy the inherited scene, and return the caller-owned block.
 */
void *func_ov101_0221d408(void *scene)
{
    FIELD(void **, scene, 0) = data_ov101_0221d658;
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 3);
    Scene_Destroy(scene);
    return scene;
}

/*
 * Run the normal destructor and then free the scene allocation. The original
 * address is returned for ABI compatibility and must not be dereferenced.
 */
void *func_ov101_0221d438(void *scene)
{
    FIELD(void **, scene, 0) = data_ov101_0221d658;
    OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 3);
    Scene_Destroy(scene);
    Heap_Free(scene);
    return scene;
}

/* Return the signed identifier stored at the start of a 0x34-byte record. */
static s16 overlay101_record_id(s16 index)
{
    return *(const s16 *)(data_020ec568 + index * 0x34);
}

/*
 * Consume controller press/repeat bits, update the selected record, and draw
 * the debug menu. B invokes the scene's virtual normal destructor and exits;
 * A publishes the selected record identifier and plays its preview sound.
 */
s32 func_ov101_0221d470(void *scene)
{
    u16 keys = *(u16 *)(gSystemState + 0x0a);
    s16 selection;

    GraphicsSpriteRenderer_ClearTextBuffer(gDebugFont);

    if ((keys & 2) != 0) {
        if (scene != 0) {
            void (**vtable)(void *) = *(void (***)(void *))scene;
            vtable[1](scene);
        }
        return 1;
    }

    if ((keys & 1) != 0) {
        selection = FIELD(s16, scene, 0x24);
        gActorTargetSelectionMetadata[0] = overlay101_record_id(selection);
        Sound_Play(gSoundContext, 0, 0x29);
    } else if ((keys & 0xf0) != 0) {
        if ((keys & 0x40) != 0) {
            ++FIELD(s16, scene, 0x24);
            if (FIELD(s16, scene, 0x24) >= 74) {
                FIELD(s16, scene, 0x24) = 0;
            }
        } else if ((keys & 0x80) != 0) {
            --FIELD(s16, scene, 0x24);
            if (FIELD(s16, scene, 0x24) < 0) {
                FIELD(s16, scene, 0x24) = 74;
            }
        }
    }

    GraphicsSpriteRenderer_Printf(gDebugFont, 2, 0x11,
                                   data_ov101_0221d684);
    selection = FIELD(s16, scene, 0x24);
    GraphicsSpriteRenderer_Printf(gDebugFont, 2, 0x0e,
                                   data_ov101_0221d6a0,
                                   overlay101_record_id(selection));
    if (gActorTargetSelectionMetadata[0] >= 0) {
        GraphicsSpriteRenderer_Printf(gDebugFont, 2, 0x0a,
                                       data_ov101_0221d6a8,
                                       gActorTargetSelectionMetadata[0]);
    }
    return 0;
}
