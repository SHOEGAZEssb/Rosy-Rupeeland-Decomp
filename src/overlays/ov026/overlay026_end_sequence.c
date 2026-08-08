#include "tingle/types.h"

/* Overlay 26 end-sequence staging for scene objects and composite effects. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s32 data_ov026_0220416c[];
extern const s32 data_ov026_022041ac[];
extern const s32 data_ov026_022041ec[];
extern const s32 data_ov026_0220422c[];
extern const s32 data_ov026_022044b0[];
extern const s32 data_ov026_022040b0[];
extern const s32 data_ov026_02204134[];
extern const s32 data_ov026_022042b4[];
extern const s32 data_ov026_022043e4[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020948d4(void *, s32);
extern void func_020948e4(void *, s32, s32);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern void func_02092260(void *, s32);
extern void func_020b0300(u16, s32, s32, s32, s32);
extern void func_020b0374(s32, s32, s32, s32);
extern void func_02094bbc(void *, s32, s32, s32);
extern void func_02094cf0(void *, const void *, s32);
extern s32 func_02094d28(void *, s32, s32, s32);
extern s32 func_02095224(void *);
extern s32 func_02095248(void *);
extern void func_02095308(void *);
extern void func_ov026_021fe8fc(void *, u16, s32, s32, s32, s32, s32,
                                s32);
extern void func_ov026_021fec34(void *, s32, s32, s32, u16, u16);
extern void func_ov026_021fef70(void *, s32);
extern void func_ov026_022009dc(void *);
extern s32 func_ov026_02200d08(void *);
extern void func_ov026_02200d20(void *, s32, s32, s32);
extern void func_ov026_02200d38(void *);
extern void func_ov026_02200dd8(void *, s32);
extern void func_ov026_022013c0(void *, s32, s32);
extern void func_ov026_02203168(void *, s32, s32, s32);
extern void func_ov026_02203178(void *, s32, s32, s32);
extern void func_ov026_02203580(void *);
#ifdef __cplusplus
}
#endif

/*
 * Drives the two-state end-sequence at scene +0x79C. State 0 resets the
 * +0x304 controller, positions the +0x1C0 vector, configures the objects held
 * at +0x2E8/+0x2EC and +0x164/+0x168/+0x16C/+0x17C, and starts the 64-byte
 * control block at 0x0220416C. State 1 mirrors the controller's interpolated
 * value into the +0x74 vector and the +0x16C object. The object roles are
 * inferred from neighboring render/setup code; the offsets remain canonical.
 * Runs the central scene update every frame and returns one when the +0x160
 * controller reports completion, otherwise zero.
 */
