


/* Portable reconstruction of the retail cartridge/save context bootstrap. */
#include "tingle/heap.h"
#include "tingle/types.h"


extern void *memset(void *destination, int value, u32 size);

extern const char data_020ef368[];
extern u8 data_021f5da0[];

extern void CARD_Init(void);
extern void func_020bd76c(void (*callback)(void));
extern u32 OS_GetLockID(void);
extern void OS_Halt(void);
extern void func_020bc02c(u16 lock_id);
extern void func_020bc01c(u16 lock_id);
extern s32 func_020bc704(u32 backup_type);
extern u32 func_020bc860(void);
extern s32 func_020bc874(u32 source, void *destination, u32 size,
                         u32 offset, u32 unused0, u32 unused1,
                         u32 operation, u32 retry_count, u32 async,
                         u32 *result);
extern void func_02080e60(void);
extern const u32 data_020ef330[];
extern u8 data_021f5da0[];
extern void *func_02003e20(u32 size, const char *tag, s32 alignment,
                           HeapContext *context);
extern void func_02003e38(void *allocation);
extern s32 func_020bc6f8(void);
extern s32 func_020bc07c(void);
extern void MI_CpuCopy8(const void *source, void *destination, u32 size);
extern void *gGameWork;
extern u32 GameWork_Serialize(void *work, void *buffer, u32 bufferSize);
extern void GameWork_Deserialize(void *work, const void *buffer, u32 bufferSize);
extern void func_0207f0c0(void);
extern void *func_02027f94(void);
extern s32 func_02027854(void *state);
extern s32 func_02027e8c(void *state);
extern s32 func_02027e9c(void *state);
extern void func_0206392c(void *state, s32 mode);
extern void func_0207a594(void *state, s32 mode);
extern void func_02078690(void *state, s32 mode);
extern void func_020981f0(void *state, s32 mode);
extern void func_02079c0c(void *state, s32 mode);
extern void *data_021e9ac0;
extern void *data_021f5128;
extern u8 data_021f38fc[];
extern u8 data_021f5f18[];
extern u8 data_021f3d68[];
extern u8 data_021e9e00[];
extern void func_02063a00(void *state);
extern void func_0207a6e0(void *state);
extern void func_02078730(void *state);
extern void func_02098298(void *state);
extern void func_02079ca8(void *state);
extern void func_0206f8c8(void *state);
extern void Type7Actor_LoadPersistentState(void);
extern void *PackedTimerArray_GetGlobal(void);
extern void PackedTimerArray_LoadFromGameWork(void *array);
extern void func_02027930(void *state);
extern void func_02004458(s32 mode);

static u32 retail_save_crc32(const u8 *bytes, u32 size);
static s32 retail_save_header_valid(const u8 *header);
static s32 retail_save_payload_valid(const u8 *record);
static void retail_save_release_game_buffer(void);
static s32 retail_save_poll(void *context_pointer);
static void retail_save_begin_read(void *context_pointer, u32 offset,
                                   void *destination, u32 size);
static void retail_save_begin_write(void *context_pointer, u32 offset,
                                    const void *source, u32 size);

/* Restore every game-owned singleton mirrored in GameWork after a load. */
void func_0207f0c0(void)
{
    void *progress;

    func_02063a00(data_021e9ac0);
    func_0207a6e0(data_021f5128);
    func_02078730(data_021f38fc);
    func_02098298(data_021f5f18);
    func_02079ca8(data_021f3d68);
    func_0206f8c8(data_021e9e00);
    Type7Actor_LoadPersistentState();
    PackedTimerArray_LoadFromGameWork(PackedTimerArray_GetGlobal());
    progress = func_02027f94();
    func_02027930(progress);
}

/* Construct the 0x1c0-byte retail save context at 0x0207F168. */
void *func_0207f168(void *context_pointer)
{
    u8 *context = (u8 *)context_pointer;
    u32 index;
    u32 lock_id;

    *(u32 *)(context + 0x00) = 0;
    *(u32 *)(context + 0x14) = 0;
    CARD_Init();
    func_020bd76c(func_02080e60);
    lock_id = OS_GetLockID();
    if (lock_id == 0xfffffffd)
        OS_Halt();
    *(u16 *)(context + 0x04) = (u16)lock_id;
    func_020bc02c((u16)lock_id);
    if (!func_020bc704(0x1202) || (func_020bc860() & 0xff) != 2) {
        func_020bc01c((u16)lock_id);
        return context;
    }
    func_020bc01c((u16)lock_id);
    *(u32 *)(context + 0x10) = 0;
    *(u32 *)(context + 0x08) = 0;
    *(u32 *)(context + 0x20) = 0;
    for (index = 0; index < 3; ++index)
        memset(context + 0x38 + index * 0x34, 0, 0x34);
    return context;
}

