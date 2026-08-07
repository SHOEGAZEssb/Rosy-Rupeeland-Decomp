#include "tingle/types.h"

/*
 * Overlay 6 geometry interpolation. This recovered helper queries two endpoint
 * pairs from overlay 46, interpolates them, and updates the active controller.
 */

typedef struct Overlay006GeometryState {
    u8 bytes[0xb8];
} Overlay006GeometryState;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_ov046_0220c3bc(void *helper, s32 key);
extern s32 func_ov046_0220c410(void *helper, s32 key);
extern s32 func_02091a70(s32 first, s32 second, s32 progress, s32 duration);
extern void func_ov046_0220c46c(void *helper, s32 first, s32 second);
extern void func_02028100(void *auxiliary, void *controllerMember);
extern void func_ov046_0220bffc(void *helper, void *controllerMember,
                               s32 first, s32 second);
extern void func_02091b98(void *animation, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Query func_ov046_0220c3bc/c410 on helper +0x90 first with selected key +0x68
 * and then with controller member/key +0x64. Interpolate the two first values
 * and two second values through func_02091a70 using +0x7C/+0x80, then submit
 * them through func_ov046_0220c46c. If +0x80 is not equal to +0x7C divided by
 * two with truncation toward zero, return. At equality, bind auxiliary +0x94
 * to +0x64 through func_02028100, reset helper +0x90 against +0x64 with zero
 * trailing values, submit 0x78 to animation +0x98, and set +0xB4 to one.
 * Observable geometry/UI effects are delegated; key and coordinate semantics
 * remain inferred while the call graph and arithmetic are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov006_021fb9b4(Overlay006GeometryState *state)
{
    void *helper = FIELD(void *, state, 0x090);
    s32 selected = FIELD(s32, state, 0x068);
    s32 current = FIELD(s32, state, 0x064);
    s32 firstSelected = func_ov046_0220c3bc(helper, selected);
    s32 secondSelected = func_ov046_0220c410(helper, selected);
    s32 firstCurrent = func_ov046_0220c3bc(helper, current);
    s32 secondCurrent = func_ov046_0220c410(helper, current);
    s32 first = func_02091a70(firstSelected, firstCurrent,
                              FIELD(s32, state, 0x07c),
                              FIELD(s32, state, 0x080));
    s32 second = func_02091a70(secondSelected, secondCurrent,
                               FIELD(s32, state, 0x07c),
                               FIELD(s32, state, 0x080));

    func_ov046_0220c46c(helper, first, second);
    if (FIELD(s32, state, 0x080) != FIELD(s32, state, 0x07c) / 2) {
        return;
    }
    func_02028100(FIELD(void *, state, 0x094),
                   FIELD(void *, state, 0x064));
    func_ov046_0220bffc(helper, FIELD(void *, state, 0x064), 0, 0);
    func_02091b98((u8 *)state + 0x98, 0x78);
    FIELD(s32, state, 0x0b4) = 1;
}

#undef FIELD