extern "C" s32 func_ov026_02202f4c(void *scene)
{
    s32 control[16];
    for (s32 i = 0; i < 16; ++i)
        control[i] = data_ov026_0220416c[i];

    s32 state = FIELD(s32, scene, 0x79c);
    if (state == 0) {
        func_02095308((u8 *)scene + 0x304);
        func_ov026_02203168((u8 *)scene + 0x1c0, 0x424, 0xf74, 0);
        func_02094bbc(FIELD(void *, scene, 0x2e8), -0x385, 0,
                       -0x13ae);
        func_02094bbc(FIELD(void *, scene, 0x2ec), -0x385, 0x1bd7, 0);
        func_02094cf0(FIELD(void *, scene, 0x160), control, 0);

        void *child164 = FIELD(void *, scene, 0x164);
        func_020948d4((u8 *)child164 + 0x1c, 0x1800);
        func_020948d4((u8 *)child164 + 0x6c, 0x4000);
        FIELD(s32, child164, 0xb8) = 0x10000;

        func_ov026_021fe8fc(FIELD(void *, scene, 0x16c), 0x2108, 0x18,
                            0x385, 0x99a, 0x800, 0x333, -0x19a);

        void *child168 = FIELD(void *, scene, 0x168);
        func_020948d4((u8 *)child168 + 0x1c, 0x1800);
        func_020948d4((u8 *)child168 + 0x6c, 0x4000);
        FIELD(s32, child168, 0xb4) = 0x6000;

        void *child17c = FIELD(void *, scene, 0x17c);
        func_02094bbc(child17c, 0x43d7, 0x20000, 0x118f6);
        func_020948d4((u8 *)child17c + 0x6c, 0x10000);
        func_020948d4((u8 *)child17c + 0x3c, 0x4000);
        FIELD(s32, child17c, 0xa0) = 0;
        func_020948e4((u8 *)child17c + 0xc, 1, 0x2000);
        FIELD(s32, child17c, 0x7c) = 0xb4;
        FIELD(s32, child17c, 0x80) = 0;

        ++FIELD(s32, scene, 0x79c);
    }

    if (state == 0 || state == 1) {
        s32 value = func_02094d28(FIELD(void *, scene, 0x160), 1, 0x1000,
                                  0);
        func_ov026_02203178(FIELD(void *, scene, 0x74), 0, value, 0);
        func_02094bbc(FIELD(void *, scene, 0x16c), 0,
                       FIELD(s32, FIELD(void *, scene, 0x160), 0x20), 0);
        if (func_02095224(FIELD(void *, scene, 0x160)) != 0) {
            func_ov026_022009dc(scene);
            return 1;
        }
    }

    func_ov026_022009dc(scene);
    return 0;
}

/*
 * Alternate two-state end-sequence using control block 0x022041AC. State 0
 * resets the same controller family, applies a second set of fixed positions
 * and particle ranges, and advances +0x79C. State 1 writes the controller's
 * 0x4000-to--0x2000 interpolation into the middle component of the +0x74
 * vector. Runs the central update each frame and returns one only when the
 * +0x160 controller completes.
 */
extern "C" s32 func_ov026_02203188(void *scene)
{
    s32 control[16];
    for (s32 i = 0; i < 16; ++i)
        control[i] = data_ov026_022041ac[i];

    s32 state = FIELD(s32, scene, 0x79c);
    if (state == 0) {
        func_02095308((u8 *)scene + 0x304);
        func_ov026_02203168((u8 *)scene + 0x1c0, -0xd6, 0xffa, 0);
        func_02094bbc(FIELD(void *, scene, 0x2e8), 0x19a, 0x499a,
                       -0x1266);
        func_02094bbc(FIELD(void *, scene, 0x2ec), 0x19a, 0x2266, 0);
        func_02094cf0(FIELD(void *, scene, 0x160), control, 0);

        void *child164 = FIELD(void *, scene, 0x164);
        func_020948d4((u8 *)child164 + 0x1c, -0xdccd);
        func_020948d4((u8 *)child164 + 0x6c, 0x4000);
        FIELD(s32, child164, 0xb8) = 0x18000;

        func_02094bbc(FIELD(void *, scene, 0x16c), 0, 0x1000, 0);
        func_ov026_021fe8fc(FIELD(void *, scene, 0x16c), 0x4210, 0x40,
                            0x4cd, 0x1000, 0x1800, 0x666, 0xcd);

        void *child168 = FIELD(void *, scene, 0x168);
        func_020948d4((u8 *)child168 + 0x1c, -0xdccd);
        func_020948d4((u8 *)child168 + 0x6c, 0x4000);
        FIELD(s32, child168, 0xb4) = 0xa000;

        void *child17c = FIELD(void *, scene, 0x17c);
        func_02094bbc(child17c, 0x4214, -0xaa8f, 0x6000);
        func_020948d4((u8 *)child17c + 0x6c, 0xab33);
        func_020948d4((u8 *)child17c + 0x3c, 0);
        FIELD(s32, child17c, 0xa0) = 0;
        func_020948e4((u8 *)child17c + 0xc, 1, 0x2000);
        FIELD(s32, child17c, 0x7c) = 0xb4;
        FIELD(s32, child17c, 0x80) = 0;

        ++FIELD(s32, scene, 0x79c);
    }

    if (state == 0 || state == 1) {
        s32 value = func_02094d28(FIELD(void *, scene, 0x160), 1, 0x4000,
                                  -0x2000);
        func_ov026_02203178(FIELD(void *, scene, 0x74), 0, value, 0);
        if (func_02095224(FIELD(void *, scene, 0x160)) != 0) {
            func_ov026_022009dc(scene);
            return 1;
        }
    }

    func_ov026_022009dc(scene);
    return 0;
}

