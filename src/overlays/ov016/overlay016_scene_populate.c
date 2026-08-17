#include "tingle/types.h"

/* Overlay 16 panel/list allocation and population from the global record list. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_021e9ac0;
extern u8 data_021e9e00[];
extern const char data_ov016_02201588[];
extern const char data_ov016_02201590[];
extern void *gDebugFont;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern s32 ActorDescriptorState_FindInactiveQuantity(void *, u16);
extern s32 func_0206fa9c(void *);
extern void *func_ov016_021fce34(void *, void *, s32);
extern void func_ov016_021fd0e0(void *, void *, const u8 *, u32);
extern void func_ov016_021fd210(void *);
extern void *func_ov016_021fd6c8(void *, void *);
extern s32 func_ov016_021ffcb0(void *, void *, u8 *);
#ifdef __cplusplus
}
#endif

/*
 * Allocate the 0x114-byte panel at state +0x448 and the 0x64-byte selectable
 * list at +0x444, constructing them from the debug/main owners respectively.
 * Walk the global pointer slots at data_021E9E00+8. Empty slots append a null
 * descriptor with flag 1. Occupied slots obtain a six-byte payload through
 * 0x021FFCB0 and derive flags: bit 0 when that helper rejects the record, bit 1
 * when the record's +4 key has a global value of at least 99, and bit 2 when
 * the sum of +0x2C halfwords across +0x100 entries exceeds state limit +0x5C.
 * Append each descriptor and instantiate the initially visible rows. Return
 * void. Heap, list, panel, and sprite state changes; no direct MMIO occurs.
 */
extern "C" void func_ov016_021ff288(void *state)
{
    void *object;
    s32 index;

    object = Heap_Alloc(0x114, data_ov016_02201588, 4, gHeapContext);
    if (object != 0) {
        object = func_ov016_021fd6c8(object, gDebugFont);
    }
    FIELD(void *, state, 0x448) = object;

    object = Heap_Alloc(0x64, data_ov016_02201590, 4, gHeapContext);
    if (object != 0) {
        object = func_ov016_021fce34(object, data_020f4e14,
                                    FIELD(s32, state, 0x58));
    }
    FIELD(void *, state, 0x444) = object;

    for (index = 0; index < FIELD(s32, data_021e9e00, 4); index++) {
        void *slot = (u8 *)FIELD(void *, data_021e9e00, 8) + index * 4;

        if (func_0206fa9c(slot) != 0) {
            u8 payload[8];
            void *record = FIELD(void *, slot, 0);
            u32 flags = 0;
            s32 sum = 0;
            s32 entry;

            if (func_ov016_021ffcb0(state, slot, payload) == 0) {
                flags |= 1;
            }
            if (ActorDescriptorState_FindInactiveQuantity((u8 *)data_021e9ac0 + 0x1c,
                              FIELD(u16, record, 4)) >= 99) {
                flags |= 2;
            }
            for (entry = 0; entry < FIELD(s32, record, 0x100); entry++) {
                sum += FIELD(u16, (u8 *)record + entry * 0x24, 0x2c);
            }
            if (sum > FIELD(s32, state, 0x5c)) {
                flags |= 4;
            }
            func_ov016_021fd0e0(FIELD(void *, state, 0x444), slot, payload,
                                flags);
        } else {
            func_ov016_021fd0e0(FIELD(void *, state, 0x444), 0, 0, 1);
        }
    }
    func_ov016_021fd210(FIELD(void *, state, 0x444));
}
