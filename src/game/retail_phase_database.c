


/* Portable reconstruction of the retail phase descriptor aggregate. */
#include "tingle/checked_fs.h"
#include "tingle/game_work.h"
#include "tingle/heap.h"
#include "tingle/types.h"


extern void *memcpy(void *destination, const void *source, u32 size);
extern void *memset(void *destination, int value, u32 size);

extern const char data_020e5908[];
extern const char data_020e5910[];
extern const char data_020e5920[];
extern const char data_020e5050[];
extern u8 data_021e9ac0[];
extern u8 data_021e9ad0[];
extern u8 data_021e9de8[];
extern u8 data_021e9e00[];
extern u8 data_021e9e1c[];
extern void OS_Halt(void);
extern void *func_02063b90(void *database, u16 id);
extern void func_020634b0(void *manager);
extern void func_02022fbc(void *descriptor);
extern void func_020627a0(void *descriptor, u16 id, u16 last_index);
extern void func_020627d0(void *descriptor, u16 id, u16 kind, u16 quantity);
extern void *func_02062728(void *destination, const void *source);

#ifndef MATCHING
extern void func_02064e28(void *collection);
extern void *func_02064a18(void *collection, void *incoming);
extern s32 func_0206492c(void *collection, u16 id);
extern void func_02062744(void *destination, const void *source);
extern void func_02062808(void *record);
extern void func_02062874(void *record, u16 quantity);
#endif

/* Retain one borrowed phase-record pointer in a caller-owned result slot. */
void func_0206fa94(void *destination, void *phase)
{
    *(void **)destination = phase;
}

/* Return the 0x10C-byte phase record whose leading halfword matches id
 * (retail 0x0206F360). The database retains ownership; a missing identifier
 * is a retail invariant violation and reaches the halt boundary. */
void *func_0206f360(void *database_pointer, u16 id)
{
    u8 *database = (u8 *)database_pointer;
    u8 *records = *(u8 **)database;
    u32 count = *(u32 *)(database + 8);
    u32 index;

    for (index = 0; index < count; ++index) {
        u8 *record = records + index * 0x10c;
        if (*(u16 *)record == id)
            return record;
    }
    OS_Halt();
    return 0;
}

/* Store the phase record selected from the global phase database into the
 * caller's borrowed pointer slot (retail 0x0206FA70). The identifier is
 * truncated to u16 exactly as in retail; no allocation or hardware I/O occurs. */
void func_0206fa70(void **destination, u16 id)
{
    *destination = func_0206f360(data_021e9de8, id);
}

static u16 ReadU16(const u8 *bytes)
{
    return (u16)(bytes[0] | ((u16)bytes[1] << 8));
}

static void InitializeActorEntry(u8 *entry, u16 actor_id, u16 quantity,
                                 u16 field6)
{
    if (field6 == 1)
        func_020627d0(entry, actor_id, field6, quantity);
    else
        func_020627a0(entry, actor_id, quantity);
}

/* Construct the seven self-linked actor descriptors embedded in one record. */
static void InitializePhaseRecord(u8 *record)
{
    u32 index;

    func_02022fbc(record + 4);
    for (index = 0; index < 6; ++index)
        func_02022fbc(record + 0x28 + index * 0x24);
    *(u16 *)(record + 0) = 0;
    *(u16 *)(record + 2) = 0;
    *(u32 *)(record + 0x100) = 0;
    *(u32 *)(record + 0x104) = 0;
    *(u32 *)(record + 0x108) = 0;
}

/* Assign a phase record while retaining every destination descriptor's
 * constructor-established self-links, as retail func_0206F6E0 does. */
static void CopyPhaseRecord(u8 *destination, const u8 *source)
{
    u32 index;

    *(u16 *)(destination + 0) = *(const u16 *)(source + 0);
    *(u16 *)(destination + 2) = *(const u16 *)(source + 2);
    func_02062728(destination + 4, source + 4);
    for (index = 0; index < 6; ++index)
        func_02062728(destination + 0x28 + index * 0x24,
                      source + 0x28 + index * 0x24);
    *(u32 *)(destination + 0x100) = *(const u32 *)(source + 0x100);
    *(u32 *)(destination + 0x104) = *(const u32 *)(source + 0x104);
    *(u32 *)(destination + 0x108) = *(const u32 *)(source + 0x108);
}