/*
 * Third two-state end-sequence, using control block 0x022041EC. State 0
 * preserves the +0x2E8 object's old +0x20 value while reconfiguring paired
 * objects, then sets up the +0x164 mesh, +0x170 panel emitter, +0x16C particle
 * emitter, and +0x17C object. State 1 distributes the controller interpolation
 * and current +0x2E8 value across the paired objects. Runs the central update
 * each frame and returns one only when controller +0x160 completes.
 */
extern "C" s32 func_ov026_022033a0(void *scene)
{
    s32 control[16];
    for (s32 i = 0; i < 16; ++i)
        control[i] = data_ov026_022041ec[i];

    s32 state = FIELD(s32, scene, 0x79c);
    if (state == 0) {
        func_02095308((u8 *)scene + 0x304);
        func_ov026_02203580((u8 *)scene + 0x1c0);

        void *object2e8 = FIELD(void *, scene, 0x2e8);
        s32 old_value = FIELD(s32, object2e8, 0x20);
        func_02094bbc(object2e8, 0, 0x1800, -0x2000);
        func_02094bbc(FIELD(void *, scene, 0x2ec), 0, old_value, 0);
        func_02094cf0(FIELD(void *, scene, 0x160), control, 0);

        void *child164 = FIELD(void *, scene, 0x164);
        func_020948d4((u8 *)child164 + 0x1c, 0);
        func_020948d4((u8 *)child164 + 0x6c, 0x4000);
        FIELD(s32, child164, 0xb8) = 0x8000;

        func_ov026_021fec34(FIELD(void *, scene, 0x170), 8, 0x1000,
                            0xccd, 0x7fff, 0x1f);
        func_ov026_021fe8fc(FIELD(void *, scene, 0x16c), 0x2108, 0x10,
                            0x400, 0x666, 0x666, 0x666, -0xcd);

        void *child17c = FIELD(void *, scene, 0x17c);
        func_02094bbc(child17c, 0, 0x3000, 0x8000);
        func_020948d4((u8 *)child17c + 0x6c, 0x7000);
        func_020948d4((u8 *)child17c + 0x3c, 0);
        FIELD(s32, child17c, 0xa0) = 0;

        ++FIELD(s32, scene, 0x79c);
    }

    if (state == 0 || state == 1) {
        s32 value = func_02094d28(FIELD(void *, scene, 0x160), 1, 0x1800,
                                  0x5800);
        void *object2e8 = FIELD(void *, scene, 0x2e8);
        func_020948d4((u8 *)object2e8 + 0x1c, value);
        s32 shared_value = FIELD(s32, object2e8, 0x20);
        func_020948d4((u8 *)FIELD(void *, scene, 0x2ec) + 0x1c,
                       shared_value);
        func_020948d4((u8 *)FIELD(void *, scene, 0x16c) + 0x1c,
                       shared_value + 0x800);
        if (func_02095224(FIELD(void *, scene, 0x160)) != 0) {
            func_ov026_022009dc(scene);
            return 1;
        }
    }

    func_ov026_022009dc(scene);
    return 0;
}

