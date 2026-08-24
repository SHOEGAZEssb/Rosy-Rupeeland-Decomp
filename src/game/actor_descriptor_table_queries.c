/*
 * Recovered actor descriptor construction, selection, and resource queries.
 *
 * These routines borrow actor-database and descriptor-table storage. They
 * initialize caller-owned descriptor records and expose the resource IDs and
 * animation values selected by those records; ownership is never transferred.
 */
#include "tingle/types.h"

extern void ActorDescriptor_SetRangeEnd(void *records, u16 index);
extern s32 ActorDescriptor_IsInvalid(void *record);
extern s32 InventoryRecord_HasId(void *record, u16 selector);
extern void *InventoryRecord_GetMetadata(void *record);
extern s32 ActorDescriptorState_FindEligibleEntry(void *state);
extern void *ActorDatabase_FindDescriptorById(void *database, u16 id);
extern void func_02071ee0(void *resource, void *manager, u32 first,
                          u32 second, u32 third);
extern void LanguageDatabase_CopyRecordById(void *manager, u16 id, void *destination,
                          u32 destination_size);
extern u8 data_021e9ad0[];
extern u8 data_021f4090[];
extern void func_020b5294(void);
extern u8 data_020c4424[];
extern u8 data_021e9d2c[];
extern u8 gSystemState[];

#ifndef MATCHING
/* Clear one 0x24-byte runtime descriptor while retaining its leading ID.
 * All subordinate pointers are borrowed and are simply detached. */
void ActorDescriptor_ClearRuntime(void *self)
{
    u8 *record = (u8 *)self;

    *(u32 *)(record + 8) = 0;
    *(u32 *)(record + 0x0c) = 0;
    *(u32 *)(record + 0x20) = 0;
    *(u16 *)(record + 6) = 0;
    *(u16 *)(record + 4) = 0;
    *(u16 *)(record + 2) = 0;
}

/* Return the kind-zero descriptor's value field at resource offset +0x10.
 * Other actor-definition kinds have no value and return zero. */
s32 ActorDescriptor_GetKind0Value(void *self)
{
    u8 *definition = *(u8 **)((u8 *)self + 8);

    if (definition[2] != 0)
        return 0;
    return *(s32 *)(*(u8 **)(definition + 8) + 0x10);
}
#endif

/* Return the actor-database definition type for one actor ID (0x02062DE4). */
s32 ActorDatabase_GetDefinitionKind(u16 id)
{
    u8 *record = (u8 *)ActorDatabase_FindDescriptorById(data_021e9ad0, id);
    u8 *definition = *(u8 **)(record + 8);

    return definition[2];
}

/*
 * Initialize a range descriptor for actor `id`. The database definition at
 * +8 is borrowed, and `lastIndex` is clamped to retail's inclusive limit by
 * ActorDescriptor_SetRangeEnd. The caller retains ownership of the descriptor.
 */
void ActorDescriptor_InitRange(void *self, u16 id, u16 lastIndex)
{
    u8 *record = (u8 *)self;

    *(u16 *)record = id;
    *(void **)(record + 8) = ActorDatabase_FindDescriptorById(data_021e9ad0, id);
    ActorDescriptor_SetRangeEnd(record, lastIndex);
}

/*
 * Clamp the descriptor quantity at +4 to 99. For kind two, a nonzero quantity
 * also sets status bit 1 in the halfword at +2. No storage is allocated.
 */
void ActorDescriptor_SetQuantity(void *self, u16 quantity)
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
 * applied by ActorDescriptor_SetQuantity, including its kind-two status effect.
 */
void ActorDescriptor_Init(void *self, u16 id, u16 kind, u16 quantity)
{
    u8 *record = (u8 *)self;

    *(u16 *)record = id;
    *(void **)(record + 8) = ActorDatabase_FindDescriptorById(data_021e9ad0, id);
    *(u16 *)(record + 6) = kind;
    ActorDescriptor_SetQuantity(record, quantity);
}

