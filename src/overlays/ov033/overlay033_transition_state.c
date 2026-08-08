#include "tingle/types.h"

/* Overlay 33 four-stage transition, effect launch, and actor rebinding state. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021052fc;
extern void *gGameWork;
extern const u8 data_ov033_021fdd60[];
extern const u8 data_ov033_021fdd2c[];
extern const s32 data_ov033_021fdd18[];
extern const u8 data_ov033_021fdec8[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02094bbc(void *group, s32 x, s32 y, s32 mode);
extern void func_02094cf0(void *group, const void *sequence, s32 mode);
extern void GameWork_SetFlag(void *gameWork, s32 flag);
extern void func_02007f24(void *context, s32 first, s32 second, s32 third,
                         s32 fourth, s32 fifth);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                       void *heapContext);
extern void *func_0200c680(void *object);
extern void func_02092c8c(s32 first, s32 second);
extern void func_ov033_021fd598(void *scene);
extern void func_0204b6cc(void *object);
extern void func_ov033_021fd04c(void *scene, s32 callbackWord,
                               s32 adjustmentWord);
extern void func_020740a4(void *spriteContext);
#ifdef __cplusplus
}
#endif

typedef s32 (*Overlay033UpdateMethod)(void *object);
typedef void (*Overlay033ActorMethod)(void *object, s32 enabled);

/* Returns nonzero when the sprite group's virtual update at vtable +8 completes. */
static s32 update_group(void *group)
{
    return FIELD(Overlay033UpdateMethod, FIELD(void *, group, 0), 8)(group);
}

/*
 * Refreshes the optional active actor from global +0x2EA8. Types 5/12 and flag
 * 0x40000 are rejected; accepted actors receive the same preparation and
 * virtual disable call used by scene construction. This is confirmed control
 * flow, while the semantic meaning of the type/flag remains inferred.
 */
static void refresh_secondary(void *scene, void *global)
{
    void *secondary = FIELD(void *, (u8 *)global + 0x2000, 0xea8);
    FIELD(void *, scene, 8) = secondary;
    if (secondary == 0)
        return;
    s16 type = FIELD(s16, secondary, 0xd6);
    if (type == 5 || type == 12 ||
        (FIELD(u32, secondary, 0x268) & 0x40000) != 0) {
        FIELD(void *, scene, 8) = 0;
        return;
    }
    func_0204b6cc(secondary);
    FIELD(Overlay033ActorMethod, FIELD(void *, secondary, 0), 0x54)(secondary, 0);
}

/*
 * Runs a four-state transition at scene +0xD0. State 0 seeds the group from the
 * primary actor position and starts sequence 0x021FDD60. State 1 waits for its
 * virtual update; while waiting it advances actor motion and triggers a cue at
 * the recovered group-frame boundary. On completion it sets GameWork flags
 * 0x3F8/0x386, starts effect parameters (0x69,0x80,0x280), constructs a 0x24-
 * byte auxiliary effect, and advances. State 2 rebinds primary/secondary actors,
 * suppresses two primary sprites, resets cue state, and starts sequence
 * 0x021FDD2C. State 3 waits for completion, installs callback 0x021FDD18, and
 * continues actor motion. Every call updates the sprite context and returns 0.
 * Persistent flags, heap, effect, actor, sprite, and callback state may change;
 * no direct MMIO occurs.
 */
extern "C" s32 func_ov033_021fd738(void *scene)
{
    s32 state = FIELD(s32, scene, 0xd0);
    void *group = FIELD(void *, scene, 0x48);

    if (state == 0) {
        void *primary = FIELD(void *, scene, 4);
        func_02094bbc(group, FIELD(s32, primary, 0x1c) / 0x1000,
                      FIELD(s32, primary, 0x20) / 0x1000, 0);
        func_02094cf0(group, data_ov033_021fdd60, 0);
        FIELD(s32, scene, 0xd0) = 1;
        state = 1;
    }

    if (state == 1) {
        if (update_group(group)) {
            GameWork_SetFlag(gGameWork, 0x3f8);
            GameWork_SetFlag(gGameWork, 0x386);
            func_02007f24(data_021052fc, 0x69, 0x80, 0x280, 0, 0);
            void *effect = Heap_Alloc(0x24, data_ov033_021fdec8, -4,
                                      gHeapContext);
            if (effect != 0)
                func_0200c680(effect);
            FIELD(s32, scene, 0xd0) = 2;
        } else {
            if ((FIELD(u16, group, 0x98) & 1) != 0 &&
                FIELD(s32, group, 0x80) == FIELD(s32, group, 0x7c) - 0x10)
                func_02092c8c(3, 0x10);
            func_ov033_021fd598(scene);
        }
    } else if (state == 2) {
        void *global = data_021052fc;
        void *primary = FIELD(void *, (u8 *)global + 0x2000, 0xea4);
        FIELD(void *, scene, 4) = primary;
        FIELD(u16, FIELD(void *, primary, 0x54), 0x24) |= 0x10;
        FIELD(u16, FIELD(void *, primary, 0xa8), 0x24) |= 0x10;
        refresh_secondary(scene, global);
        func_02092c8c(3, 0);
        func_02094cf0(group, data_ov033_021fdd2c, 0);
        FIELD(s32, scene, 0xd0) = 3;
    } else if (state == 3) {
        if (update_group(group))
            func_ov033_021fd04c(scene, data_ov033_021fdd18[0],
                               data_ov033_021fdd18[1]);
        func_ov033_021fd598(scene);
    }

    func_020740a4(FIELD(void *, scene, 0));
    return 0;
}