/* Allocate and publish the retail save context at 0x0207F12C. */
void func_0207f12c(void)
{
    void *context = Heap_Alloc(0x1c0, data_020ef368, 4, &gHeapContext);

    if (context != 0) {
        /* The retail root arena is BSS-backed on first boot. Preserve those
         * initial zero bytes for fields the constructor intentionally leaves
         * untouched until an operation selects record indices. */
        memset(context, 0, 0x1c0);
        context = func_0207f168(context);
    }
    *(void **)(data_021f5da0 + 0x10) = context;
}

/* Perform the retail backup-device identification transaction at 0x0207F288. */
s32 func_0207f288(void *context_pointer)
{
    u8 *context = (u8 *)context_pointer;
    u32 result = 0;
    s32 success;

    func_020bc02c(*(u16 *)(context + 4));
    success = func_020bc874(0, &result, 1, 0, 0, 0, 6, 1, 0, &result);
    func_020bc01c(*(u16 *)(context + 4));
    return success;
}

/* Dispatch the active save-operation pointer-to-member and publish its status
 * exactly as retail 0x0207f248. */
s32 func_0207f248(void *context_pointer)
{
    u8 *context = (u8 *)context_pointer;
    u32 function_word = *(u32 *)(context + 0x1b8);
    s32 adjustment_word = *(s32 *)(context + 0x1bc);
    u8 *adjusted = context + (adjustment_word >> 1);
    s32 (*function)(void *);
    s32 result;

    if ((adjustment_word & 1) != 0) {
        u8 *vtable = *(u8 **)adjusted;
        function = *(s32 (**)(void *))(vtable + function_word);
    } else {
        function = (s32 (*)(void *))(u32)function_word;
    }
    result = function(adjusted);
    *(s32 *)(context + 0x0c) = result;
    if (result != 0)
        *(u32 *)(context + 0x08) = 0;
    return result;
}

/* Begin the retail save-discovery operation at 0x0207f2e0. */
s32 func_0207f2e0(void *context_pointer, s32 mode)
{
    u8 *context = (u8 *)context_pointer;

    *(s32 *)(context + 0x00) = mode;
    *(u32 *)(context + 0x10) = 0;
    *(u32 *)(context + 0x08) = 1;
    *(u32 *)(context + 0x1b8) = data_020ef330[2];
    *(u32 *)(context + 0x1bc) = data_020ef330[3];
    *(u32 *)(context + 0x1b4) = 0;
    if (mode == 0) {
        do {
            *(s32 *)(context + 0x28) = func_0207f248(context);
        } while (*(s32 *)(context + 0x28) == 0);
    } else {
        *(u32 *)(context + 0x28) = 0;
    }
    return *(s32 *)(context + 0x28);
}

/* Retail 0x0207F348 save-directory discovery state machine. It first scans
 * the six directory headers from the final mirror backwards to recognize a
 * formatted EEPROM. It then validates each primary record, retries its mirror
 * when the payload CRC fails, and reconstructs the three 0x34-byte title-menu
 * slot descriptions. Returns zero while an asynchronous read is pending and
 * one once all slots have been classified as occupied, empty, or corrupt. */
