


/* Portable reconstructions of retail save-time game-state packers. */
#include "tingle/types.h"


extern void *memcpy(void *destination, const void *source, u32 size);
extern void *memset(void *destination, int value, u32 size);

extern void *gGameWork;
extern u8 data_021f5138[];
extern u8 data_021e9ad0[];
extern u8 data_021f4020[];
extern void *RetailRecordCategory_InsertById(void *category, u16 actor_id);
extern s32 func_02062e70(void *entry, const void *packed);
extern void RetailResourceDescriptor_LoadPackedState(void *entry, const void *packed);
extern void RecordDescriptor_BindById(void *entry, u16 id);
extern void RetailSelectionHistoryEntry_Init(void *entry, u16 identifier);
extern s32 func_0206fa9c(void *entry_slot);
extern void *ActorDatabase_FindDescriptorById(void *manager, u16 actor_id);
extern void OS_Halt(void);
extern void func_0207ec6c(void *category);
s32 RetailRecordCategory_IsRecordDiscovered(void *category, u16 record_id);

static u16 ReadU16(const u8 *bytes, u32 offset);
static u32 ReadU32(const u8 *bytes, u32 offset);
static void WriteU32(u8 *bytes, u32 offset, u32 value);
static u32 CategoryCount(const u8 *category, u32 selector);

/* Retail category-zero post-load hook is intentionally empty. */
void RetailRecordCategory0_PostLoadNoOp(void *category)
{
    (void)category;
}

/* Retail category post-load hook 0x0207A820 is intentionally empty. */
void RetailRecordCategory_PostLoadNoOp(void *category)
{
    (void)category;
}

#define DEFINE_RETAIL_EMPTY_HOOK(name) \
    void name(void *object) { (void)object; }

DEFINE_RETAIL_EMPTY_HOOK(RetailRecordSlot_DestroyNoOp)
DEFINE_RETAIL_EMPTY_HOOK(RetailRecordCategory8_PostLoadNoOp)
DEFINE_RETAIL_EMPTY_HOOK(RetailRecordCategory8_DestroyNoOp)
DEFINE_RETAIL_EMPTY_HOOK(RetailRecordChannelOneMenu_NoOp)
DEFINE_RETAIL_EMPTY_HOOK(RetailRecordChannelZeroMenu_NoOp)
DEFINE_RETAIL_EMPTY_HOOK(RetailRecordNonTypeOneMenu_NoOp)
DEFINE_RETAIL_EMPTY_HOOK(RetailRecordTypeOneMenu_NoOp)

#undef DEFINE_RETAIL_EMPTY_HOOK

/* Retail category post-load filter at 0x0207E9D8. */
void func_0207e9d8(void *category_pointer)
{
    u8 *category = (u8 *)category_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 index;

    if (*(s16 *)(work + 0x90) >= 5) {
        func_0207ec6c(category);
        return;
    }
    for (index = 0; index < CategoryCount(category, 1); ++index) {
        u8 *entry = *(u8 **)(category + 0x1c) + index * 0x10;
        u8 *record = *(u8 **)(entry + 4);
        u16 id = ReadU16(record, 0);
        if ((id == 0x27 || id == 0x28 || id == 0x2a ||
             (id >= 0x30 && id <= 0x36)) &&
            RetailRecordCategory_IsRecordDiscovered(category, id))
            WriteU32(record, 0x0c,
                     ReadU32(record, 0x0c) & ~0xa0000000u);
    }
}

static u16 ReadU16(const u8 *bytes, u32 offset)
{
    u16 value;
    memcpy(&value, bytes + offset, sizeof(value));
    return value;
}

static u32 ReadU32(const u8 *bytes, u32 offset)
{
    u32 value;
    memcpy(&value, bytes + offset, sizeof(value));
    return value;
}

static void WriteU16(u8 *bytes, u32 offset, u16 value)
{
    memcpy(bytes + offset, &value, sizeof(value));
}

static void WriteU32(u8 *bytes, u32 offset, u32 value)
{
    memcpy(bytes + offset, &value, sizeof(value));
}

