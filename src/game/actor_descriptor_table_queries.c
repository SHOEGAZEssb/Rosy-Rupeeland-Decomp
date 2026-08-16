/*
 * Recovered actor descriptor construction, selection, and resource queries.
 *
 * These routines borrow actor-database and descriptor-table storage. They
 * initialize caller-owned descriptor records and expose the resource IDs and
 * animation values selected by those records; ownership is never transferred.
 */
#include "tingle/types.h"

extern void func_02062864(void *records, u16 index);
extern s32 func_02062b28(void *record);
extern s32 func_02065034(void *state);
extern void *func_02063b90(void *database, u16 id);
extern void func_02071ee0(void *resource, void *manager, u32 first,
                          u32 second, u32 third);
extern u8 data_021e9ad0[];
extern void func_020b5294(void);
extern u8 data_020c4424[];
extern u8 data_021e9d2c[];
extern u8 gSystemState[];

/*
 * Initialize a range descriptor for actor `id`. The database definition at
 * +8 is borrowed, and `lastIndex` is clamped to retail's inclusive limit by
 * func_02062864. The caller retains ownership of the descriptor.
 */
void func_020627a0(void *self, u16 id, u16 lastIndex)
{
    u8 *record = (u8 *)self;

    *(u16 *)record = id;
    *(void **)(record + 8) = func_02063b90(data_021e9ad0, id);
    func_02062864(record, lastIndex);
}

/*
 * Clamp the descriptor quantity at +4 to 99. For kind two, a nonzero quantity
 * also sets status bit 1 in the halfword at +2. No storage is allocated.
 */
void func_02062874(void *self, u16 quantity)
{
    u8 *record = (u8 *)self;

    if (quantity > 99)
        quantity = 99;
    *(u16 *)(record + 4) = quantity;
    if (*(u16 *)(record + 6) == 2 && quantity != 0)
        *(u16 *)(record + 2) |= 2;
}

/*
 * Initialize a single actor descriptor. The actor database definition stored
 * at +8 is borrowed. `kind` is retained at +6 and `quantity` is clamped and
 * applied by func_02062874, including its kind-two status effect.
 */
void func_020627d0(void *self, u16 id, u16 kind, u16 quantity)
{
    u8 *record = (u8 *)self;

    *(u16 *)record = id;
    *(void **)(record + 8) = func_02063b90(data_021e9ad0, id);
    *(u16 *)(record + 6) = kind;
    func_02062874(record, quantity);
}

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

/*
 * Return the localized primary label selected by one actor descriptor. Kind
 * one normally uses definition +0x10, but its zero-quantity subtype-one case
 * borrows the database default definition. Other kinds use definition +0x10.
 * Returned strings remain owned by the database.
 */
void *func_020628c8(void *self)
{
    u8 *record = (u8 *)self;
    u8 *definition = *(u8 **)(record + 8);

    if (definition[2] != 1 || *(u16 *)(record + 4) != 0 ||
        *(u16 *)(record + 6) == 2)
        return definition + 0x10;
    if (*(u16 *)(record + 6) == 1)
        return *(u8 **)(data_021e9ad0 + 0x254) + 0x10;
    return self;
}

/*
 * Return the panel-image selector for a descriptor. Kind zero uses image zero;
 * ordinary kind-one records read resource byte +4, while the zero-quantity
 * subtype-one record uses image two. Unsupported retail states halt.
 */
s32 func_020629a0(void *self)
{
    u8 *record = (u8 *)self;
    u8 *definition = *(u8 **)(record + 8);

    if (definition[2] == 0)
        return 0;
    if (definition[2] == 1) {
        if (*(u16 *)(record + 4) != 0 || *(u16 *)(record + 6) == 2)
            return (*(u8 **)(definition + 8))[4];
        if (*(u16 *)(record + 6) == 1)
            return 2;
    }
    func_020b5294();
    return 0;
}

/*
 * Return the localized secondary panel label. Kind one normally selects the
 * resource string at +8, with a fixed empty-subtype label for its zero-value
 * subtype one. Other kinds select one of the 0x40-byte language records at
 * 0x020C4424. Returned strings are borrowed.
 */
void *func_02062a60(void *self)
{
    u8 *record = (u8 *)self;
    u8 *definition = *(u8 **)(record + 8);

    if (definition[2] == 1) {
        if (*(u16 *)(record + 4) == 0 && *(u16 *)(record + 6) == 1)
            return data_021e9d2c;
        return *(u8 **)(definition + 8) + 8;
    }
    return data_020c4424 + (u32)gSystemState[0x5f] * 0x40;
}

