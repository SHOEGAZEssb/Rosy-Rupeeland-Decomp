#include "tingle/types.h"

/* Overlay 36 configured randomized-effect and auxiliary-handle spawning. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205ccc[];
extern const u8 data_ov036_02206158[];
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov036_021fe258(void *object, const void *config);
extern void *func_02077308(void *manager, void *resourceSet);
extern void func_ov036_021ff050(void *handle, s32 mode,
                                s32 x, s32 y, s32 z,
                                s32 byte5A, s32 flags);
extern void func_02095274(void *list, void *object);
extern void Sound_Play(void *context, s32 id, s32 variant);
extern void func_02076be8(void *handle, u8 mode);
#ifdef __cplusplus
}
#endif

/*
 * Spawns one randomized effect for configIndex. Each configuration occupies
 * 0x20 bytes in data_ov036_02205CCC. A 0xD4-byte effect is constructed and an
 * auxiliary handle is created from controller manager +0xDC with resource set
 * +0xE0 when config +0x18 is nonzero, otherwise +0xEC. The handle is initialized
 * at the origin with byte +0x5A=2 and flags 0x46, the effect is appended to list
 * +0x108, and sound 0x1CC plays variant 4 when config +0x1C equals 2, otherwise
 * variant 3. It returns nothing; heap, resource, list, sound, and effect state
 * change. As in the original, later accesses assume effect allocation succeeds.
 */
extern "C" void func_ov036_021fef6c(void *controller, s32 configIndex)
{
    const void *config = data_ov036_02205ccc + configIndex * 0x20;
    void *effect = Heap_Alloc(0xd4, data_ov036_02206158, 4, gHeapContext);
    if (effect != 0)
        effect = func_ov036_021fe258(effect, config);

    void *resourceSet = (u8 *)controller +
        (FIELD(s32, config, 0x18) != 0 ? 0xe0 : 0xec);
    void *handle = func_02077308(FIELD(void *, controller, 0xdc), resourceSet);
    FIELD(void *, effect, 0xcc) = handle;
    func_ov036_021ff050(handle, 0, 0, 0, 0, 2, 0x46);
    func_02095274((u8 *)controller + 0x108, effect);
    Sound_Play(gSoundContext, 0x1cc,
               FIELD(s32, config, 0x1c) == 2 ? 4 : 3);
}

/*
 * Initializes an auxiliary handle. mode is truncated to eight bits for the
 * common initializer; x/y/z are stored at +0x20/+0x24/+0x28, byte5A is
 * truncated at +0x5A, and flags are ORed into halfword +0x50. It returns
 * nothing and changes only the handle and common resource state.
 */
extern "C" void func_ov036_021ff050(void *handle, s32 mode,
                                     s32 x, s32 y, s32 z,
                                     s32 byte5A, s32 flags)
{
    func_02076be8(handle, (u8)mode);
    FIELD(s32, handle, 0x20) = x;
    FIELD(s32, handle, 0x24) = y;
    FIELD(s32, handle, 0x28) = z;
    FIELD(u8, handle, 0x5a) = (u8)byte5A;
    FIELD(u16, handle, 0x50) |= (u16)flags;
}