s32 ActorDescriptor_IsInvalid(void *entry_pointer)
{
    u8 *entry = (u8 *)entry_pointer;
    u8 *metadata = *(u8 **)(entry + 8);

    if (metadata == 0)
        return 1;
    if (metadata[2] == 1)
        return ReadU16(entry, 6) == 0 && ReadU16(entry, 4) == 0;
    return ReadU16(entry, 4) == 0;
}

/* Restore one packed inventory entry. The word stores a 10-bit ID, five-bit
 * status, 10-bit quantity, and seven-bit subtype without overlapping fields. */
s32 func_02062e70(void *entry_pointer, const void *packed_pointer)
{
    u8 *entry = (u8 *)entry_pointer;
    u32 packed = *(const u32 *)packed_pointer;
    u8 *metadata;

    WriteU16(entry, 0, (u16)(packed & 0x3ff));
    metadata = (u8 *)ActorDatabase_FindDescriptorById(data_021e9ad0,
                                   (u16)(packed & 0x3ff));
    *(u8 **)(entry + 8) = metadata;
    WriteU16(entry, 2, (u16)((packed >> 10) & 0x1f));
    WriteU16(entry, 4, (u16)((packed >> 15) & 0x3ff));
    WriteU16(entry, 6, (u16)(packed >> 25));
    if (ActorDescriptor_IsInvalid(entry))
        return 0;
    if (metadata[2] == 1 && ReadU16(entry, 6) >= 2)
        WriteU16(entry, 6, 2);
    return 1;
}

void RetailResourceDescriptor_LoadPackedState(void *entry_pointer, const void *packed_pointer)
{
    u8 *entry = (u8 *)entry_pointer;
    const u8 *packed = (const u8 *)packed_pointer;
    u16 value = (u16)((ReadU16(packed, 2) & 0xf000u) >> 12);

    WriteU16(entry, 4, ReadU16(packed, 0));
    WriteU16(entry, 2, ReadU16(packed, 4));
    WriteU16(entry, 0x0c, value > 99 ? 99 : value);
}

static void *LookupActorRecord(u8 *manager, u16 identifier, u32 count_offset,
                               u32 table_offset, u32 stride)
{
    u8 *records = *(u8 **)(manager + table_offset);
    u32 index;
    for (index = 0; index < ReadU32(manager, count_offset); ++index) {
        if (ReadU16(records + index * stride, 0) == identifier)
            return records + index * stride;
    }
    OS_Halt();
    return 0;
}

/* Category-callback adapter for the global manager's record discovery query.
 * The category is borrowed but unused by the default implementation. */
s32 RetailRecordCategory_IsRecordDiscovered(void *category, u16 record_id)
{
    u8 *record;
    u32 bit;
    u8 *work = (u8 *)gGameWork;
    (void)category;

    record = (u8 *)LookupActorRecord(data_021f5138, record_id,
                                     0x20, 0, 0x8c);
    bit = ReadU16(record, 2);
    return work[0xee8 + (bit >> 3)] & (1u << (bit & 7));
}

void RecordDescriptor_LoadPackedState(void *entry_pointer, const void *packed_pointer)
{
    u8 *entry = (u8 *)entry_pointer;
    const u8 *packed = (const u8 *)packed_pointer;

    RecordDescriptor_BindById(entry, ReadU16(packed, 0));
    WriteU32(entry, 8, ReadU32(packed, 4));
    WriteU32(entry, 0x0c, ReadU16(packed, 2));
}

void RetailSelectionHistoryEntry_Init(void *entry_pointer, u16 identifier)
{
    u8 *entry = (u8 *)entry_pointer;
    u8 *record = (u8 *)LookupActorRecord(data_021f4020, identifier,
                                         8, 0, 0x66);
    WriteU16(entry, 0, identifier);
    *(u8 **)(entry + 4) = record;
    WriteU16(entry, 2, 0);
}

/*
 * Copy one borrowed eight-byte history entry into caller-owned storage. No
 * allocation occurs; the identifier, state halfword, and record pointer are
 * copied exactly as stored by retail.
 */
void RetailSelectionHistory_CopyEntry(void *destination_pointer, const void *source_pointer)
{
    u8 *destination = (u8 *)destination_pointer;
    const u8 *source = (const u8 *)source_pointer;

    WriteU16(destination, 0, ReadU16(source, 0));
    WriteU16(destination, 2, ReadU16(source, 2));
    *(void **)(destination + 4) = *(void *const *)(source + 4);
}

