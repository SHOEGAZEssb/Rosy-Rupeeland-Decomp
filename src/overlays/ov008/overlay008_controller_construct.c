#include "tingle/types.h"

/*
 * Overlay 8 controller construction. This recovered constructor builds the
 * base and an embedded member array, then creates and initializes 60 objects.
 */

typedef void (*Overlay008MemberRoutine)(void *member);
typedef void (*Overlay008PlaceObject)(void *state, void *object, s32 x, s32 y,
                                      s32 first, s32 second);

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_ov008_021fc2e4[];
extern void *func_ov008_021fb6e0(void *state);
extern void __construct_array(void *array, u32 count, u32 elementSize,
                              Overlay008MemberRoutine constructor,
                              Overlay008MemberRoutine destructor);
extern void func_02004fe0(void *member);
extern void func_02005058(void *member);
extern void *func_0209a208(void *state, s32 firstId, s32 secondId, s32 thirdId,
                          s32 argument, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *member, s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Construct state and install data_ov008_021fc2e4, construct 60 16-byte
 * members at +0x13C, and retain owner at +0x48. For indices 59 down to zero,
 * create an object with IDs 0x12D8..0x12DA and the supplied argument/mode 2,
 * store it at +0x4C+index*4, place it through vtable slot zero at confirmed
 * 20.12 coordinates (0x40000, 0x64000), set bit 2 at object +0x42, submit
 * value 3 through its +0x0C pointer, and set +0x754+index*4 to -1. Return
 * state. All allocation, object, and member effects are delegated.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov008_021fb720(void *state, void *owner, s32 argument)
{
    s32 index;

    func_ov008_021fb6e0(state);
    FIELD(const void *, state, 0x000) = data_ov008_021fc2e4;
    __construct_array((u8 *)state + 0x13c, 60, 0x10, func_02004fe0,
                      func_02005058);
    FIELD(void *, state, 0x048) = owner;

    for (index = 59; index >= 0; index--) {
        void *object = func_0209a208(state, 0x12d8, 0x12d9, 0x12da,
                                    argument, 2);
        void *vtable = FIELD(void *, state, 0x000);
        Overlay008PlaceObject place = FIELD(Overlay008PlaceObject, vtable, 0);

        FIELD(void *, state, 0x04c + index * 4) = object;
        place(state, object, 0x40000, 0x64000, 0, 0);
        FIELD(u16, object, 0x42) |= 4;
        GraphicsSpriteState_SetAnimationIndex(FIELD(void *, object, 0x0c), 3);
        FIELD(s32, state, 0x754 + index * 4) = -1;
    }
    return state;
}