/* Load, filter, and sort 0x10c-byte phase records at retail 0x0206F3A4. */
void func_0206f3a4(void *database_pointer)
{
    u8 *database = (u8 *)database_pointer;
    FSFile file;
    FSFileID file_id;
    u8 header[0x10];
    u8 input[0x20];
    u32 file_count;
    u32 stored_count = 0;
    u32 file_index;
    u32 index;
    u8 *records;

    CheckedFS_InitFile(&file);
    CheckedFS_ConvertPathToFileID(&file_id, data_020e5910);
    CheckedFS_OpenFileFast(&file, file_id);
    if (CheckedFS_ReadFile(&file, header, sizeof(header)) < sizeof(header))
        OS_Halt();
    file_count = ReadU16(header);
    if (*(void **)database != 0)
        Heap_Free(*(void **)database);
    records = Heap_Alloc((file_count - 3) * 0x10c, data_020e5908, 4,
                         &gHeapContext);
    for (index = 0; index < file_count - 3; ++index)
        InitializePhaseRecord(records + index * 0x10c);
    *(u8 **)database = records;
    *(u32 *)(database + 4) = file_count - 3;
    for (file_index = 0; file_index < file_count; ++file_index) {
        u16 phase_id;
        u8 *record;
        u32 actor_count = 0;

        if (CheckedFS_ReadFile(&file, input, sizeof(input)) < sizeof(input))
            OS_Halt();
        phase_id = ReadU16(input + 0);
        if (phase_id == 0x1c || phase_id == 0x1e || phase_id == 0x22)
            continue;
        record = records + stored_count * 0x10c;
        *(u16 *)(record + 0) = phase_id;
        *(u16 *)(record + 2) = ReadU16(input + 0x1c);
        InitializeActorEntry(record + 4, ReadU16(input + 2), 1, 1);
        for (index = 0; index < 6; ++index) {
            u16 actor_id = ReadU16(input + 4 + index * 4);

            if (actor_id == 0x55)
                break;
            InitializeActorEntry(record + 0x28 + index * 0x24, actor_id,
                                 ReadU16(input + 6 + index * 4), 0);
            ++actor_count;
        }
        *(u32 *)(record + 0x100) = actor_count;
        ++stored_count;
    }
    CheckedFS_CloseFile(&file);
    *(u32 *)(database + 8) = file_count - 3;
    for (index = 0; index < file_count - 3; ++index)
        *(u32 *)(records + index * 0x10c + 0x104) = index;
    for (index = 1; index < file_count - 3; ++index) {
        u32 position = index;

        while (position != 0 &&
               *(u16 *)(records + position * 0x10c + 2) <
                   *(u16 *)(records + (position - 1) * 0x10c + 2)) {
            u8 temporary[0x10c];

            memcpy(temporary, records + position * 0x10c, sizeof(temporary));
            CopyPhaseRecord(records + position * 0x10c,
                            records + (position - 1) * 0x10c);
            CopyPhaseRecord(records + (position - 1) * 0x10c, temporary);
            --position;
        }
    }
    for (index = 0; index < file_count - 3; ++index)
        *(u32 *)(records + index * 0x10c + 0x108) = index;
}

/* Construct the fixed 15-entry phase runtime pool at 0x0206FC00. */
void func_0206fc00(void *container_pointer)
{
    u8 *container = (u8 *)container_pointer;
    u32 index;
    u8 *entries = Heap_Alloc(15 * 0x24, data_020e5050, 4, &gHeapContext);

    *(u32 *)(container + 4) = 0;
    *(u8 **)(container + 8) = entries;
    *(s32 *)(container + 0x0c) = -1;
    *(u32 *)(container + 0x10) = 15;
    *(u32 *)(container + 0x14) = 0;
    *(u32 *)(container + 0x18) = 0;
    for (index = 0; index < 15; ++index)
        memset(entries + index * 0x24, 0, 0x24);
}

#ifndef MATCHING
/* Reset the phase-selection collection and its embedded result descriptor.
 * Allocated collection storage remains owned by the container. */
void func_0206fc20(void *container)
{
    func_02064e28(container);
    func_02062808((u8 *)container + 0x1c);
}

/* Add one actor ID to the phase-selection collection using a temporary,
 * self-linked descriptor. Retail halts when the fixed collection is full. */
void func_0206fc38(void *container, u16 actor_id, s32 quantity)
{
    u8 descriptor[0x24];

    memset(descriptor, 0, sizeof(descriptor));
    *(void **)(descriptor + 0x14) = descriptor;
    *(u32 *)(descriptor + 0x18) = 1;
    *(void **)(descriptor + 0x1c) = descriptor;
    func_020627a0(descriptor, actor_id, (u16)quantity);
    if (func_02064a18(container, descriptor) == 0)
        OS_Halt();
}

/* Find a phase record whose ingredient IDs match the selected collection and
 * whose quantities all yield the same exact positive multiplier. The record
 * is borrowed from database; multiplier receives that common quotient. */
static u8 *FindMatchingPhase(void *database_pointer, void *container_pointer,
                             s32 *multiplier)
{
    u8 *database = (u8 *)database_pointer;
    u8 *container = (u8 *)container_pointer;
    u8 *records = *(u8 **)database;
    s32 phase_index;

    for (phase_index = 0; phase_index < *(s32 *)(database + 8);
         ++phase_index) {
        u8 *phase = records + phase_index * 0x10c;
        s32 common = 0;
        s32 ingredient;
        s32 valid = 1;

        if (*(s32 *)(phase + 0x100) != *(s32 *)(container + 0x14))
            continue;
        for (ingredient = 0; ingredient < *(s32 *)(phase + 0x100);
             ++ingredient) {
            u8 *required = phase + 0x28 + ingredient * 0x24;
            u8 *definition = *(u8 **)(required + 8);
            s32 selected_index = func_0206492c(
                container, *(u16 *)definition);
            u16 available;
            u16 needed;
            s32 quotient;

            if (selected_index < 0) {
                valid = 0;
                break;
            }
            available = *(u16 *)(*(u8 **)(container + 8) +
                                  selected_index * 0x24 + 4);
            needed = *(u16 *)(required + 4);
            quotient = available / needed;
            if (available % needed != 0 ||
                (common > 0 && quotient != common)) {
                valid = 0;
                break;
            }
            common = quotient;
        }
        if (valid) {
            *multiplier = common;
            return phase;
        }
    }
    return 0;
}

