#include "tingle/heap.h"
#include "tingle/types.h"

/* Probe the actor's nearby cells and dispatch the corresponding terrain feedback presentation. */
extern s16 data_020c9670[];
extern const char data_020df4f0[];
extern u8 *data_021052fc;
extern u8 data_021056e4[];
extern void *data_021056f4[6];
extern void *gSoundContext;
extern u8 gSceneTouchInitialData[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02005030(void *destination, const void *source);
extern void func_02005058(void *value);
extern s32 func_02008514(void *runtime, s32 x, s32 y);
extern void *func_0201f378(void *allocation, ...);
extern void *func_0201f598(void *allocation, ...);
extern void func_0201ded4(void *manager, void *presentation);
extern s32 func_020343e4(void *actor, s32 x, s32 y);
extern void *func_0203a0b4(u32 index);
extern void func_02072bdc(void *sprite, u32 animation);
extern void Sound_Play(void *context, s32 channel, s32 sound);
#ifdef __cplusplus
}
#endif

/* Allocate and register the offset-sprite feedback described by one table resource. */
static void spawnOffsetFeedback(const s32 *position, const u8 *resource)
{
    void *allocation = Heap_Alloc(0x14, data_020df4f0, 4, &gHeapContext);
    void *presentation = 0;
    void *group = **(void ***)(data_021052fc + 0x2ea4 + 0x54);

    if (allocation != 0) {
        presentation = func_0201f378(
            allocation, position, 0, group, *(s32 *)(resource + 4),
            *(s32 *)(resource + 8), *(s32 *)(resource + 0x0c), -4, 0);
    }
    func_0201ded4(data_021052fc + 0x2f7c, presentation);
}

/* Play a packed table sound, whose high bits select the channel and low seven bits the cue. */
static void playPackedSound(u16 packed)
{
    if (packed != 0)
        Sound_Play(gSoundContext, packed >> 7, packed & 0x7f);
}

/*
 * Copy actor position +0x18, offset and quantize its X/Y from the low three
 * bits of direction byte +0xd4, then inspect the surrounding 3x3 cells.
 * Terrain at the actor's height is decoded through the runtime map object's
 * virtual +0x2c query: codes 24/25 select resource two, subtypes four/five
 * select resources four/five, and any other encountered or higher cell can
 * select resource fifteen. Code 24 additionally requires func_02008514.
 *
 * Resource two creates a sampled-arc entry in the first free one of six global
 * slots (evicting the entry with the greatest nested sprite halfword +0x28 if
 * full), advances each live sprite timer, and changes sufficiently old sprites
 * in states zero through two to animation three. The other cases create and
 * register offset-sprite feedback. Play the selected resource record's packed
 * sound and return zero, one, or two for the respective feedback class; return
 * -1 if no feedback class was selected. Temporary-vector, terrain, heap,
 * virtual, presentation, animation, and sound calls all have observable engine
 * or SDK effects. The matching assembly below preserves retail control flow.
 */