/* Clamp a descriptor record count/index to retail's inclusive maximum 99. */
void ActorDescriptor_SetRangeEnd(void *self, u16 index)
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
void ActorDescriptor_SetActive(void *self, s32 enabled)
{
    u8 *record = (u8 *)self;
    u16 flags = *(u16 *)(record + 4);

    if (enabled != 0) {
        if ((flags & 0x0f) == 1)
            return;
        if ((flags & 0x1000) == 0) {
            ActorDescriptor_SetRangeEnd(record + 8,
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
void *ActorDescriptor_GetComponent(void *self, s32 index)
{
    return (u8 *)self + (index == 0 ? 0x10 : 0x18);
}

/*
 * Load the localized 0x200-byte detail resource selected by an inventory
 * record into the actor database's scratch buffer at +0x50 and return that
 * borrowed buffer. Kind-one empty subtype records use the database default
 * actor's resource ID; all other valid records use their own metadata ID.
 */
void *ActorDescriptor_LoadDetailResource(void *self)
{
    u8 *record = (u8 *)self;
    u8 *metadata = *(u8 **)(record + 8);
    u16 resource_id;

    if (metadata[2] == 1 && *(u16 *)(record + 4) == 0 &&
        *(u16 *)(record + 6) != 2) {
        metadata = *(u8 **)(data_021e9ad0 + 0x254);
    }
    resource_id = *(u16 *)(metadata + 6);
    LanguageDatabase_CopyRecordById(data_021f4090, resource_id, data_021e9ad0 + 0x50,
                  0x200);
    return data_021e9ad0 + 0x50;
}

/*
 * Return the localized primary label selected by one actor descriptor. Kind
 * one normally uses definition +0x10, but its zero-quantity subtype-one case
 * borrows the database default definition. Other kinds use definition +0x10.
 * Returned strings remain owned by the database.
 */
void *ActorDescriptor_GetPrimaryLabel(void *self)
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
s32 ActorDescriptor_GetPanelImage(void *self)
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

#ifndef MATCHING
/* Return the descriptor subtype halfword at +6. The borrowed descriptor is
 * not modified, and retail performs no validation. */
s32 ActorDescriptor_GetSubtype(void *self)
{
    return *(u16 *)((u8 *)self + 6);
}
#endif

#ifndef MATCHING
/* Return the presentation animation selected by a descriptor. Kind-two
 * definitions always use animation seven. Other supported kinds map panel
 * image two to animation nine and every remaining image to animation six.
 * The descriptor and its definition remain borrowed and are not modified. */
s32 ActorDescriptor_GetPresentationAnimation(void *self)
{
    u8 *definition = *(u8 **)((u8 *)self + 8);

    if (definition[2] == 2)
        return 7;
    if (ActorDescriptor_GetPanelImage(self) == 2)
        return 9;
    return 6;
}
#endif

/*
 * Return the localized secondary panel label. Kind one normally selects the
 * resource string at +8, with a fixed empty-subtype label for its zero-value
 * subtype one. Other kinds select one of the 0x40-byte language records at
 * 0x020C4424. Returned strings are borrowed.
 */
void *ActorDescriptor_GetSecondaryLabel(void *self)
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
s32 ActorDescriptor_GetKind0Animation(void *self)
{
    u8 *definition = *(u8 **)((u8 *)self + 8);

    if (definition[2] == 0)
        return (*(u8 **)(definition + 8))[6];
    return 0;
}

/* Resolve the backing resource record selected by one descriptor component. */
void *ActorDescriptorComponent_ResolveResource(void *self)
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
void ActorDescriptorComponent_LoadResources(void *self, void *manager, void *resource)
{
    u8 *resolved = (u8 *)ActorDescriptorComponent_ResolveResource(self);

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
s32 ActorDescriptorComponent_GetAnimation(void *self)
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
s32 ActorDatabase_QueryDefinitionKind(void *database, u16 id)
{
    u8 *record;
    u8 *definition;

    (void)database;
    record = (u8 *)ActorDatabase_FindDescriptorById(data_021e9ad0, id);
    definition = *(u8 **)(record + 8);
    return definition[2];
}

/*
 * Return the index of the first eligible 0x24-byte entry in `state`, or -1
 * when none exists. The entry array at +4 is borrowed, +0x0c is its count,
 * and ActorDescriptor_IsInvalid supplies retail's eligibility predicate.
 */
s32 ActorDescriptorState_FindEligibleEntry(void *state)
{
    u8 *bytes = (u8 *)state;
    u8 *entries = *(u8 **)(bytes + 4);
    s32 count = *(s32 *)(bytes + 0x0c);
    s32 index;

    for (index = 0; index < count; ++index) {
        if (ActorDescriptor_IsInvalid(entries + index * 0x24) != 0)
            return index;
    }
    return -1;
}

/*
 * Find the first inactive kind-one descriptor accepted by `selector` and
 * return its quantity halfword. The state and its 0x24-byte entry array are
 * borrowed. Retail returns zero when no matching entry exists and makes no
 * changes to either object.
 */
s32 ActorDescriptorState_FindInactiveQuantity(void *state, u16 selector)
{
    u8 *bytes = (u8 *)state;
    u8 *entries = *(u8 **)(bytes + 4);
    s32 count = *(s32 *)(bytes + 0x0c);
    s32 index;

    for (index = 0; index < count; ++index) {
        u8 *entry = entries + index * 0x24;
        u8 *definition;

        if (ActorDescriptor_IsInvalid(entry) != 0)
            continue;
        definition = (u8 *)InventoryRecord_GetMetadata(entry);
        if (definition[2] != 1)
            continue;
        if (InventoryRecord_HasId(entry, selector) != 0)
            return *(u16 *)(entry + 4);
    }
    return 0;
}

/*
 * Return one when `record` is an inactive kind-one descriptor with subtype
 * one. The descriptor and its database definition are borrowed; this query
 * has no side effects.
 */
s32 ActorDescriptor_IsInactiveKind1Subtype1(void *record)
{
    u8 *bytes = (u8 *)record;
    u8 *definition;

    if (ActorDescriptor_IsInvalid(record) != 0)
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
s32 ActorDescriptorState_CountInactiveKind1Subtype1(void *state)
{
    u8 *bytes = (u8 *)state;
    u8 *entries = *(u8 **)(bytes + 4);
    s32 count = *(s32 *)(bytes + 0x0c);
    s32 matches = 0;
    s32 index;

    for (index = 0; index < count; ++index) {
        if (ActorDescriptor_IsInactiveKind1Subtype1(entries + index * 0x24) != 0)
            ++matches;
    }
    return matches;
}

/*
 * Activate the first eligible 0x24-byte entry in `state`. Return zero without
 * changes when none is eligible. Otherwise initialize it for actor ID 0x3e,
 * increment the active count at +0x10, and return one.
 */
s32 ActorDescriptorState_ActivateFirstEligible(void *state)
{
    u8 *bytes = (u8 *)state;
    s32 index = ActorDescriptorState_FindEligibleEntry(state);

    if (index < 0)
        return 0;
    ActorDescriptor_Init(*(u8 **)(bytes + 4) + index * 0x24, 0x3e, 1, 0);
    ++*(u32 *)(bytes + 0x10);
    return 1;
}

/* Return the three resource identifiers stored after a resolved record key. */
u32 ActorDescriptorComponent_GetCharacterResourceId(void *self)
{
    return *(u32 *)((u8 *)ActorDescriptorComponent_ResolveResource(self) + 4);
}

u32 ActorDescriptorComponent_GetPaletteResourceId(void *self)
{
    return *(u32 *)((u8 *)ActorDescriptorComponent_ResolveResource(self) + 8);
}

u32 ActorDescriptorComponent_GetCellResourceId(void *self)
{
    return *(u32 *)((u8 *)ActorDescriptorComponent_ResolveResource(self) + 0x0c);
}

/*
 * Resolve one record from the active two-level descriptor-table collection.
 * All returned storage is borrowed and the retail routine performs no bounds
 * checks, so callers must supply validated table and record indices.
 */
void *RetailResourceDescriptorManager_GetDescriptor(
    void **tables, s32 tableIndex, s32 recordIndex)
{
    void **table = *(void ***)tables[tableIndex];

    return table[recordIndex];
}

/*
 * Return the count word at +4 of one optional table entry. Indices at or
 * above the retail table capacity (0x10e), and null entries, return zero.
 */
s32 RetailResourceDescriptorManager_GetGroupDescriptorCount(
    void **tables, s32 index)
{
    u8 *entry;

    if (index >= 0x10e)
        return 0;
    entry = (u8 *)tables[index];
    return entry != 0 ? *(s32 *)(entry + 4) : 0;
}