/*
 * Return one when `identifier` already occurs in the borrowed history array
 * at state +0x370, otherwise zero. The signed count at +0x460 is the retail
 * loop bound, and this query has no side effects.
 */
s32 RetailSelectionHistory_ContainsId(void *state_pointer, u16 identifier)
{
    u8 *state = (u8 *)state_pointer;
    s32 count = *(s32 *)(state + 0x460);
    s32 index;

    for (index = 0; index < count; ++index)
        if (ReadU16(state, 0x370 + index * 8) == identifier)
            return 1;
    return 0;
}

/*
 * Insert a unique identifier into the caller-owned history at state +0x370.
 * Entries whose record has a nonnegative signed byte at +3 are kept ahead of
 * the remaining entries. Existing entries are shifted in-place, the new
 * record is initialized through the borrowed retail database, and the count
 * at +0x460 is incremented. Duplicate identifiers leave state unchanged.
 */
void RetailSelectionHistory_InsertUniqueId(void *state_pointer, u16 identifier)
{
    u8 *state = (u8 *)state_pointer;
    u8 *entries = state + 0x370;
    s32 count;
    s32 index;

    if (RetailSelectionHistory_ContainsId(state, identifier) != 0)
        return;

    count = *(s32 *)(state + 0x460);
    if (count == 0) {
        RetailSelectionHistoryEntry_Init(entries, identifier);
    } else if (*(s8 *)(*(u8 **)(entries + 4) + 3) >= 0) {
        for (index = count; index > 1; --index)
            RetailSelectionHistory_CopyEntry(entries + index * 8,
                          entries + (index - 1) * 8);
        RetailSelectionHistoryEntry_Init(entries + 8, identifier);
    } else {
        for (index = count; index > 0; --index)
            RetailSelectionHistory_CopyEntry(entries + index * 8,
                          entries + (index - 1) * 8);
        RetailSelectionHistoryEntry_Init(entries, identifier);
    }
    *(s32 *)(state + 0x460) = count + 1;
}

s32 func_0206fa9c(void *entry_slot_pointer)
{
    u8 *entry = *(u8 **)entry_slot_pointer;
    s32 bit = *(s32 *)(entry + 0x104);
    u8 *work = (u8 *)gGameWork;

    if (bit < 0)
        return 0;
    return work[0xee0 + ((u32)bit >> 3)] & (1u << ((u32)bit & 7));
}

static void ResetPackedEntry(u8 *entry)
{
    WriteU16(entry, 2, 0);
    WriteU16(entry, 4, 0);
    WriteU16(entry, 6, 0);
    WriteU32(entry, 8, 0);
    WriteU32(entry, 0x0c, 0);
    WriteU32(entry, 0x20, 0);
}

/* Serialize the inverse 10/5/10/7-bit inventory-entry layout. */
static void PackEntry(const u8 *entry, u32 *packed)
{
    u32 word = *packed;
    word = (word & 0xfffffc00u) | (ReadU16(entry, 0) & 0x3ffu);
    word = (word & ~0x7c00u) | ((ReadU16(entry, 2) & 0x1fu) << 10);
    word = (word & 0xfe007fffu) | ((ReadU16(entry, 4) & 0x3ffu) << 15);
    word = (word & ~0xfe000000u) | ((u32)(ReadU16(entry, 6) & 0x7fu) << 25);
    *packed = word;
}