/*
 * Fourth two-state end-sequence, using control block 0x0220422C. State 0
 * resets the +0x304 controller and applies fixed transforms to the paired
 * +0x2E8/+0x2EC objects, +0x164/+0x168 children, camera-like vector +0x74,
 * and +0x17C child. State 1 only waits for controller +0x160. Runs the central
 * update every frame and returns one when that controller completes.
 */
extern "C" s32 func_ov026_02203598(void *scene)
{
    s32 control[16];
    for (s32 i = 0; i < 16; ++i)
        control[i] = data_ov026_0220422c[i];

    s32 state = FIELD(s32, scene, 0x79c);
    if (state == 0) {
        func_02095308((u8 *)scene + 0x304);
        func_ov026_02203168((u8 *)scene + 0x1c0, -0x165, 0xff0, 0);
        func_02094bbc(FIELD(void *, scene, 0x2e8), 0x148, 0, -0xccd);
        func_02094bbc(FIELD(void *, scene, 0x2ec), 0x148, 0x1a66, 0);
        func_02094cf0(FIELD(void *, scene, 0x160), control, 0);

        void *child164 = FIELD(void *, scene, 0x164);
        func_020948d4((u8 *)child164 + 0x1c, 0x1800);
        func_020948d4((u8 *)child164 + 0x6c, 0x4000);
        FIELD(s32, child164, 0xb8) = 0x10000;

        func_ov026_02203178(FIELD(void *, scene, 0x74), 0, 0x2000, 0);

        void *child168 = FIELD(void *, scene, 0x168);
        func_020948d4((u8 *)child168 + 0x1c, 0x1800);
        func_020948d4((u8 *)child168 + 0x6c, 0x4000);
        FIELD(s32, child168, 0xb4) = 0x8000;

        void *child17c = FIELD(void *, scene, 0x17c);
        func_02094bbc(child17c, -0x30a, 0x20000, 0xb3d7);
        func_020948d4((u8 *)child17c + 0x6c, 0xc000);
        func_020948d4((u8 *)child17c + 0x3c, 0x4000);
        FIELD(s32, child17c, 0xa0) = 0;
        func_020948e4((u8 *)child17c + 0x6c, 1, 0x10000);
        FIELD(s32, child17c, 0x7c) = 0xb4;
        FIELD(s32, child17c, 0x80) = 0;

        ++FIELD(s32, scene, 0x79c);
    }

    if ((state == 0 || state == 1) &&
        func_02095224(FIELD(void *, scene, 0x160)) != 0) {
        func_ov026_022009dc(scene);
        return 1;
    }
    func_ov026_022009dc(scene);
    return 0;
}

/*
 * Runs a four-state finale using the 232-byte control block at 0x022044B0.
 * State 0 applies orbit, object, mesh, and particle presets. State 1 waits for
 * the controller's intermediate condition, clears its +0x90 field, and starts
 * a 60-tick timer at scene +0x7A8. State 2 waits in timer mode 2 and emits
 * scene event 0x7B80. State 3 accelerates the orbit by eight until controller
 * completion. The central update always runs; one is returned only at the end.
 */