s32 func_0207f348(void *context_pointer)
{
    u8 *context = (u8 *)context_pointer;
    void **transfer_slot = (void **)(data_021f5da0 + 0x14);
    u32 *record_index = (u32 *)(data_021f5da0 + 8);
    u32 state = *(u32 *)(context + 0x1b4);
    s32 status;

    switch (state) {
    case 0:
        *(u32 *)(context + 0x24) = 5 * 0xaa00u;
        *(u32 *)(context + 0x1b4) = 1;
        break;
    case 1:
        retail_save_begin_read(context, *(u32 *)(context + 0x24),
                               context + 0xf4, 0x40);
        *(u32 *)(context + 0x1b4) = 2;
        break;
    case 2:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            break;
        if (status < 0) {
            *(u32 *)(context + 0x1b4) = 100;
        } else if (retail_save_header_valid(context + 0xf4)) {
            *(u32 *)(context + 0x1b4) = 5;
        } else if (*(u32 *)(context + 0x24) == 0) {
            *(u32 *)(context + 0x1b4) = 4;
        } else {
            *(u32 *)(context + 0x24) -= 0xaa00u;
            *(u32 *)(context + 0x1b4) = 1;
        }
        break;
    case 4: {
        u32 index;
        for (index = 0; index < 3; ++index)
            memset(context + 0x38 + index * 0x34, 0, 0x34);
        return 1;
    }
    case 5:
        retail_save_release_game_buffer();
        *transfer_slot = func_02003e20(0xaa00, data_020ef368, 4,
                                      &gHeapContext);
        *record_index = 0;
        *(u32 *)(context + 0x1b4) = 6;
        break;
    case 6:
        retail_save_begin_read(context, *record_index * 0xaa00u,
                               *transfer_slot, 0x5f14);
        *(u32 *)(context + 0x1b4) = 7;
        break;
    case 7:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            break;
        if (status < 0) {
            retail_save_release_game_buffer();
            *(u32 *)(context + 0x1b4) = 100;
        } else {
            *(u32 *)(context + 0x1b4) = 8;
        }
        break;
    case 8:
        if (!retail_save_payload_valid((const u8 *)*transfer_slot)) {
            if (*(u32 *)(context + 0x24) < 3 * 0xaa00u) {
                retail_save_begin_read(context,
                    (*record_index + 3) * 0xaa00u,
                    *transfer_slot, 0x5f14);
                *(u32 *)(context + 0x1b4) = 7;
            } else {
                *(u32 *)(context + 0x1b4) = 30;
            }
        } else if (!retail_save_header_valid((const u8 *)*transfer_slot) ||
                   ((const u8 *)*transfer_slot)[0x0b] == 0) {
            *(u32 *)(context + 0x1b4) = 20;
        } else {
            *(u32 *)(context + 0x1b4) = 10;
        }
        break;
    case 10: {
        const u8 *record = (const u8 *)*transfer_slot;
        u8 *metadata = context + 0x38 + *record_index * 0x34;
        *(u16 *)(metadata + 0x00) = 1;
        *(u32 *)(metadata + 0x04) = *(const u16 *)(record + 0x0c);
        metadata[0x02] = record[0x0e];
        metadata[0x03] = record[0x0f];
        *(u32 *)(metadata + 0x10) = *(const u32 *)(record + 0x3c);
        *(u16 *)(metadata + 0x08) = *(const u16 *)(record + 0x30);
        *(u16 *)(metadata + 0x0a) = *(const u16 *)(record + 0x32);
        *(u16 *)(metadata + 0x0c) = *(const u16 *)(record + 0x34);
        *(u16 *)(metadata + 0x0e) = *(const u16 *)(record + 0x36);
        MI_CpuCopy8(record + 0x10, metadata + 0x14, 0x20);
        *(u32 *)(context + 0x1b4) = 40;
        break;
    }
    case 20:
        memset(context + 0x38 + *record_index * 0x34, 0, 0x34);
        *(u16 *)(context + 0x38 + *record_index * 0x34) = 0;
        *(u32 *)(context + 0x1b4) = 40;
        break;
    case 30:
        memset(context + 0x38 + *record_index * 0x34, 0, 0x34);
        *(u16 *)(context + 0x38 + *record_index * 0x34) = 2;
        *(u32 *)(context + 0x1b4) = 40;
        break;
    case 40:
        if (*record_index > 1) {
            retail_save_release_game_buffer();
            return 1;
        }
        ++*record_index;
        *(u32 *)(context + 0x1b4) = 6;
        break;
    case 100:
        func_02004458(1);
        *(u32 *)(context + 0x1b4) = 101;
        break;
    default:
        break;
    }
    return 0;
}

/* Select one retail save operation and its pointer-to-member callback. */
s32 func_0207f80c(void *context_pointer, s32 recordIndex,
                  s32 operation, s32 asynchronous)
{
    u8 *context = (u8 *)context_pointer;

    if (recordIndex >= 0)
        *(s32 *)(context + 0x14) = recordIndex;
    *(s32 *)(context + 0x00) = asynchronous;
    *(s32 *)(context + 0x20) = operation;
    *(s32 *)(context + 0x08) = 2;
    *(s32 *)(context + 0x10) = 0;
    *(u32 *)(context + 0x1b8) = data_020ef330[8];
    *(u32 *)(context + 0x1bc) = data_020ef330[9];
    *(s32 *)(context + 0x1b4) = 0;
    if (!asynchronous) {
        s32 result;
        do {
            result = func_0207f248(context);
        } while (result == 0);
        return result;
    }
    return 0;
}

/* Begin the retail selected-record load operation at 0x0207ff90. The caller
 * owns the save context throughout the operation. In asynchronous mode this
 * only installs the recovered pointer-to-member state machine; synchronous
 * callers poll that same state machine until it produces a terminal result. */
