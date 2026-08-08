#include "tingle/types.h"

/* Overlay 35 senary model rendering and small callback-record initialization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02077b44(void *camera);
extern void func_020773e4(void *resourceSet, void *transform);
extern void func_ov035_021fd7b0(s32 first, s32 second, s32 third, s32 fourth,
                               s32 fifth, s32 sixth, s32 seventh, s32 eighth);
extern void func_ov035_021fcfa0(void *object, void *transform);
#ifdef __cplusplus
}
#endif

/*
 * Renders the senary scene. It applies camera +0x0C, prepares resource set
 * +0xF4 with transform +0x64, clears the common overlay render state, and
 * renders every model in the linked list beginning at collection head +0x120.
 * There is no return value; graphics-engine and per-model render state change.
 * Sprites in collection +0x10C are handled by the shared resource path rather
 * than explicitly traversed here.
 */
extern "C" void func_ov035_022022e4(void *scene)
{
    func_02077b44((u8 *)scene + 0x0c);
    func_020773e4(FIELD(void *, scene, 0xf4), (u8 *)scene + 0x64);
    func_ov035_021fd7b0(0, 0, 0, 0, 0, 0, 0, 0);
    void *object = FIELD(void *, scene, 0x120);
    while (object != 0) {
        func_ov035_021fcfa0(object, (u8 *)scene + 0x64);
        object = FIELD(void *, object, 8);
    }
}

/*
 * Initializes an offset-based callback record. Inputs first and second are
 * stored at +0x24 and +0x28; link/state words +4 and +8 are cleared. The fourth
 * ABI argument is unused. There is no return value or hardware effect, and the
 * semantic types of the two stored inputs remain unconfirmed.
 */
extern "C" void func_ov035_02202350(void *record, void *first, void *second,
                                     void *unused)
{
    (void)unused;
    FIELD(void *, record, 0x24) = first;
    FIELD(void *, record, 0x28) = second;
    FIELD(s32, record, 4) = 0;
    FIELD(s32, record, 8) = 0;
}
