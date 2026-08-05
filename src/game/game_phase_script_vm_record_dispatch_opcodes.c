#include "tingle/game_phase_script_vm.h"

/* Implement paired script dispatchers for two related record-operation helper families. */

#ifdef __cplusplus
extern "C" {
#endif
extern void OS_Halt(void);
extern void func_0201c174(...);
extern void func_0201c3f8(...);
extern void func_0201c5ac(...);
extern void func_0201c610(...);
extern void func_0201c798(...);
extern void func_0201c91c(...);
extern void func_0201cabc(...);
extern void func_0201cb70(...);
extern void func_0201ccf4(...);
extern void func_0201ce98(...);
extern void func_0201cf34(...);
#ifdef __cplusplus
}
#endif

/*
 * Pop five operands and a selector, dispatch selectors 0..6 through the first
 * record helper family, and return zero. Selectors 2 and 6 narrow the last
 * four operands to u16 and differ only in a final boolean. Invalid selectors
 * halt through the SDK routine.
 */
s32 func_02016930(GamePhaseActorScriptVm *self)
{
    u32 fifth = func_02012704(&self->base);
    u32 fourth = func_02012704(&self->base);
    u32 third = func_02012704(&self->base);
    u32 second = func_02012704(&self->base);
    u32 first = func_02012704(&self->base);
    u32 selector = func_02012704(&self->base);

    switch (selector) {
    case 0: func_0201c174(first, second, third, fourth); break;
    case 1: func_0201c3f8(first, second, third, fourth); break;
    case 2:
        func_0201ccf4(first, (u16)second, (u16)third, (u16)fourth,
                      (u16)fifth, 1);
        break;
    case 3: func_0201c5ac(first, second, third); break;
    case 4: func_0201c610(first, second); break;
    case 5: func_0201cf34(first, second, third); break;
    case 6:
        func_0201ccf4(first, (u16)second, (u16)third, (u16)fourth,
                      (u16)fifth, 0);
        break;
    default: OS_Halt(); break;
    }
    return 0;
}

/*
 * Pop five operands and a selector, dispatch selectors 1..6 through the
 * second record helper family, and return zero. Selectors 2 and 6 narrow the
 * last four operands to u16 and differ only in a final boolean. Selector zero
 * and out-of-range values halt.
 */
s32 func_02016a84(GamePhaseActorScriptVm *self)
{
    u32 fifth = func_02012704(&self->base);
    u32 fourth = func_02012704(&self->base);
    u32 third = func_02012704(&self->base);
    u32 second = func_02012704(&self->base);
    u32 first = func_02012704(&self->base);
    u32 selector = func_02012704(&self->base);

    switch (selector) {
    case 1: func_0201c798(first, second, third, fourth); break;
    case 2:
        func_0201c91c(first, (u16)second, (u16)third, (u16)fourth,
                      (u16)fifth, 1);
        break;
    case 3: func_0201cabc(first, second, third); break;
    case 4: func_0201cb70(first, second); break;
    case 5: func_0201ce98(first, second, third); break;
    case 6:
        func_0201c91c(first, (u16)second, (u16)third, (u16)fourth,
                      (u16)fifth, 0);
        break;
    default: OS_Halt(); break;
    }
    return 0;
}
