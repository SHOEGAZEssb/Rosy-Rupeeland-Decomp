#include "tingle/game_phase_script_vm.h"

/* Implement generic script opcodes that query or control phase-runtime collections. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern void OS_Halt(void);
extern void *func_02007f0c(void *runtime, s32 index);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern u32 func_0200920c(void *collection, u32 a, u32 b, u32 c, u32 d);
extern u32 func_020093cc(void *collection, u32 a, u32 b);
extern void func_020091e8(void *collection);
extern void func_020091f4(void *collection);
extern void func_0200a114(void *collection, void *object);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/*
 * Pop four operands and a selector. Selectors 1-6 operate on runtime fields
 * 0x2fbc/0x2fd4/0x2fec; selectors 7-9 mirror the collection operations at
 * 0x3044. Query results are stored through func_020127f8, selector 5 resolves
 * an object from runtime collection 1, selector 11 is a no-op, and selectors
 * 0/10/out-of-range enter OS_Halt. Always returns zero after dispatch. The
 * underlying collection calls may mutate runtime state.
 */
s32 func_02012814(GamePhaseScriptVm *self)
{
    u32 d = func_02012704(self);
    u32 c = func_02012704(self);
    u32 b = func_02012704(self);
    u32 a = func_02012704(self);
    u32 selector = func_02012704(self);
    u8 *runtime = (u8 *)data_021052fc;
    switch (selector) {
    case 1:
        func_020127f8(self, func_0200920c(runtime + 0x2fbc, a, b, c, d));
        break;
    case 2:
        func_020127f8(self, func_020093cc(runtime + 0x2fbc, a, b));
        break;
    case 3:
        if (a)
            func_020091e8(runtime + 0x2fbc);
        else
            func_020091f4(runtime + 0x2fbc);
        break;
    case 4:
        func_020127f8(self, *(u32 *)(runtime + 0x2fd4) == 2);
        break;
    case 5: {
        void *collection = func_02007f0c(runtime, 1);
        void *object = ActorCollection_FindActorByDescriptorValue(collection, a);
        func_0200a114(runtime + 0x2fbc, object);
        break;
    }
    case 6:
        func_020127f8(self, *(u32 *)(runtime + 0x2fec) & 1);
        break;
    case 7:
        func_020127f8(self, func_0200920c(runtime + 0x3044, a, b, c, d));
        break;
    case 8:
        func_020127f8(self, func_020093cc(runtime + 0x3044, a, b));
        break;
    case 9:
        if (a)
            func_020091e8(runtime + 0x3044);
        else
            func_020091f4(runtime + 0x3044);
        break;
    case 11:
        break;
    case 0:
    case 10:
    default:
        OS_Halt();
        break;
    }
    return 0;
}

/* Pop an upper bound, store a global-RNG value modulo that bound, and return zero. */
s32 func_02012a60(GamePhaseScriptVm *self)
{
    u32 limit = func_02012704(self);
    func_020127f8(self, genrand_int32() % limit);
    return 0;
}