extern "C" s32 func_ov026_02203748(void *scene)
{
    s32 control[58];
    for (s32 i = 0; i < 58; ++i)
        control[i] = data_ov026_022044b0[i];

    switch (FIELD(s32, scene, 0x79c)) {
    case 0:
        func_ov026_02203580((u8 *)scene + 0x1c0);
        func_ov026_02200d20(scene, 0x8000, 0x2000, 0);
        func_020948d4((u8 *)FIELD(void *, scene, 0x2e8) + 0x1c, 0x1000);
        func_ov026_022013c0(scene, 0x13800, -0x1666);
        func_02094cf0(FIELD(void *, scene, 0x160), control, 0);
        func_02094bbc(FIELD(void *, scene, 0x16c), 0, 0, 0);
        func_ov026_021fe8fc(FIELD(void *, scene, 0x16c), 0, 0x10,
                            0x385, 0x666, 0x1000, 0x333, 0x52);
        ++FIELD(s32, scene, 0x79c);
        /* Fall through: the newly started controller may already be ready. */
    case 1:
        if (func_02095248(FIELD(void *, scene, 0x160)) != 0) {
            FIELD(s32, FIELD(void *, scene, 0x160), 0x90) = 0;
            func_02091b98((u8 *)scene + 0x7a8, 0x3c);
            ++FIELD(s32, scene, 0x79c);
        }
        break;
    case 2:
        if (func_02091c7c((u8 *)scene + 0x7a8, 2) != 0) {
            func_02092260(scene, 0x7b80);
            ++FIELD(s32, scene, 0x79c);
        }
        break;
    case 3:
        func_ov026_02200dd8(scene, 8);
        if (func_02095224(FIELD(void *, scene, 0x160)) != 0) {
            func_ov026_022009dc(scene);
            return 1;
        }
        break;
    }
    func_ov026_022009dc(scene);
    return 0;
}

/*
 * Runs a four-state finale using the 28-byte control block at 0x022040B0.
 * State 0 resets two controllers, applies display/palette parameters, clears
 * hardware register 0x04000358, and configures the scene objects. States 1
 * and 2 drive the +0x174 child's control value until two motion completions;
 * state 3 finishes immediately. The central update always runs, and only
 * state 3 returns one.
 */
extern "C" s32 func_ov026_022038fc(void *scene)
{
    s32 control[7];
    for (s32 i = 0; i < 7; ++i)
        control[i] = data_ov026_022040b0[i];

    switch (FIELD(s32, scene, 0x79c)) {
    case 0: {
        func_02095308((u8 *)scene + 0x304);
        func_02095308((u8 *)scene + 0x314);
        func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
        *(volatile u32 *)0x04000358 = 0;
        func_ov026_02203580((u8 *)scene + 0x1c0);
        func_02094bbc(FIELD(void *, scene, 0x2e8), 0, 0, 0x1f33);
        func_02094bbc(FIELD(void *, scene, 0x2ec), 0, 0x47b, 0);
        func_ov026_02200d20(scene, 0xe900, 0x1f33, 0);
        func_ov026_02200d38(scene);
        func_02094cf0(FIELD(void *, scene, 0x160), control, 0);

        void *child168 = FIELD(void *, scene, 0x168);
        func_020948d4((u8 *)child168 + 0x1c, 0);
        func_020948d4((u8 *)child168 + 0x6c, 0x1000);
        FIELD(s32, child168, 0xb4) = 0x800;

        void *child174 = FIELD(void *, scene, 0x174);
        func_ov026_021fef70(child174, 0x4f6);
        FIELD(s32, child174, 0x7c) = 0x1e;
        FIELD(s32, child174, 0x80) = 0;

        void *child17c = FIELD(void *, scene, 0x17c);
        func_02094bbc(child17c, -0x4000, 0x3000, -0x8000);
        func_020948d4((u8 *)child17c + 0x6c, 0x4000);
        func_020948d4((u8 *)child17c + 0x3c, 0);
        FIELD(s32, child17c, 0xa0) = 1;
        ++FIELD(s32, scene, 0x79c);
        /* Fall through to begin driving +0x174 on the setup frame. */
    }
    case 1: {
        void *child174 = FIELD(void *, scene, 0x174);
        if (func_ov026_02200d08(child174) != 0) {
            FIELD(s32, child174, 0x7c) = 0x1e;
            FIELD(s32, child174, 0x80) = 0;
            ++FIELD(s32, scene, 0x79c);
        } else {
            s32 value = func_02094d28(child174, 5, 0x4f6, -0xcd);
            func_ov026_021fef70(child174, value);
        }
        break;
    }
    case 2:
        if (func_ov026_02200d08(FIELD(void *, scene, 0x174)) != 0)
            ++FIELD(s32, scene, 0x79c);
        break;
    case 3:
        func_ov026_022009dc(scene);
        return 1;
    }
    func_ov026_022009dc(scene);
    return 0;
}