void func_0207ff90(void *context_pointer, s32 recordIndex, s32 asynchronous)
{
    u8 *context = (u8 *)context_pointer;

    *(s32 *)(context + 0x14) = recordIndex;
    *(s32 *)(context + 0x00) = asynchronous;
    *(u32 *)(context + 0x08) = 1;
    *(u32 *)(context + 0x10) = 0;
    *(u32 *)(context + 0x1b8) = data_020ef330[10];
    *(u32 *)(context + 0x1bc) = data_020ef330[11];
    *(u32 *)(context + 0x1b4) = 0;
    if (!asynchronous) {
        while (func_0207f248(context) == 0) {
        }
    }
}

/* Validate a complete record image using the retail header contract and CRC. */
static s32 retail_save_record_valid(const u8 *record)
{
    return retail_save_header_valid(record) &&
           retail_save_payload_valid(record);
}

/* Portable reconstruction of assembly-selected retail 0x0207FFE8. It reads
 * and validates the selected primary record, retries its mirror on failure,
 * restores GameWork, rebuilds persistent singleton state, and retains the
 * retail error codes and allocation/lock ownership at every terminal path. */
s32 func_0207ffe8(void *context_pointer)
{
    u8 *context = (u8 *)context_pointer;
    void **transfer_slot = (void **)(data_021f5da0 + 0x14);
    u32 state = *(u32 *)(context + 0x1b4);
    s32 status;

    switch (state) {
    case 0:
        *(u32 *)(context + 0x24) = *(u32 *)(context + 0x14) * 0xaa00u;
        retail_save_release_game_buffer();
        *transfer_slot = func_02003e20(0xaa00, data_020ef368, 4,
                                      &gHeapContext);
        if (*transfer_slot == 0) {
            *(u32 *)(context + 0x10) = 3;
            return -1;
        }
        retail_save_begin_read(context, *(u32 *)(context + 0x24),
                               *transfer_slot, 0x5f14);
        *(u32 *)(context + 0x1b4) = 1;
        break;
    case 1:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            break;
        if (status < 0) {
            *(u32 *)(context + 0x10) = 3;
            retail_save_release_game_buffer();
            return -1;
        }
        *(u32 *)(context + 0x1b4) = 2;
        break;
    case 2:
        *(u32 *)(context + 0x2c) = *(u32 *)((u8 *)*transfer_slot + 0x38);
        if (!retail_save_record_valid((const u8 *)*transfer_slot)) {
            *(u32 *)(context + 0x1b4) = 10;
            break;
        }
        *(u32 *)(context + 0x1b4) = 3;
        break;
    case 3:
        GameWork_Deserialize(gGameWork, *transfer_slot,
                             *(u32 *)(context + 0x2c));
        *(u32 *)(context + 0x1b4) = 4;
        break;
    case 4:
        func_0207f0c0();
        retail_save_release_game_buffer();
        return 1;
    case 10:
        retail_save_begin_read(context,
            (*(u32 *)(context + 0x14) + 3) * 0xaa00u,
            *transfer_slot, 0x5f14);
        *(u32 *)(context + 0x1b4) = 11;
        break;
    case 11:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            break;
        *(u32 *)(context + 0x1b4) = status < 0 ? 20 : 12;
        break;
    case 12:
        *(u32 *)(context + 0x2c) = *(u32 *)((u8 *)*transfer_slot + 0x38);
        *(u32 *)(context + 0x1b4) =
            retail_save_record_valid((const u8 *)*transfer_slot) ? 13 : 20;
        break;
    case 13:
        GameWork_Deserialize(gGameWork, *transfer_slot,
                             *(u32 *)(context + 0x2c));
        *(u32 *)(context + 0x1b4) = 14;
        break;
    case 14:
        func_0207f0c0();
        retail_save_release_game_buffer();
        return 1;
    case 20:
        *(u32 *)(context + 0x10) = 5;
        retail_save_release_game_buffer();
        return -1;
    default:
        break;
    }
    return 0;
}

/* Begin the retail selected-record delete operation at 0x020802F4. The
 * operation rewrites the selected primary and mirror directory headers through
 * func_0208035c. Asynchronous callers poll func_0207f248; synchronous callers
 * remain here until that same state machine returns a terminal status. */
