#include "tingle/types.h"

/* Overlay 33 scene launch checks, input polling, and sprite/object motion. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021052fc;
extern void *gTouchPanelManager;
extern const u16 gPadState1[];
extern const s16 data_020c9670[];
extern const u8 data_ov033_021fdec0[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GamePhaseState_GetBoundaryDirection(void *state);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment,
                       void *heapContext);
extern void *func_ov074_0220fda8(void *object, s32 selection);
extern s32 func_02093360(void *dialog, const void *inputState);
extern s32 Presentation_InterpolateQuadraticPulse(s32 first, s32 second, s32 third, s32 selector);
extern s32 GamePhaseState_QueryTerrainHeight(void *state, s32 x, s32 y);
extern void func_ov033_021fd4cc(void *scene, s32 delta);
#ifdef __cplusplus
}
#endif

/*
 * Tests whether a selectable entry can launch overlay-74 UI. It obtains a
 * one-based selection from global state +0x24, accepts only 1..4, and rejects
 * entries whose signed halfword in the selected +0x14 slot is negative. On
 * success it allocates/constructs a 0x174-byte overlay-74 object, stores
 * `owner` at its +0x128, and returns 1; otherwise it returns 0. Heap and overlay
 * state may change. The binary assumes allocation/construction succeeds before
 * writing +0x128; that ownership precondition is preserved conceptually.
 */
extern "C" s32 func_ov033_021fd37c(void *owner)
{
    s32 selection = GamePhaseState_GetBoundaryDirection((u8 *)data_021052fc + 0x24);
    if (selection <= 0 || selection > 4)
        return 0;

    s32 index = selection - 1;
    void *entries = FIELD(void *, (u8 *)data_021052fc + 0x3000, 0xbc);
    if (FIELD(s16, entries, 0x14 + index * 2) < 0)
        return 0;

    void *object = Heap_Alloc(0x174, data_ov033_021fdec0, 4, gHeapContext);
    if (object != 0)
        object = func_ov074_0220fda8(object, index);
    FIELD(void *, object, 0x128) = owner;
    return 1;
}

/*
 * Polls dialog/input acceptance. It snapshots 11 pad-state halfwords, returns
 * 1 immediately when dialog state +0x38 has bit 0 set, and otherwise injects
 * an A/B-style bit into the snapshot when the touch manager reports a fresh
 * touch before calling func_02093360. Returns the low result bit sign-extended
 * to 0/1. Dialog/input state may change; no direct hardware register is read.
 */
extern "C" s32 func_ov033_021fd418(void *scene)
{
    u16 input[11];
    for (s32 i = 0; i < 11; ++i)
        input[i] = gPadState1[i];

    void *dialog = FIELD(void *, scene, 0xc4);
    u32 dialogState = FIELD(u32, dialog, 0x38);
    if ((dialogState & 1) != 0)
        return 1;

    void *touch = gTouchPanelManager;
    if (FIELD(u16, touch, 0x44) == 1 && FIELD(u16, touch, 0x3c) != 1) {
        if ((dialogState & 2) != 0)
            input[1] |= 1;
        else
            input[1] |= 2;
    }
    return func_02093360(dialog, input) & 1;
}

/* Divides a signed value by 16 with C/truncation-toward-zero semantics. */
static s32 div16_toward_zero(s32 value)
{
    return (value + ((value >> 3) < 0 ? 15 : 0)) >> 4;
}

/* Divides a signed value by 512 with C/truncation-toward-zero semantics. */
static s32 div512_toward_zero(s32 value)
{
    return (value + ((value >> 4) < 0 ? 511 : 0)) >> 9;
}

/*
 * Advances the 16-bit phase at +0x38 by `delta`, derives a two-way easing
 * selector for Presentation_InterpolateQuadraticPulse, and writes its result to sprite-group offset
 * +0x12C. It queries the global tile/height state beneath the primary object's
 * fixed-point X/Y coordinates, combines that result with a signed lookup from
 * data_020c9670 and the object's +0x24 height, then stores the resulting motion
 * adjustment at scene +0x20. Returns no value; scene/group state and the query
 * subsystem may change, with no direct MMIO.
 */
extern "C" void func_ov033_021fd4cc(void *scene, s32 delta)
{
    u16 phase = (u16)(FIELD(u32, scene, 0x38) + delta);
    FIELD(u32, scene, 0x38) = phase;
    s32 selector = phase >> 15;
    FIELD(s32, FIELD(void *, scene, 0x48), 0x12c) =
        Presentation_InterpolateQuadraticPulse(0, 0x800, 0x100, selector);

    void *primary = FIELD(void *, scene, 4);
    s32 xPixels = FIELD(s32, primary, 0x1c) >> 12;
    s32 yPixels = FIELD(s32, primary, 0x20) >> 12;
    s32 tile = GamePhaseState_QueryTerrainHeight((u8 *)data_021052fc + 0x24,
                             div16_toward_zero(xPixels),
                             div16_toward_zero(yPixels));
    s16 wave = data_020c9670[(FIELD(s32, scene, 0x38) >> 4) * 2];
    s32 target = wave * 0x18 + ((tile << 4) + 0x40) * 0x1000 -
                 FIELD(s32, primary, 0x24);
    FIELD(s32, scene, 0x20) = div512_toward_zero(target);
}

/*
 * Advances motion by phase delta 0x600, copies sprite-group X/Y (+0x10/+0x20)
 * into the primary object's fixed-point +0x1C/+0x20, and applies scene +0x20
 * to its height +0x24. When a secondary object is bound, it follows at X-24
 * pixels with matching Y/height. Returns no value; object transforms change
 * without direct hardware effects.
 */
extern "C" void func_ov033_021fd598(void *scene)
{
    func_ov033_021fd4cc(scene, 0x600);
    void *group = FIELD(void *, scene, 0x48);
    void *primary = FIELD(void *, scene, 4);
    FIELD(s32, primary, 0x1c) = FIELD(s32, group, 0x10) << 12;
    FIELD(s32, primary, 0x20) = FIELD(s32, group, 0x20) << 12;
    FIELD(s32, primary, 0x24) += FIELD(s32, scene, 0x20);

    void *secondary = FIELD(void *, scene, 8);
    if (secondary != 0) {
        FIELD(s32, secondary, 0x1c) = FIELD(s32, primary, 0x1c) - 0x18000;
        FIELD(s32, secondary, 0x20) = FIELD(s32, primary, 0x20);
        FIELD(s32, secondary, 0x24) = FIELD(s32, primary, 0x24);
    }
}