/* Return the kind-zero resource animation byte +6, or zero for other kinds. */
s32 func_02062ae4(void *self)
{
    u8 *definition = *(u8 **)((u8 *)self + 8);

    if (definition[2] == 0)
        return (*(u8 **)(definition + 8))[6];
    return 0;
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

/*
 * Resolve the selected descriptor component and load its three resource IDs
 * into caller-owned `resource`. The manager and resolved database storage are
 * borrowed; allocation and renderer effects belong to func_02071ee0.
 */
void func_02063014(void *self, void *manager, void *resource)
{
    u8 *resolved = (u8 *)func_02063094(self);

    func_02071ee0(resource, manager, *(u32 *)(resolved + 4),
                  *(u32 *)(resolved + 8), *(u32 *)(resolved + 0x0c));
}

/*
 * Return the animation byte selected by one descriptor component. Type-zero
 * records distinguish primary/alternate components at byte +4/+5. Type one
 * selects bytes +0x72/+0x73 using the selection words at +4/+6, with the
 * database default at +0x254 used by the zero-valued subtype-one case. Types
 * two and three use byte +2. Unsupported combinations halt as retail does.
 */
s32 func_02063190(void *self)
{
    u8 *component = (u8 *)self;
    u8 *selection = *(u8 **)(component + 4);
    u8 *definition = *(u8 **)(selection + 8);
    u8 *resources = *(u8 **)(definition + 8);
    u8 type = definition[2];

    if (*(u32 *)component != 0) {
        if (type == 0)
            return resources[5];
        func_020b5294();
        return 0;
    }

    switch (type) {
    case 0:
        return resources[4];
    case 1:
        switch (*(u16 *)(selection + 6)) {
        case 0:
        case 2:
            return resources[0x73];
        case 1:
            if (*(u16 *)(selection + 4) == 0) {
                u8 *defaultDefinition =
                    *(u8 **)(data_021e9ad0 + 0x254);
                resources = *(u8 **)(defaultDefinition + 8);
            }
            return resources[0x72];
        default:
            break;
        }
        break;
    case 2:
    case 3:
        return resources[2];
    default:
        break;
    }
    func_020b5294();
    return 0;
}

/*
 * Return the global actor-database definition's type byte for actor `id`.
 * Retail ignores the apparent database argument while preserving the incoming
 * ID register across its global-address load.
 */
s32 func_02063658(void *database, u16 id)
{
    u8 *record;
    u8 *definition;

    (void)database;
    record = (u8 *)func_02063b90(data_021e9ad0, id);
    definition = *(u8 **)(record + 8);
    return definition[2];
}

/*
 * Return the index of the first eligible 0x24-byte entry in `state`, or -1
 * when none exists. The entry array at +4 is borrowed, +0x0c is its count,
 * and func_02062b28 supplies retail's eligibility predicate.
 */
s32 func_02065034(void *state)
{
    u8 *bytes = (u8 *)state;
    u8 *entries = *(u8 **)(bytes + 4);
    s32 count = *(s32 *)(bytes + 0x0c);
    s32 index;

    for (index = 0; index < count; ++index) {
        if (func_02062b28(entries + index * 0x24) != 0)
            return index;
    }
    return -1;
}

/*
 * Return one when `record` is an inactive kind-one descriptor with subtype
 * one. The descriptor and its database definition are borrowed; this query
 * has no side effects.
 */
s32 func_02062c68(void *record)
{
    u8 *bytes = (u8 *)record;
    u8 *definition;

    if (func_02062b28(record) != 0)
        return 0;
    definition = *(u8 **)(bytes + 8);
    if (definition[2] != 1)
        return 0;
    return *(u16 *)(bytes + 6) == 1;
}

/*
 * Count inactive kind-one/subtype-one descriptors in the borrowed 0x24-byte
 * entry array at +4. The signed count at +0x0c bounds the scan, matching the
 * retail loop; no state or ownership changes occur.
 */
s32 func_0206522c(void *state)
{
    u8 *bytes = (u8 *)state;
    u8 *entries = *(u8 **)(bytes + 4);
    s32 count = *(s32 *)(bytes + 0x0c);
    s32 matches = 0;
    s32 index;

    for (index = 0; index < count; ++index) {
        if (func_02062c68(entries + index * 0x24) != 0)
            ++matches;
    }
    return matches;
}

/*
 * Activate the first eligible 0x24-byte entry in `state`. Return zero without
 * changes when none is eligible. Otherwise initialize it for actor ID 0x3e,
 * increment the active count at +0x10, and return one.
 */
s32 func_02065270(void *state)
{
    u8 *bytes = (u8 *)state;
    s32 index = func_02065034(state);

    if (index < 0)
        return 0;
    func_020627d0(*(u8 **)(bytes + 4) + index * 0x24, 0x3e, 1, 0);
    ++*(u32 *)(bytes + 0x10);
    return 1;
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