s32 func_0208035c(void *context_pointer);
void func_020802f4(void *context_pointer, s32 recordIndex, s32 asynchronous)
{
    u8 *context = (u8 *)context_pointer;

    *(s32 *)(context + 0x14) = recordIndex;
    *(s32 *)(context + 0x00) = asynchronous;
    *(u32 *)(context + 0x08) = 2;
    *(u32 *)(context + 0x10) = 0;
    *(u32 *)(context + 0x1b8) = data_020ef330[12];
    *(u32 *)(context + 0x1bc) = data_020ef330[13];
    *(u32 *)(context + 0x1b4) = 0;
    if (!asynchronous) {
        do {
            *(s32 *)(context + 0x28) = func_0207f248(context);
        } while (*(s32 *)(context + 0x28) == 0);
    } else {
        *(u32 *)(context + 0x28) = 0;
    }
}

/* Retail 0x0208035C record-delete state machine. It identifies the backup
 * device, constructs the canonical empty directory header for the selected
 * slot, writes that header to the primary and mirror blocks, and clears the
 * corresponding 0x34-byte cached slot description. Returns zero while work is
 * pending, one after both copies are updated, or -1 with result code four when
 * a backup request fails. */
s32 func_0208035c(void *context_pointer)
{
    u8 *context = (u8 *)context_pointer;
    u32 record_index = *(u32 *)(context + 0x14);
    u8 *header = context + 0xf4 + record_index * 0x40;
    s32 status;

    switch (*(u32 *)(context + 0x1b4)) {
    case 0:
        if (!func_0207f288(context)) {
            *(s32 *)(context + 0x28) = -1;
            *(u32 *)(context + 0x10) = 4;
            return -1;
        }
        *(u32 *)(context + 0x1b4) = 1;
        break;
    case 1:
        memset(header, 0, 0x40);
        *(u32 *)(header + 4) = 0x13e8a68a;
        *(u16 *)(header + 8) = 0x3d;
        header[0x0a] = (u8)record_index;
        *(u32 *)(header + 0x38) = 0x40;
        *(u32 *)header = retail_save_crc32(header + 4, 0x3c);
        *(u32 *)(context + 0x1b4) = 2;
        break;
    case 2:
        retail_save_begin_write(context, record_index * 0xaa00u,
                                header, 0x40);
        *(u32 *)(context + 0x1b4) = 3;
        break;
    case 3:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            break;
        if (status < 0) {
            *(u32 *)(context + 0x10) = 4;
            return -1;
        }
        *(u32 *)(context + 0x1b4) = 4;
        break;
    case 4:
        retail_save_begin_write(context, (record_index + 3) * 0xaa00u,
                                header, 0x40);
        *(u32 *)(context + 0x1b4) = 5;
        break;
    case 5:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            break;
        if (status < 0) {
            *(u32 *)(context + 0x10) = 4;
            return -1;
        }
        *(u32 *)(context + 0x1b4) = 6;
        break;
    case 6:
        memset(context + 0x38 + record_index * 0x34, 0, 0x34);
        return 1;
    default:
        break;
    }
    return 0;
}

/* Begin the retail whole-record copy operation at 0x020805D0. Source and
 * destination select the three primary/mirror block pairs. The installed
 * func_0208063c callback owns transfer-buffer allocation and both durable
 * writes; asynchronous callers poll it through func_0207f248. */
s32 func_020805d0(void *context_pointer, s32 sourceIndex,
                  s32 destinationIndex, s32 asynchronous)
{
    u8 *context = (u8 *)context_pointer;

    *(s32 *)(context + 0x14) = sourceIndex;
    *(s32 *)(context + 0x1c) = destinationIndex;
    *(s32 *)(context + 0x00) = asynchronous;
    *(u32 *)(context + 0x08) = 2;
    *(u32 *)(context + 0x10) = 0;
    *(u32 *)(context + 0x1b8) = data_020ef330[0];
    *(u32 *)(context + 0x1bc) = data_020ef330[1];
    *(u32 *)(context + 0x1b4) = 0;
    if (!asynchronous) {
        do {
            *(s32 *)(context + 0x28) = func_0207f248(context);
        } while (*(s32 *)(context + 0x28) == 0);
    } else {
        *(u32 *)(context + 0x28) = 0;
    }
    return *(s32 *)(context + 0x28);
}

/* Copy a 16-code-unit record name and begin its retail write operation. */
void func_0207f86c(void *context_pointer, s32 recordIndex,
                   const void *name, s32 asynchronous)
{
    u8 *context = (u8 *)context_pointer;

    MI_CpuCopy8(name, context + 0xd4, 0x20);
    (void)func_0207f80c(context, recordIndex, 1, asynchronous);
}

