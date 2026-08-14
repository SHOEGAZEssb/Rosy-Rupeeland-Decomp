#include "tingle/types.h"

extern void func_02062864(void *records, u16 index);
extern u8 data_021e9ad0[];
extern void func_020b5294(void);

/* Clamp a descriptor record count/index to retail's inclusive maximum 99. */
void func_02062864(void *self, u16 index)
{
    if (index > 99)
        index = 99;
    *(u16 *)((u8 *)self + 4) = index;
}

/*
 * Toggle the descriptor record's low-nibble active state. First activation
 * lazily prepares the record array at +8 and marks bit 0x1000; deactivation
 * only clears active state one and retains the prepared array.
 */
void func_0207811c(void *self, s32 enabled)
{
    u8 *record = (u8 *)self;
    u16 flags = *(u16 *)(record + 4);

    if (enabled != 0) {
        if ((flags & 0x0f) == 1)
            return;
        if ((flags & 0x1000) == 0) {
            func_02062864(record + 8,
                         (u16)(*(u16 *)(record + 0x0c) +
                               *(s8 *)(record + 1)));
            flags = (u16)(flags | 0x1000);
        }
        *(u16 *)(record + 4) = (u16)((flags & ~0x0f) | 1);
    } else if ((flags & 0x0f) == 1) {
        *(u16 *)(record + 4) = (u16)(flags & ~0x0f);
    }
}

/* Select one of the two fixed descriptor components stored at +0x10/+0x18. */
void *func_02062918(void *self, s32 index)
{
    return (u8 *)self + (index == 0 ? 0x10 : 0x18);
}

/* Resolve the backing resource record selected by one descriptor component. */
void *func_02063094(void *self)
{
    u8 *component = (u8 *)self;
    u8 *selection = *(u8 **)(component + 4);
    u8 *definition = *(u8 **)(selection + 8);
    u8 *resources;
    u8 type = definition[2];

    if (*(u32 *)component != 0) {
        if (type == 0) {
            resources = *(u8 **)(definition + 8);
            return *(void **)(resources + 0x0c);
        }
        func_020b5294();
        return 0;
    }
    resources = *(u8 **)(definition + 8);
    if (type == 0 || type == 2 || type == 3)
        return *(void **)(resources + 8);
    if (type == 1) {
        switch (*(u16 *)(selection + 6)) {
        case 0:
        case 2:
            return *(void **)(resources + 0x6c);
        case 1:
            if (*(u16 *)(selection + 4) != 0)
                return *(void **)(resources + 0x68);
            resources = *(u8 **)(*(u8 **)(data_021e9ad0 + 0x254) + 8);
            return *(void **)(resources + 0x68);
        default:
            break;
        }
    }
    func_020b5294();
    return 0;
}

/* Return the three resource identifiers stored after a resolved record key. */
u32 func_02063064(void *self)
{
    return *(u32 *)((u8 *)func_02063094(self) + 4);
}

u32 func_02063074(void *self)
{
    return *(u32 *)((u8 *)func_02063094(self) + 8);
}

u32 func_02063084(void *self)
{
    return *(u32 *)((u8 *)func_02063094(self) + 0x0c);
}

/*
 * Resolve one record from the active two-level descriptor-table collection.
 * All returned storage is borrowed and the retail routine performs no bounds
 * checks, so callers must supply validated table and record indices.
 */
void *func_02078418(void **tables, s32 tableIndex, s32 recordIndex)
{
    void **table = *(void ***)tables[tableIndex];

    return table[recordIndex];
}

/*
 * Return the count word at +4 of one optional table entry. Indices at or
 * above the retail table capacity (0x10e), and null entries, return zero.
 */
s32 func_020783f0(void **tables, s32 index)
{
    u8 *entry;

    if (index >= 0x10e)
        return 0;
    entry = (u8 *)tables[index];
    return entry != 0 ? *(s32 *)(entry + 4) : 0;
}