/* Exact portable behavior of assembly-selected retail 0x0206392C. */
void func_0206392c(void *state_pointer, s32 mode)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 index;

    if (mode == 1) {
        u8 *entries = *(u8 **)(state + 8);
        for (index = 0; index < *(u32 *)(state + 0x10); ++index)
            ResetPackedEntry(entries + index * 0x24);
        *(u32 *)(state + 0x14) = 0;

        entries = *(u8 **)(state + 0x38);
        for (index = 0; index < *(u32 *)(state + 0x40); ++index)
            ResetPackedEntry(entries + index * 0x24);
        *(u32 *)(state + 0x44) = 0;

        entries = *(u8 **)(state + 0x20);
        for (index = 0; index < *(u32 *)(state + 0x28); ++index) {
            WriteU16(entries + index * 0x24, 4, 0);
            WriteU16(entries + index * 0x24, 2, 0);
        }
    }
    for (index = 0; index < *(u32 *)(state + 0x10); ++index)
        PackEntry(*(u8 **)(state + 8) + index * 0x24,
                  (u32 *)(work + 0x850 + index * 4));
    for (index = 0; index < *(u32 *)(state + 0x28); ++index)
        PackEntry(*(u8 **)(state + 0x20) + index * 0x24,
                  (u32 *)(work + 0xbc0 + index * 4));
    for (index = 0; index < *(u32 *)(state + 0x40); ++index)
        PackEntry(*(u8 **)(state + 0x38) + index * 0x24,
                  (u32 *)(work + 0xd50 + index * 4));
}

/* Reset every descriptor in a borrowed group at retail 0x020782C0. */
void RetailResourceDescriptorGroup_ResetDescriptors(void *group_pointer)
{
    u8 *collection = (u8 *)group_pointer;
    u32 index;
    u32 count = *(u32 *)(collection + 4);
    u8 **items = *(u8 ***)(collection + 0);

    for (index = 0; index < count; ++index) {
        u8 *item = items[index];
        WriteU16(item, 2, 0);
        WriteU16(item, 6, 0);
        WriteU16(item, 4, ReadU16(item, 4) & 0x0ff0u);
        WriteU16(item, 0x0c, 0);
    }
}

static void PackCollectionEntry(const u8 *entry, u8 *result,
                                u32 group, u32 item)
{
    WriteU16(result, 0, ReadU16(entry, 4));
    WriteU16(result, 4, ReadU16(entry, 2));
    WriteU16(result, 2, (u16)(group | (item << 9) |
                              ((u32)ReadU16(entry, 0x0c) << 12)));
}

/* Reset every populated group in the manager at retail 0x0207865C. */
void RetailResourceDescriptorManager_ResetAllDescriptors(void *state_pointer)
{
    u8 *state = (u8 *)state_pointer;
    u32 group;

    for (group = 0; group < 0x10f; ++group) {
        u8 *collection = *(u8 **)(state + group * 4);

        if (collection != 0)
            RetailResourceDescriptorGroup_ResetDescriptors(collection);
    }
}

/* Exact portable behavior of assembly-selected retail 0x02078690. */
void RetailResourceDescriptorManager_SaveState(void *state_pointer, s32 mode)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 group;
    u32 output = 0;

    if (mode == 1)
        RetailResourceDescriptorManager_ResetAllDescriptors(state);
    WriteU16(work, 0x4efc, (u16)*(u32 *)(state + 0x43c));
    for (group = 0; group < 0x10f; ++group) {
        u8 *collection = *(u8 **)(state + group * 4);
        u32 item;
        if (collection == 0) continue;
        for (item = 0; item < *(u32 *)(collection + 4); ++item) {
            PackCollectionEntry((*(u8 ***)(collection + 0))[item],
                                work + 0x4f00 + output * 6, group, item);
            ++output;
        }
    }
}

static u32 CategoryCount(const u8 *category, u32 selector)
{
    if (selector == 2)
        return *(const u32 *)(category + 8) + *(const u32 *)(category + 0x0c);
    return *(const u32 *)(category + 8 + selector * 4);
}

static void PackCategoryEntry(const u8 *entry, u8 *result)
{
    WriteU16(result, 0, **(u16 *const *)(entry + 4));
    WriteU32(result, 4, *(const u32 *)(entry + 8));
    WriteU16(result, 2, (u16)*(const u32 *)(entry + 0x0c));
}