/* Retail CRC-32 used for save-directory headers and serialized GameWork. */
static u32 retail_save_crc32(const u8 *bytes, u32 size)
{
    u32 crc = 0xffffffffu;
    u32 index;

    for (index = 0; index < size; ++index) {
        s32 bit;
        crc ^= (u32)bytes[index] << 24;
        for (bit = 0; bit < 8; ++bit)
            crc = (crc & 0x80000000u) != 0
                      ? (crc << 1) ^ 0x04c11db7u
                      : crc << 1;
    }
    return ~crc;
}

/* Apply the retail save/load reset mode to the game-owned singleton set. */
static void retail_save_reset_game_state(s32 mode)
{
    func_0206392c(data_021e9ac0, mode);
    func_0207a594(data_021f5128, mode);
    func_02078690(data_021f38fc, mode);
    func_020981f0(data_021f5f18, mode);
    func_02079c0c(data_021f3d68, mode);
}

static s32 retail_save_header_valid(const u8 *header)
{
    return (*(const u32 *)(header + 4) & 0x7fffffffu) == 0x13e8a68au &&
           *(const u16 *)(header + 8) == 0x3d &&
           header[0x0a] < 3 && header[0x0b] <= 1;
}

static s32 retail_save_payload_valid(const u8 *record)
{
    u32 size = *(const u32 *)(record + 0x38);

    return size >= 4 && size <= 0x5f14 &&
           *(const u32 *)record == retail_save_crc32(record + 4, size - 4);
}

static void retail_save_release_game_buffer(void)
{
    void **slot = (void **)(data_021f5da0 + 0x14);
    if (*slot != 0) {
        func_02003e38(*slot);
        *slot = 0;
    }
}

static s32 retail_save_poll(void *context_pointer);

static void retail_save_begin_read(void *context_pointer, u32 offset,
                                   void *destination, u32 size)
{
    u8 *context = (u8 *)context_pointer;
    u32 request_result = 0;

    *(u32 *)(context + 0x24) = offset;
    func_020bc02c(*(u16 *)(context + 4));
    func_020bc874(offset, destination, size, 0, 0, 1, 6, 1, 0,
                  &request_result);
}

static void retail_save_begin_write(void *context_pointer, u32 offset,
                                    const void *source, u32 size)
{
    u8 *context = (u8 *)context_pointer;
    u32 request_result = 0;

    *(u32 *)(context + 0x24) = offset;
    func_020bc02c(*(u16 *)(context + 4));
    func_020bc874((u32)(u32)source, (void *)(u32)offset,
                  size, 0, 0, 1, 7, 10, 2, &request_result);
}

/*
 * Portable reconstruction of assembly-selected retail 0x0207F8A4. It retains
 * the complete directory discovery/repair, primary and mirror writes, poll
 * boundaries, record metadata, serialization, CRC, and ownership states.
 */
