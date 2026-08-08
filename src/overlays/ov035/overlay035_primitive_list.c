#include "tingle/types.h"

/* Overlay 35 heap-backed primitive-node list construction and retirement. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203d18[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091b6c(void *state);
extern void func_02091b98(void *state, void *argument);
extern s32 func_02091c7c(void *state, s32 mode);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void *func_ov035_021fd460(void *node, void *argument, s32 value4,
                                 s32 value8, s32 valueC, s32 value10,
                                 s32 value14);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a 0x34-byte list node. It initializes embedded state +0x18 using
 * the argument, clears next pointer +0, and stores five recovered payload words
 * at +4..+0x14. Returns the node; embedded engine state changes, without MMIO.
 */
extern "C" void *func_ov035_021fd460(void *node, void *argument, s32 value4,
                                      s32 value8, s32 valueC, s32 value10,
                                      s32 value14)
{
    func_02091b6c((u8 *)node + 0x18);
    FIELD(void *, node, 0) = 0;
    FIELD(s32, node, 4) = value4;
    FIELD(s32, node, 8) = value8;
    FIELD(s32, node, 0x0c) = valueC;
    FIELD(s32, node, 0x10) = value10;
    FIELD(s32, node, 0x14) = value14;
    func_02091b98((u8 *)node + 0x18, argument);
    return node;
}

/*
 * Initializes a primitive list: head +0, tail +4, count +8, and field +0xC
 * are cleared; the argument is retained at +0x10 and color +0x14 starts at
 * 0x7FFF. Returns no value and changes only list memory.
 */
extern "C" void func_ov035_021fd4b4(void *list, void *argument)
{
    FIELD(void *, list, 0) = 0;
    FIELD(void *, list, 4) = 0;
    FIELD(s32, list, 8) = 0;
    FIELD(s32, list, 0x0c) = 0;
    FIELD(void *, list, 0x10) = argument;
    FIELD(u16, list, 0x14) = 0x7fff;
}

/*
 * Frees every node linked from list head +0, then clears head, tail, and count.
 * Returns no value; heap ownership changes and +0xC/+0x10/+0x14 are retained.
 */
extern "C" void func_ov035_021fd4dc(void *list)
{
    void *node = FIELD(void *, list, 0);
    while (node != 0) {
        void *next = FIELD(void *, node, 0);
        Heap_Free(node);
        node = next;
    }
    FIELD(void *, list, 4) = 0;
    FIELD(void *, list, 0) = 0;
    FIELD(s32, list, 8) = 0;
}

/*
 * Allocates and appends a 0x34-byte node using the list's retained +0x10
 * argument and +0x0C payload. Caller values populate node +4/+8/+0x0C/+0x10.
 * The recovered code increments count +8 even if allocation fails; this
 * matching-visible behavior is preserved. Returns no value; heap/list and
 * embedded engine state change, without direct hardware access.
 */
extern "C" void func_ov035_021fd51c(void *list, s32 value4, s32 value8,
                                     s32 valueC, s32 value10)
{
    void *node = Heap_Alloc(0x34, data_ov035_02203d18, 4, gHeapContext);
    if (node != 0)
        node = func_ov035_021fd460(
            node, FIELD(void *, list, 0x10), value4, value8, valueC,
            value10, FIELD(s32, list, 0x0c));

    if (FIELD(void *, list, 0) == 0) {
        FIELD(void *, list, 4) = node;
        FIELD(void *, list, 0) = node;
    } else {
        FIELD(void *, FIELD(void *, list, 4), 0) = node;
        FIELD(void *, list, 4) = node;
    }
    FIELD(s32, list, 8)++;
}

/*
 * Polls each node's embedded +0x18 state in mode 2. Completed nodes are removed
 * by advancing list head to their successor, freed, and deducted from count.
 * The binary assumes completion occurs in head order; it does not repair a
 * predecessor link or tail when a later node completes. Returns no value;
 * heap/list and embedded engine state may change, with no direct MMIO.
 */
extern "C" void func_ov035_021fd5ac(void *list)
{
    void *node = FIELD(void *, list, 0);
    while (node != 0) {
        void *next = FIELD(void *, node, 0);
        if (func_02091c7c((u8 *)node + 0x18, 2)) {
            FIELD(void *, list, 0) = next;
            Heap_Free(node);
            FIELD(s32, list, 8)--;
        }
        node = next;
    }
}
