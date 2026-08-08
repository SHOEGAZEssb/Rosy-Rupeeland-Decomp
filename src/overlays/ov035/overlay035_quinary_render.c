#include "tingle/types.h"

/* Overlay 35 quinary camera, primitive-list, particle, and model rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02077b44(void *camera);
extern void func_020773e4(void *resourceSet, void *transform);
extern void func_ov035_021fd60c(void *list);
extern void func_ov035_021fd128(s32 first, s32 second, s32 third, s32 fourth,
                               s32 fifth, s32 sixth);
extern void func_ov035_021fd7b0(s32 first, s32 second, s32 third, s32 fourth,
                               s32 fifth, s32 sixth, s32 seventh, s32 eighth);
extern void func_ov035_021fd30c(void *particle);
extern void func_ov035_021fcfa0(void *object, void *transform);
#ifdef __cplusplus
}
#endif

/*
 * Renders the quinary scene. It applies camera +0x0C, prepares resource set
 * +0xF8 with transform +0x64, submits primitive list +0x170, configures a
 * fixed overlay primitive state (0,0,3,0x10,0x1F,0x8000), and clears the
 * common render state. It then renders every particle from list head +0x11C
 * and every model from head +0x12C. There is no return value; graphics-engine
 * and per-object render state change.
 */
extern "C" void func_ov035_022014d0(void *scene)
{
    func_02077b44((u8 *)scene + 0x0c);
    func_020773e4(FIELD(void *, scene, 0xf8), (u8 *)scene + 0x64);
    func_ov035_021fd60c(FIELD(void *, scene, 0x170));
    func_ov035_021fd128(0, 0, 3, 0x10, 0x1f, 0x8000);
    func_ov035_021fd7b0(0, 0, 0, 0, 0, 0, 0, 0);

    void *object = FIELD(void *, scene, 0x11c);
    while (object != 0) {
        func_ov035_021fd30c(object);
        object = FIELD(void *, object, 8);
    }
    object = FIELD(void *, scene, 0x12c);
    while (object != 0) {
        func_ov035_021fcfa0(object, (u8 *)scene + 0x64);
        object = FIELD(void *, object, 8);
    }
}