/*
 * Runs a two-state display finale using control block 0x02204134. State 0
 * resets +0x304, applies palette/display parameters, clears hardware register
 * 0x04000358, derives controller +0x1C from field +0x13C, and installs fixed
 * transforms on the paired and +0x158/+0x168/+0x17C children. State 1 waits
 * for controller completion. The central update always runs; completion
 * returns one and all other paths return zero.
 */
extern "C" s32 func_ov026_02203b10(void *scene)
{
    s32 control[14];
    for (s32 i = 0; i < 14; ++i)
        control[i] = data_ov026_02204134[i];

    s32 state = FIELD(s32, scene, 0x79c);
    if (state == 0) {
        func_02095308((u8 *)scene + 0x304);
        func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
        *(volatile u32 *)0x04000358 = 0;
        func_ov026_02203168((u8 *)scene + 0x1c0, -0x165, 0xff0, 0);
        func_02094bbc(FIELD(void *, scene, 0x2e8), 0x1ec, 0, -0xc29);
        func_02094bbc(FIELD(void *, scene, 0x2ec), 0x1ec, 0x22e1, 0);

        void *controller = FIELD(void *, scene, 0x160);
        func_020948d4((u8 *)controller + 0x1c,
                       (FIELD(s32, controller, 0x13c) << 10) - 0x4000);
        func_02094cf0(controller, control, 0);

        void *child168 = FIELD(void *, scene, 0x168);
        func_020948d4((u8 *)child168 + 0x1c, 0x1800);
        func_020948d4((u8 *)child168 + 0x6c, 0x4000);
        FIELD(s32, child168, 0xb4) = 0x10000;

        void *child158 = FIELD(void *, scene, 0x158);
        FIELD(s32, child158, 0x38) = 0x8000;
        FIELD(s32, child158, 0x34) = 0x8000;
        FIELD(s32, child158, 0x20) = 0;
        FIELD(s32, child158, 0x24) = 0x40000;
        FIELD(s32, child158, 0x28) = 0;

        void *child17c = FIELD(void *, scene, 0x17c);
        func_02094bbc(child17c, 0, 0x44000, 0);
        func_020948d4((u8 *)child17c + 0x6c, 0x10000);
        func_020948d4((u8 *)child17c + 0x3c, 0x4000);
        FIELD(s32, child17c, 0xa0) = 0;
        ++FIELD(s32, scene, 0x79c);
    }

    if ((state == 0 || state == 1) &&
        func_02095224(FIELD(void *, scene, 0x160)) != 0) {
        func_ov026_022009dc(scene);
        return 1;
    }
    func_ov026_022009dc(scene);
    return 0;
}

/*
 * Two-state paired-object finale using the 72-byte block at 0x022042B4.
 * State 0 preserves +0x2E8 field +0x20, repositions +0x2E8/+0x2EC, configures
 * the +0x16C particle emitter and +0x17C child, and starts controller +0x160.
 * State 1 distributes the controller interpolation and paired-object value.
 * Always runs the central update and returns one only on completion.
 */
