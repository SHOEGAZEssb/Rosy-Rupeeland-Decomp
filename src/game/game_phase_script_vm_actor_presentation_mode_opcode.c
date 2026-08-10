#include "tingle/game_phase_script_vm.h"

/*
 * Implement a seven-mode script dispatcher for the bound actor's primary and
 * optional secondary presentation objects, including DS blend hardware setup.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern void func_020708c4(void *state);
extern void func_02070934(void *state);
extern void func_02070958(void *state, s32 first, s32 second, s32 third);
extern void func_02070a78(void *state, s32 first, s32 second, s32 third);
extern void func_02074dc8(void *type, void *object);
extern void func_020afd0c(void *reg, s32 firstMask, s32 secondMask,
                          s32 firstCoefficient, s32 secondCoefficient);
#ifdef __cplusplus
}
#endif

static void refreshPresentationObject(void *object)
{
    func_02074dc8(**(void ***)object, object);
}

/*
 * Pop third, second, first, and mode operands. Operate on the presentation
 * object at actor offset 0x54 and mirror applicable operations to the optional
 * object at 0x58. Modes 0/1 call recovered state resets, modes 2/3 pass the
 * three operands to distinct state updates, mode 4 sets halfword 0x2a, mode 5
 * configures main/sub blend alpha with coefficient first and 16-first, and
 * mode 6 clears the corresponding blend-control register. Unknown modes and a
 * missing primary object do nothing. Return zero.
 */
s32 func_02017ac8(GamePhaseActorScriptVm *self)
{
    s32 third = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 second = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 first = (s32)GamePhaseScriptVm_Pop(&self->base);
    s32 mode = (s32)GamePhaseScriptVm_Pop(&self->base);
    u8 *actor = (u8 *)self->actor_84;
    u8 *primary = *(u8 **)(actor + 0x54);
    u8 *secondary = *(u8 **)(actor + 0x58);
    if (!primary)
        return 0;

    switch (mode) {
    case 0:
        func_020708c4(*(void **)(primary + 0x18));
        refreshPresentationObject(primary);
        if (secondary) {
            func_020708c4(*(void **)(secondary + 0x18));
            refreshPresentationObject(secondary);
        }
        break;
    case 1:
        func_02070934(*(void **)(primary + 0x18));
        refreshPresentationObject(primary);
        if (secondary) {
            func_02070934(*(void **)(secondary + 0x18));
            refreshPresentationObject(secondary);
        }
        break;
    case 2:
        func_02070958(*(void **)(primary + 0x18), first, second, third);
        refreshPresentationObject(primary);
        if (secondary) {
            func_02070958(*(void **)(secondary + 0x18), first, second, third);
            refreshPresentationObject(secondary);
        }
        break;
    case 3:
        func_02070a78(*(void **)(primary + 0x18), first, second, third);
        refreshPresentationObject(primary);
        if (secondary) {
            func_02070a78(*(void **)(secondary + 0x18), first, second, third);
            refreshPresentationObject(secondary);
        }
        break;
    case 4:
        *(u16 *)(primary + 0x2a) = 1;
        if (secondary)
            *(u16 *)(secondary + 0x2a) = 1;
        break;
    case 5: {
        s32 complement = 16 - first;
        void *primaryRegister = **(void ***)primary == data_020f4e14
            ? (void *)0x04000050 : (void *)0x04001050;
        func_020afd0c(primaryRegister, 0, 0x2f, first, complement);
        if (secondary)
            func_020afd0c((void *)0x04001050, 0, 0x2f,
                          first, complement);
        break;
    }
    case 6:
        if (**(void ***)primary == data_020f4e14)
            *(volatile u16 *)0x04000050 = 0;
        else
            *(volatile u16 *)0x04001050 = 0;
        break;
    }
    return 0;
}
