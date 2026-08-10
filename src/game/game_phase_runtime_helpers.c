#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/*
 * Small hardware and field-loader helpers owned by GamePhaseRuntime. They
 * control DS display selection and the object stored at runtime offset 0x30b4.
 */

extern u8 data_020d4350[];
extern u32 data_020d4264[];

#ifdef __cplusplus
extern "C" {
#endif

extern void *func_0200bb34(void *object);
extern void func_0200bdc4(void *object, const void *table,
                          s32 count, s32 value);

#ifdef __cplusplus
}
#endif

/*
 * Replace bit 15 of the DS power-control register at 0x04000304 with value's
 * low bit. This selects the display routing and returns no value.
 */
void GamePhaseRuntime_SetDisplayRouting(s32 value)
{
    volatile u16 *powerControl = (volatile u16 *)0x04000304;
    *powerControl = (u16)((*powerControl & ~0x8000) | (value << 15));
}

/*
 * Allocate and construct a 0x34-byte FLDR-tagged loader, store it at runtime
 * offset 0x30b4, and configure it with the recovered 11-entry table. Retail
 * forwards null on allocation failure to func_0200bdc4. Returns no value.
 */
void GamePhaseRuntime_CreateFieldLoader(GamePhaseRuntime *self)
{
    u8 *bytes = (u8 *)self;
    void *loader = Heap_Alloc(0x34, (const char *)data_020d4350, 4,
                              &gHeapContext);

    if (loader != 0)
        loader = func_0200bb34(loader);
    *(void *volatile *)(bytes + 0x30b4) = loader;
    func_0200bdc4(loader, data_020d4264, 11, 0);
}

/*
 * If the runtime's field loader exists, invoke vtable slot one on it. The
 * recovered helper does not clear the stored pointer and returns no value.
 */
void GamePhaseRuntime_DestroyFieldLoader(GamePhaseRuntime *self)
{
    void *loader = *(void **)((u8 *)self + 0x30b4);

    if (loader != 0) {
        void (**vtable)(void *) = *(void (***)(void *))loader;
        vtable[1](loader);
    }
}