extern "C" s32 func_ov026_02203cc0(void *scene)
{
    s32 control[18];
    for (s32 i = 0; i < 18; ++i)
        control[i] = data_ov026_022042b4[i];

    s32 state = FIELD(s32, scene, 0x79c);
    if (state == 0) {
        func_02095308((u8 *)scene + 0x304);
        func_ov026_02203580((u8 *)scene + 0x1c0);
        void *object2e8 = FIELD(void *, scene, 0x2e8);
        s32 old_value = FIELD(s32, object2e8, 0x20);
        func_02094bbc(object2e8, 0, 0x1800, -0x2000);
        func_02094bbc(FIELD(void *, scene, 0x2ec), 0, old_value, 0);
        func_02094cf0(FIELD(void *, scene, 0x160), control, 0);
        func_ov026_021fe8fc(FIELD(void *, scene, 0x16c), 0x2108, 0x10,
                            0x400, 0x666, 0x666, 0x666, -0xcd);

        void *child17c = FIELD(void *, scene, 0x17c);
        func_02094bbc(child17c, 0, 0x5000, 0x8000);
        func_020948d4((u8 *)child17c + 0x6c, 0x6000);
        func_020948d4((u8 *)child17c + 0x3c, 0);
        FIELD(s32, child17c, 0xa0) = 0;
        ++FIELD(s32, scene, 0x79c);
    }

    if (state == 0 || state == 1) {
        s32 value = func_02094d28(FIELD(void *, scene, 0x160), 1, 0x1800,
                                  0x5800);
        void *object2e8 = FIELD(void *, scene, 0x2e8);
        func_020948d4((u8 *)object2e8 + 0x1c, value);
        s32 shared_value = FIELD(s32, object2e8, 0x20);
        func_020948d4((u8 *)FIELD(void *, scene, 0x2ec) + 0x1c,
                       shared_value);
        func_020948d4((u8 *)FIELD(void *, scene, 0x16c) + 0x1c,
                       shared_value + 0x800);
        if (func_02095224(FIELD(void *, scene, 0x160)) != 0) {
            func_ov026_022009dc(scene);
            return 1;
        }
    }
    func_ov026_022009dc(scene);
    return 0;
}

/*
 * Two-state display finale using the 204-byte block at 0x022043E4. State 0
 * resets +0x304, sets field +0x36C to 0x80, invokes two display/palette SDK
 * helpers, and configures +0x2E8/+0x2EC, controller +0x160, and the
 * +0x158/+0x17C children. State 1 waits for controller completion. The central
 * update runs on every path; completion returns one.
 */
extern "C" s32 func_ov026_02203e5c(void *scene)
{
    s32 control[51];
    for (s32 i = 0; i < 51; ++i)
        control[i] = data_ov026_022043e4[i];

    s32 state = FIELD(s32, scene, 0x79c);
    if (state == 0) {
        func_02095308((u8 *)scene + 0x304);
        FIELD(s32, scene, 0x36c) = 0x80;
        func_020b0374(0, 0, 2, 0x6000);
        func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
        func_ov026_02203580((u8 *)scene + 0x1c0);
        func_02094bbc(FIELD(void *, scene, 0x2e8), 0, 0x8000, 0x10000);
        func_02094bbc(FIELD(void *, scene, 0x2ec), 0, 0, 0);

        void *controller = FIELD(void *, scene, 0x160);
        func_020948d4((u8 *)controller + 0x6c, 0x800);
        func_020948d4((u8 *)controller + 0x1c, 0);
        func_02094cf0(controller, control, 0);

        void *child158 = FIELD(void *, scene, 0x158);
        FIELD(s32, child158, 0x38) = 0x599a;
        FIELD(s32, child158, 0x34) = 0x599a;
        FIELD(s32, child158, 0x20) = 0;
        FIELD(s32, child158, 0x24) = 0x5385;
        FIELD(s32, child158, 0x28) = 0x99a;

        void *child17c = FIELD(void *, scene, 0x17c);
        func_02094bbc(child17c, 0, 0x1000, -0x8000);
        func_020948d4((u8 *)child17c + 0x6c, 0xc000);
        func_020948d4((u8 *)child17c + 0x3c, 0);
        FIELD(s32, child17c, 0xa0) = 0;
        ++FIELD(s32, scene, 0x79c);
    }

    if ((state == 0 || state == 1) &&
        func_02095224(FIELD(void *, scene, 0x160)) != 0) {
        func_ov026_022009dc(scene);
        return 1;
    }
    func_ov026_022009dc(scene);
    return 0;
}