s32 func_0207f8a4(void *context_pointer)
{
    u8 *context = (u8 *)context_pointer;
    void **transfer_slot = (void **)(data_021f5da0 + 0x14);
    u32 *directory_index = (u32 *)(data_021f5da0 + 0x0c);
    u32 state = *(u32 *)(context + 0x1b4);
    s32 status;

    switch (state) {
    case 0:
        *(u32 *)(context + 0x24) = 0x35200;
        *(u32 *)(context + 0x1b4) = 1;
        break;
    case 1:
        retail_save_begin_read(context, *(u32 *)(context + 0x24),
                               context + 0xf4, 0x40);
        *(u32 *)(context + 0x1b4) = 2;
        break;
    case 2:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0) break;
        if (status < 0) {
            *(u32 *)(context + 0x10) = 4;
            return -1;
        }
        if (retail_save_header_valid(context + 0xf4)) {
            *(u32 *)(context + 0x1b4) = 30;
        } else if (*(u32 *)(context + 0x24) == 0) {
            *(u32 *)(context + 0x1b4) = 10;
        } else {
            *(u32 *)(context + 0x24) -= 0xaa00;
            *(u32 *)(context + 0x1b4) = 1;
        }
        break;
    case 10: {
        u32 index;
        for (index = 0; index < 3; ++index) {
            u8 *header = context + 0xf4 + index * 0x40;
            memset(header, 0, 0x40);
            *(u32 *)(header + 4) = 0x13e8a68a;
            *(u16 *)(header + 8) = 0x3d;
            header[0x0a] = (u8)index;
            *(u32 *)(header + 0x38) = 0x40;
            *(u32 *)header = retail_save_crc32(header + 4, 0x3c);
        }
        *directory_index = 0;
        *(u32 *)(context + 0x1b4) = 11;
        break;
    }
    case 11: {
        u32 index = *directory_index;
        retail_save_begin_write(context, index * 0xaa00,
                                context + 0xf4 + index * 0x40, 0x40);
        *(u32 *)(context + 0x1b4) = 12;
        break;
    }
    case 12:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0) break;
        if (status < 0) {
            *(u32 *)(context + 0x10) = 4;
            return -1;
        }
        if (*directory_index < 2) {
            ++*directory_index;
            *(u32 *)(context + 0x1b4) = 11;
        } else {
            *(u32 *)(context + 0x1b4) = 13;
        }
        break;
    case 13:
        *directory_index = 0;
        *(u32 *)(context + 0x1b4) = 14;
        break;
    case 14: {
        u32 index = *directory_index;
        retail_save_begin_write(context, (index + 3) * 0xaa00,
                                context + 0xf4 + index * 0x40, 0x40);
        *(u32 *)(context + 0x1b4) = 15;
        break;
    }
    case 15:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0) break;
        if (status < 0) {
            *(u32 *)(context + 0x10) = 4;
            return -1;
        }
        if (*directory_index < 2) {
            ++*directory_index;
            *(u32 *)(context + 0x1b4) = 14;
        } else {
            *(u32 *)(context + 0x1b4) = 30;
        }
        break;
    case 30:
        retail_save_reset_game_state(*(s32 *)(context + 0x20));
        *(u32 *)(context + 0x1b4) = 31;
        break;
    case 31: {
        u8 *work = (u8 *)gGameWork;
        void *progress;
        *(u32 *)(work + 4) = 0x13e8a68a;
        *(u16 *)(work + 8) = 0x3d;
        work[0x0a] = (u8)*(u32 *)(context + 0x14);
        work[0x0b] = 1;
        progress = func_02027f94();
        *(u16 *)(work + 0x0c) = (u16)func_02027854(progress);
        progress = func_02027f94();
        work[0x0e] = (u8)func_02027e8c(progress);
        progress = func_02027f94();
        work[0x0f] = (u8)func_02027e9c(progress);
        *(u32 *)(work + 0x3c) = *(u32 *)(work + 0x40);
        if (*(u32 *)(context + 0x20) == 1) {
            MI_CpuCopy8(context + 0xd4, work + 0x10, 0x20);
            *(u16 *)(work + 0x0c) = 0;
            work[0x0e] = 0;
            work[0x0f] = 0;
            *(u32 *)(work + 0x3c) = 0;
        }
        retail_save_release_game_buffer();
        *transfer_slot = func_02003e20(0xaa00, data_020ef368, 4,
                                      &gHeapContext);
        if (*transfer_slot == 0) {
            *(u32 *)(context + 0x10) = 4;
            return -1;
        }
        *(u32 *)(context + 0x1b4) = 32;
        break;
    }
    case 32:
        *(u32 *)(context + 0x2c) =
            GameWork_Serialize(gGameWork, *transfer_slot, 0x5f14);
        *(u32 *)((u8 *)*transfer_slot + 0x38) = *(u32 *)(context + 0x2c);
        *(u32 *)(context + 0x1b4) = 33;
        break;
    case 33:
        *(u32 *)*transfer_slot = retail_save_crc32(
            (u8 *)*transfer_slot + 4, *(u32 *)(context + 0x2c) - 4);
        *(u32 *)(context + 0x1b4) = 34;
        break;
    case 34:
        retail_save_begin_write(context,
            *(u32 *)(context + 0x14) * 0xaa00,
            *transfer_slot, *(u32 *)(context + 0x2c));
        *(u32 *)(context + 0x1b4) = 35;
        break;
    case 35:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0) break;
        if (status < 0) {
            *(u32 *)(context + 0x10) = 4;
            retail_save_release_game_buffer();
            return -1;
        }
        *(u32 *)(context + 0x1b4) = 36;
        break;
    case 36:
        if (*(u32 *)(context + 0x20) == 1) {
            u32 index = *(u32 *)(context + 0x14);
            *(u16 *)(context + 0x38 + index * 0x34) = 1;
            MI_CpuCopy8((u8 *)gGameWork + 0x10,
                        context + 0x4c + index * 0x34, 0x20);
        }
        *(u32 *)(context + 0x1b4) = 40;
        break;
    case 40:
        retail_save_begin_write(context,
            (*(u32 *)(context + 0x14) + 3) * 0xaa00,
            *transfer_slot, *(u32 *)(context + 0x2c));
        *(u32 *)(context + 0x1b4) = 41;
        break;
    case 41:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0) break;
        if (status < 0) {
            *(u32 *)(context + 0x10) = 2;
            retail_save_release_game_buffer();
            return 1;
        }
        *(u32 *)(context + 0x1b4) = 42;
        break;
    case 42:
        retail_save_release_game_buffer();
        return 1;
    default:
        break;
    }
    return 0;
}