/* Resolve and materialize the output descriptor for the selected ingredient
 * combination. Returns one on a match and zero when no phase fits. */
static s32 BuildMatchingPhaseResult(void *container, void *output)
{
    s32 multiplier = 0;
    u8 *phase = FindMatchingPhase(data_021e9de8, container, &multiplier);

    if (phase == 0)
        return 0;
    func_02062744(output, phase + 4);
    func_02062874(output, (u16)multiplier);
    return 1;
}

/* Build the embedded phase result and scale its quantity by category. */
s32 func_0206fca0(void *container, s32 category)
{
    u8 *result = (u8 *)container + 0x1c;

    if (!BuildMatchingPhaseResult(container, result))
        return 0;
    func_02062874(result, (u16)(category * *(u16 *)(result + 4)));
    return 1;
}

/* Retain and return the phase record matching the current ingredient set.
 * The borrowed record pointer is stored in the container's slot at +0x40. */
void *func_0206fd30(void *container)
{
    s32 multiplier = 0;
    void *phase = FindMatchingPhase(data_021e9de8, container, &multiplier);

    if (phase == 0)
        return 0;
    func_0206fa94((u8 *)container + 0x40, phase);
    return (u8 *)container + 0x40;
}
#endif

/* Build the phase-record pointer view at retail 0x0206F7BC. */
void func_0206f7bc(void *manager_pointer)
{
    u8 *manager = (u8 *)manager_pointer;
    u8 *records = *(u8 **)data_021e9de8;
    u32 count = *(u32 *)(data_021e9de8 + 8);
    u32 index;
    u8 *allocation;
    void **pointers;

    *(u32 *)manager = count;
    allocation = Heap_Alloc(count * 4 + 8, data_020e5920, 4,
                            &gHeapContext);
    *(u32 *)allocation = 4;
    *(u32 *)(allocation + 4) = count;
    pointers = (void **)(allocation + 8);
    *(void ***)(manager + 8) = pointers;
    *(u32 *)(manager + 0x0c) = count;
    *(u32 *)(manager + 4) = 0;
    for (index = 0; index < count; ++index)
        pointers[index] = records + index * 0x10c;
}

/* Mark the phase record referenced by a manager pointer slot as unlocked
 * (retail 0x0206FAD8). The slot and record remain manager-owned. The record's
 * signed bit index at +0x104 selects one bit in GameWork +0xEE0; retail does
 * not validate that index because every canonical phase record supplies one. */
void func_0206fad8(void *slot_pointer)
{
    u8 *record = *(u8 **)slot_pointer;
    s32 bit = *(s32 *)(record + 0x104);

    gGameWork->bytes0EE0[(u32)bit >> 3] |=
        (u8)(1u << ((u32)bit & 7));
}

/* Unlock the phase/recipe identified by its leading halfword (retail
 * 0x0206F914). The manager's +4 high-water mark advances to one past the
 * matching pointer index. After the first unlock, retail sets game flag 0x15
 * once every phase record is unlocked. Unknown identifiers leave the table
 * unchanged apart from the same completion scan used by retail. */
void func_0206f914(void *manager_pointer, u16 id)
{
    u8 *manager = (u8 *)manager_pointer;
    u32 count = *(u32 *)manager;
    void **slots = *(void ***)(manager + 8);
    u32 high_water = 0;
    u32 index;

    for (index = 0; index < count; ++index) {
        if (*(u16 *)slots[index] == id) {
            func_0206fad8(&slots[index]);
            high_water = index + 1;
            break;
        }
    }
    if (*(u32 *)(manager + 4) < high_water)
        *(u32 *)(manager + 4) = high_water;

    if (GameWork_TestFlag(gGameWork, 0x15))
        return;
    for (index = 0; index < count; ++index) {
        s32 bit = *(s32 *)((u8 *)slots[index] + 0x104);

        if ((gGameWork->bytes0EE0[(u32)bit >> 3] &
             (u8)(1u << ((u32)bit & 7))) == 0)
            return;
    }
    GameWork_SetFlag(gGameWork, 0x15);
}

/* Execute the exact retail phase database aggregate order at 0x0206F780. */
void func_0206f780(void)
{
    func_0206f3a4(data_021e9de8);
    func_0206fc00(data_021e9e1c);
    func_0206f7bc(data_021e9e00);
    func_020634b0(*(void **)data_021e9ac0);
}