s32 func_0203a314(void *self)
{
    u8 *actor = (u8 *)self;
    s32 position[4];
    s32 found24 = 0;
    s32 found24or25 = 0;
    s32 foundSubtype4 = 0;
    s32 foundSubtype5 = 0;
    s32 foundAny = 0;
    s32 result = -1;
    s32 direction = actor[0xd4] & 7;
    s16 first;
    s16 second;
    s32 centerX;
    s32 centerY;
    s32 dx;
    s32 dy;
    u16 sound = 0;

    func_02005030(position, actor + 0x18);
    first = data_020c9670[direction * 0x400];
    second = data_020c9670[direction * 0x400 + 1];
    position[1] = (position[1] - first * 12) & ~0xfff;
    position[2] = (position[2] + second * 12) & ~0xfff;
    centerX = position[1] >> 12;
    centerY = position[2] >> 12;

    for (dx = -8; dx <= 8 && !found24; dx += 8) {
        s32 x = (centerX + dx) >> 4;
        for (dy = -8; dy <= 8; dy += 8) {
            s32 y = (centerY + dy) >> 4;
            s32 height = func_020343e4(actor, x, y) << 16;
            if (position[3] == height) {
                u8 *map = *(u8 **)(data_021052fc + 0x2ed4);
                u32 cell = (*(u32 (**)(void *, s32, s32))(*(u8 **)map + 0x2c))(
                    map, x, y);
                u32 kind = (cell >> 5) & 0x1f;
                u32 subtype = (cell >> 10) & 0x0f;
                if (kind == 24 || kind == 25) {
                    found24or25 = 1;
                    if (kind == 24)
                        found24 = 1;
                    if (func_02008514(data_021052fc, x << 16, y << 16) != 0)
                        goto scanComplete;
                }
                if (subtype == 4)
                    foundSubtype4 = 1;
                else if (subtype == 5)
                    foundSubtype5 = 1;
                foundAny = 1;
            } else if (height > position[3]) {
                foundAny = 1;
            }
        }
    }

scanComplete:
    if (found24or25) {
        if (found24) {
            u8 *resource = (u8 *)func_0203a0b4(2);
            if (resource != 0) {
                void **slot = 0;
                void **oldest = 0;
                s32 i;
                for (i = 0; i < 6; ++i) {
                    if (data_021056f4[i] == 0) {
                        slot = &data_021056f4[i];
                        break;
                    }
                    if (oldest == 0 ||
                        *(u16 *)(*(u8 **)((u8 *)data_021056f4[i] + 8) + 0x28) >
                        *(u16 *)(*(u8 **)((u8 *)*oldest + 8) + 0x28)) {
                        oldest = &data_021056f4[i];
                    }
                }
                if (slot == 0) {
                    if (*oldest != 0)
                        (*(void (**)(void *))**(void ***)oldest)(*oldest);
                    *oldest = 0;
                    slot = oldest;
                }
                {
                    void *allocation = Heap_Alloc(0x0c, data_020df4f0, 4,
                                                  &gHeapContext);
                    void *presentation = 0;
                    void *group = **(void ***)(data_021052fc + 0x2ea4 + 0x54);
                    if (allocation != 0)
                        presentation = func_0201f598(
                            allocation, position, group,
                            *(s32 *)(resource + 4), *(s32 *)(resource + 8),
                            *(s32 *)(resource + 0x0c), 0xfde8);
                    *slot = presentation;
                }
                for (i = 0; i < 6; ++i) {
                    if (data_021056f4[i] != 0) {
                        u8 *sprite = *(u8 **)(*(u8 **)((u8 *)data_021056f4[i] + 8) + 4);
                        u16 old = *(u16 *)(sprite + 0x28);
                        *(u16 *)(sprite + 0x28) = old + 1;
                        if (old >= 0xfdec && sprite[0x39] <= 2) {
                            func_02072bdc(sprite, 3);
                            *(u16 *)(sprite + 0x24) &= ~1;
                        }
                    }
                }
            }
            resource = (u8 *)func_0203a0b4(3);
            if (resource != 0)
                spawnOffsetFeedback(position, resource);
            result = 0;
            sound = *(u16 *)(*(u8 **)(data_021056e4 + 4) + 0x0e);
        }
    } else if (foundSubtype5 || foundSubtype4) {
        u32 resourceIndex = foundSubtype5 ? 5 : 4;
        u8 *resource = (u8 *)func_0203a0b4(resourceIndex);
        if (resource != 0)
            spawnOffsetFeedback(position, resource);
        result = 1;
        sound = *(u16 *)(*(u8 **)(data_021056e4 + 4) +
                         (resourceIndex - 1) * 8 + 6);
    } else if (foundAny) {
        u8 *resource = (u8 *)func_0203a0b4(15);
        if (resource != 0)
            spawnOffsetFeedback(position, resource);
        result = 2;
        sound = *(u16 *)(*(u8 **)(data_021056e4 + 4) + 0x76);
    }

    playPackedSound(sound);
    func_02005058(position);
    return result;
}