/* Serialize all category channels and the manager's ordered descriptor list. */
void RetailRecordManager_SaveState(void *state_pointer, s32 mode)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 category_index;

    if (mode == 1) {
        for (category_index = 0; category_index < 18; ++category_index) {
            u8 *category = *(u8 **)(state + category_index * 4);
            void (**vtable)(void *) = *(void (***)(void *))category;
            *(u32 *)(category + 8) = 0;
            *(u32 *)(category + 0x0c) = 0;
            vtable[3](category);
        }
        *(u32 *)(state + 0xcc8) = 0;
    }
    for (category_index = 0; category_index < 18; ++category_index) {
        u8 *category = *(u8 **)(state + category_index * 4);
        u32 base = category_index * 0x328;
        u32 selector;
        WriteU16(work, 0xfe8 + base, (u16)CategoryCount(category, 0));
        for (selector = 0; selector < CategoryCount(category, 0); ++selector)
            PackCategoryEntry(*(u8 **)(category + 0x18) + selector * 0x10,
                              work + 0xfec + base + selector * 8);
        WriteU16(work, 0x117c + base, (u16)CategoryCount(category, 1));
        for (selector = 0; selector < CategoryCount(category, 1); ++selector)
            PackCategoryEntry(*(u8 **)(category + 0x1c) + selector * 0x10,
                              work + 0x1180 + base + selector * 8);
    }
    WriteU32(work, 0x48b8, *(u32 *)(state + 0xcc8));
    for (category_index = 0; category_index < *(u32 *)(state + 0xcc8);
         ++category_index)
        PackCategoryEntry(state + 0x48 + category_index * 0x10,
                          work + 0x48bc + category_index * 8);
}

/* Exact portable behavior of assembly-selected retail 0x020981F0. */
void func_020981f0(void *state_pointer, s32 mode)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 index;
    u32 count;

    if (mode == 1) {
        for (index = 0; index < 30; ++index)
            WriteU16(state, 0x372 + index * 8, 0);
        *(u32 *)(state + 0x460) = 0;
    }
    count = *(u32 *)(state + 0x460);
    for (index = 0; index < count; ++index) {
        WriteU16(work, 0x5e14 + index * 4,
                 ReadU16(state, 0x370 + index * 8));
        WriteU16(work, 0x5e16 + index * 4,
                 ReadU16(state, 0x372 + index * 8) == 1 ? 1 : 0);
    }
    WriteU32(work, 0x5e10, count);
}

/* Serialize active record-index slots into the eight-byte GameWork bitmap.
 * Mode one clears the active set before serialization. */
void RuntimeRecordTable_SaveActiveState(void *state_pointer, s32 mode)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 index;

    if (mode == 1) {
        for (index = 0; index < 64; ++index)
            *(u32 *)(state + 8 + index * 4) = 0;
        *(u32 *)(state + 0x10c) = 0;
        *(u32 *)(state + 0x110) = 0;
    }
    memset(work + 0x5e8c, 0, 8);
    for (index = 0; index < *(u32 *)(state + 0x10c); ++index) {
        if (*(u32 *)(state + 8 + index * 4) != 0)
            work[0x5e8c + index / 8] |= (u8)(1u << (index & 7));
    }
}

/* Save-category reset callback at retail 0x0207E45C. */
void func_0207e45c(void *category_pointer)
{
    u8 *category = (u8 *)category_pointer;
    u8 *actors = *(u8 **)data_021f5138;
    u32 count = *(u32 *)(data_021f5138 + 0x20);
    u32 index;

    for (index = 0; index < count; ++index) {
        u8 *actor = actors + index * 0x8c;
        u32 packed = *(u32 *)(actor + 0x0c);
        u16 actor_id = *(u16 *)actor;
        if ((packed & 0xffu) == *(u32 *)(category + 4) &&
            (packed & 0xf00u) == 0 && actor_id != 0x98)
            (void)RetailRecordCategory_InsertById(category, actor_id);
    }
}

/* Exact portable behavior of assembly-selected retail 0x02063A00. */
void func_02063a00(void *state_pointer)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    static const u32 entry_offsets[3] = { 8, 0x20, 0x38 };
    static const u32 count_offsets[3] = { 0x10, 0x28, 0x40 };
    static const u32 active_offsets[3] = { 0x14, 0x2c, 0x44 };
    static const u32 work_offsets[3] = { 0x850, 0xbc0, 0xd50 };
    u32 group;

    for (group = 0; group < 3; ++group) {
        u32 active = 0;
        u32 index;
        for (index = 0; index < ReadU32(state, count_offsets[group]); ++index) {
            u8 *entry = *(u8 **)(state + entry_offsets[group]) + index * 0x24;
            if (func_02062e70(entry, work + work_offsets[group] + index * 4))
                active = (active + 1) & 0xffffu;
        }
        WriteU32(state, active_offsets[group], active);
    }
}