static void retail_save_release_transfer(void)
{
    void **transfer = (void **)(data_021f5da0 + 0x14);
    if (*transfer != 0) {
        func_02003e38(*transfer);
        *transfer = 0;
    }
}

static s32 retail_save_poll(void *context_pointer)
{
    u8 *context = (u8 *)context_pointer;
    s32 status;

    if (!func_020bc6f8())
        return 0;
    status = func_020bc07c();
    *(s32 *)(context + 0x34) = status;
    func_020bc01c(*(u16 *)(context + 4));
    return status == 0 ? 1 : -1;
}

/* Retail save-record transfer state machine selected by data_020ef330 for
 * title startup. The host backup boundary completes each SDK request at once,
 * while all retail states, block offsets, results, and ownership are retained. */
s32 func_0208063c(void *context_pointer)
{
    u8 *context = (u8 *)context_pointer;
    void **transfer_slot = (void **)(data_021f5da0 + 0x14);
    u32 state = *(u32 *)(context + 0x1b4);
    s32 status;
    u32 offset;
    u32 request_result = 0;

    switch (state) {
    case 0:
        offset = *(u32 *)(context + 0x14) * 0xaa00u;
        *(u32 *)(context + 0x24) = offset;
        retail_save_release_transfer();
        *transfer_slot = func_02003e20(0xaa00, data_020ef368, 4,
                                      &gHeapContext);
        func_020bc02c(*(u16 *)(context + 4));
        func_020bc874(offset, *transfer_slot, 0xaa00, 0, 0, 1, 6, 1, 0,
                      &request_result);
        *(u32 *)(context + 0x1b4) = 1;
        return 0;
    case 1:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            return 0;
        if (status == -1) {
            *(u32 *)(context + 0x10) = 4;
            retail_save_release_transfer();
            return -1;
        }
        *(u32 *)(context + 0x1b4) = 2;
        return 0;
    case 2:
        offset = *(u32 *)(context + 0x1c) * 0xaa00u;
        *(u32 *)(context + 0x24) = offset;
        func_020bc02c(*(u16 *)(context + 4));
        func_020bc874((u32)(u32)*transfer_slot, (void *)(u32)offset,
                      0xaa00, 0, 0, 1, 7, 10, 2, &request_result);
        *(u32 *)(context + 0x1b4) = 3;
        return 0;
    case 3:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            return 0;
        if (status == -1) {
            *(u32 *)(context + 0x10) = 4;
            retail_save_release_transfer();
            return -1;
        }
        *(u32 *)(context + 0x1b4) = 4;
        return 0;
    case 4:
        offset = (*(u32 *)(context + 0x14) + 3u) * 0xaa00u;
        *(u32 *)(context + 0x24) = offset;
        func_020bc02c(*(u16 *)(context + 4));
        func_020bc874(offset, *transfer_slot, 0xaa00, 0, 0, 1, 6, 1, 0,
                      &request_result);
        *(u32 *)(context + 0x1b4) = 5;
        return 0;
    case 5:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            return 0;
        if (status == -1) {
            *(u32 *)(context + 0x10) = 4;
            retail_save_release_transfer();
            return -1;
        }
        *(u32 *)(context + 0x1b4) = 6;
        return 0;
    case 6:
        offset = (*(u32 *)(context + 0x1c) + 3u) * 0xaa00u;
        *(u32 *)(context + 0x24) = offset;
        func_020bc02c(*(u16 *)(context + 4));
        func_020bc874((u32)(u32)*transfer_slot, (void *)(u32)offset,
                      0xaa00, 0, 0, 1, 7, 10, 2, &request_result);
        *(u32 *)(context + 0x1b4) = 7;
        return 0;
    case 7:
        status = retail_save_poll(context);
        *(s32 *)(context + 0x28) = status;
        if (status == 0)
            return 0;
        if (status == -1) {
            retail_save_release_transfer();
            return 1;
        }
        *(u32 *)(context + 0x1b4) = 8;
        return 0;
    case 8:
        MI_CpuCopy8(context + 0x38 + *(u32 *)(context + 0x14) * 0x34u,
                    context + 0x38 + *(u32 *)(context + 0x1c) * 0x34u, 0x34);
        retail_save_release_transfer();
        return 1;
    default:
        return 0;
    }
}




