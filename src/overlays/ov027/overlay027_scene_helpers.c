#include "tingle/types.h"

/* Overlay 27 scene-list synchronization, randomized spawning, and entry state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov027_021fef4c[];
extern const s32 data_ov027_021feb54[];
extern const s32 data_ov027_021fe940[];
extern void *gHeapContext;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *, void *);
extern s32 func_020918f4(void *, s32);
extern void *func_ov027_021fd408(void *, void *, const s32 *, s32);
extern void func_02095274(void *, void *);
extern void func_ov027_021fda08(void *, s32, s32);
extern void func_ov027_021fe1c8(void *);
extern void func_02059278(void *, s32, s32);
extern void func_0205929c(void *, s32, s32);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
#ifdef __cplusplus
}
#endif

/* Sets scene +0x160 to one and raises +0x98 bit 0 on every node in list +0x134. */
extern "C" void func_ov027_021fe47c(void *scene)
{
    FIELD(s32, scene, 0x160) = 1;
    for (void *node = FIELD(void *, scene, 0x134); node;
         node = FIELD(void *, node, 8))
        FIELD(u16, node, 0x98) |= 1;
}

/* Returns one only when every node in list +0x134 has +0x98 bit 1 set. */
extern "C" s32 func_ov027_021fe4a8(void *scene)
{
    for (void *node = FIELD(void *, scene, 0x134); node;
         node = FIELD(void *, node, 8)) {
        if (!(FIELD(u16, node, 0x98) & 2))
            return 0;
    }
    return 1;
}

/*
 * Obtains a sprite/resource through manager +0x58 and handle +0x74, chooses
 * one of 58 descriptor records at 0x021FEB54 using PRNG +0x5BC, allocates and
 * constructs a 0xBC-byte child with current signed value +0x5C0, appends it to
 * container +0x140, then negates +0x5C0 for the next spawn. Returns void.
 */
extern "C" void func_ov027_021fe4d4(void *scene)
{
    void *resource = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0x58),
                                    (u8 *)scene + 0x74);
    void *child = Heap_Alloc(0xbc, data_ov027_021fef4c, 4, gHeapContext);
    if (child) {
        s32 index = func_020918f4((u8 *)scene + 0x5bc, 58);
        child = func_ov027_021fd408(child, resource,
                                    data_ov027_021feb54 + index * 3,
                                    FIELD(s32, scene, 0x5c0));
    }
    func_02095274((u8 *)scene + 0x140, child);
    FIELD(s32, scene, 0x5c0) = -FIELD(s32, scene, 0x5c0);
}

/*
 * Entry state using phase +4. Phase 0 advances to phase 1 and clears +8;
 * phase 1 ensures scene flag bit 0 and copies the pair at 0x021FE940 through
 * the compact state helper. Every phase runs the central scene update and the
 * function always returns zero.
 */
extern "C" s32 func_ov027_021fe560(void *scene)
{
    s32 phase = FIELD(s32, scene, 4);
    if (phase == 0) {
        FIELD(s32, scene, 4) = 1;
        FIELD(s32, scene, 8) = 0;
        phase = 1;
    }
    if (phase == 1) {
        FIELD(u32, scene, 0x20) |= 1;
        func_ov027_021fda08(scene, data_ov027_021fe940[0],
                             data_ov027_021fe940[1]);
    }
    func_ov027_021fe1c8(scene);
    return 0;
}

/*
 * Runs the eight-phase finale at +4. Phase 0 starts sound 0xFE and waits 121
 * frames; phase 1 marks every +0x134 child; phase 2 waits for their completion
 * flags and starts a 120-tick timer at +0x5C4. Phase 3 performs four spawns at
 * 60-tick intervals then waits 240 ticks. Phase 4 advances after that wait.
 * Phase 5 performs 51 spawns at 8-tick intervals then waits 180 ticks. Phase 6
 * fades/stops sound 0xFE over 30 units; phase 7 returns one. The central scene
 * update runs every frame, including the terminal frame; other phases return
 * zero.
 */
extern "C" s32 func_ov027_021fe5c4(void *scene)
{
    switch (FIELD(s32, scene, 4)) {
    case 0:
        func_02059278(gSoundContext, 0xfe, 0x7f);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* Fall through to count the setup frame. */
    case 1:
        if (++FIELD(s32, scene, 8) > 0x78) {
            func_ov027_021fe47c(scene);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 2:
        if (func_ov027_021fe4a8(scene)) {
            func_02091b98((u8 *)scene + 0x5c4, 0x78);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 3:
        if (func_02091c7c((u8 *)scene + 0x5c4, 2)) {
            s32 count = ++FIELD(s32, scene, 8);
            if (count > 3) {
                func_02091b98((u8 *)scene + 0x5c4, 0xf0);
                ++FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
            } else {
                func_02091b98((u8 *)scene + 0x5c4, 0x3c);
                func_ov027_021fe4d4(scene);
            }
        }
        break;
    case 4:
        if (func_02091c7c((u8 *)scene + 0x5c4, 2)) {
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 5:
        if (func_02091c7c((u8 *)scene + 0x5c4, 2)) {
            s32 count = ++FIELD(s32, scene, 8);
            if (count > 0x32) {
                func_02091b98((u8 *)scene + 0x5c4, 0xb4);
                ++FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
            } else {
                func_02091b98((u8 *)scene + 0x5c4, 8);
                func_ov027_021fe4d4(scene);
            }
        }
        break;
    case 6:
        if (func_02091c7c((u8 *)scene + 0x5c4, 2)) {
            func_0205929c(gSoundContext, 0xfe, 0x1e);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 7:
        func_ov027_021fe1c8(scene);
        return 1;
    }
    func_ov027_021fe1c8(scene);
    return 0;
}