/* Exact portable behavior of assembly-selected retail 0x02078730. */
void RetailResourceDescriptorManager_LoadState(void *state_pointer)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 group;
    u32 packed_index = 0;

    WriteU32(state, 0x43c, ReadU16(work, 0x4efc));
    for (group = 0; group < 0x10f; ++group) {
        u8 *collection = *(u8 **)(state + group * 4);
        u32 item;
        if (collection == 0)
            continue;
        for (item = 0; item < ReadU32(collection, 4); ++item) {
            RetailResourceDescriptor_LoadPackedState((*(u8 ***)(collection + 0))[item],
                          work + 0x4f00 + packed_index * 6);
            ++packed_index;
        }
    }
}

/* Restore all category channels and the manager's ordered descriptor list. */
void RetailRecordManager_LoadState(void *state_pointer)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 category_index;

    for (category_index = 0; category_index < 18; ++category_index) {
        u8 *category = *(u8 **)(state + category_index * 4);
        u32 base = category_index * 0x328;
        u32 item;
        WriteU32(category, 8, ReadU16(work, 0xfe8 + base));
        for (item = 0; item < CategoryCount(category, 0); ++item)
            RecordDescriptor_LoadPackedState(*(u8 **)(category + 0x18) + item * 0x10,
                          work + 0xfec + base + item * 8);
        WriteU32(category, 0x0c, ReadU16(work, 0x117c + base));
        for (item = 0; item < CategoryCount(category, 1); ++item)
            RecordDescriptor_LoadPackedState(*(u8 **)(category + 0x1c) + item * 0x10,
                          work + 0x1180 + base + item * 8);
        ((void (*)(void *))(*(void ***)category)[4])(category);
    }
    WriteU32(state, 0xcc8, ReadU32(work, 0x48b8));
    for (category_index = 0; category_index < ReadU32(state, 0xcc8);
         ++category_index)
        RecordDescriptor_LoadPackedState(state + 0x48 + category_index * 0x10,
                      work + 0x48bc + category_index * 8);
}

/* Exact portable behavior of assembly-selected retail 0x02098298. */
void func_02098298(void *state_pointer)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 index;

    WriteU32(state, 0x460, ReadU32(work, 0x5e10));
    for (index = 0; index < ReadU32(state, 0x460); ++index) {
        u8 *entry = state + 0x370 + index * 8;
        RetailSelectionHistoryEntry_Init(entry, ReadU16(work, 0x5e14 + index * 4));
        if (ReadU16(work, 0x5e16 + index * 4) == 1)
            WriteU16(entry, 2, 1);
    }
}

/* Restore active record pointers and counters from the GameWork bitmap. */
void RuntimeRecordTable_LoadActiveState(void *state_pointer)
{
    u8 *state = (u8 *)state_pointer;
    u8 *work = (u8 *)gGameWork;
    u32 byte_index;
    u32 active = 0;

    WriteU32(state, 0x10c, 0);
    WriteU32(state, 0x110, 0);
    memset(state + 8, 0, 64 * sizeof(u32));
    for (byte_index = 0; byte_index < 8; ++byte_index) {
        u32 bit;
        for (bit = 0; bit < 8; ++bit) {
            if ((work[0x5e8c + byte_index] & (1u << bit)) != 0) {
                u32 index = byte_index * 8 + bit;
                *(u8 **)(state + 8 + index * 4) =
                    *(u8 **)state + index * 0x78;
                WriteU32(state, 0x10c, index + 1);
                ++active;
            }
        }
    }
    WriteU32(state, 0x110, active);
    WriteU16(work, 0x108, (u16)active);
}

/* Exact portable behavior of assembly-selected retail 0x0206F8C8. */
void func_0206f8c8(void *state_pointer)
{
    u8 *state = (u8 *)state_pointer;
    s32 highest = -1;
    u32 index;

    for (index = 0; index < ReadU32(state, 0); ++index) {
        u8 **slot = *(u8 ***)(state + 8) + index;
        if (func_0206fa9c(slot))
            highest = *(s32 *)(*slot + 0x108);
    }
    WriteU32(state, 4, (u32)(highest + 1));
}
