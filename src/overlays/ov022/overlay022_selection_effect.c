#include "tingle/types.h"

/* Overlay 22 selected-entry overlay-46 effect ownership and descriptor resolution. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern const u8 data_020d7834[];
extern const u8 data_ov022_022006fc[];
extern void *gGameWork;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Heap_Free(void *);
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void *func_ov046_0220b7bc(void *, void *, s32);
extern void func_ov046_0220ba80(void *);
extern void func_ov046_0220bffc(void *, s32, s32, s32);
extern void func_ov046_0220c478(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Creates the overlay-46 presentation for the currently selected +0x2B4
 * collection entry. It allocates 0x118 bytes at +0x35C, constructs it with the
 * shared graphics context and variant 2, reads the signed descriptor ID from
 * the collection's current row, sends that ID to overlay-46 setup/selection,
 * and clears main blend control. Heap, overlay-46, graphics, and MMIO state
 * change; no value is returned.
 */
extern "C" void func_ov022_021fe898(void *scene)
{
    void *effect = Heap_Alloc(0x118, data_ov022_022006fc,
                              4, gHeapContext);
    if (effect != 0)
        effect = func_ov046_0220b7bc(effect, data_020f4e14, 2);
    FIELD(void *, scene, 0x35c) = effect;

    void *collection = FIELD(void *, scene, 0x2b4);
    s32 selected = FIELD(s32, collection, 0xc);
    void *entry = (u8 *)FIELD(void *, collection, 0x38) + selected * 8;
    s32 descriptor_id = FIELD(s16, FIELD(void *, entry, 0), 0);
    func_ov046_0220bffc(effect, descriptor_id, 0, 0);
    func_ov046_0220c478(effect, descriptor_id);
    *(volatile u16 *)0x04000050 = 0;
}

/*
 * Detaches and destroys overlay-46 effect +0x35C. The scene pointer is cleared
 * before teardown; a nonnull object receives overlay-46 cleanup and is freed.
 * Heap/graphics state changes and no value is returned.
 */
extern "C" void func_ov022_021fe920(void *scene)
{
    void *effect = FIELD(void *, scene, 0x35c);
    FIELD(void *, scene, 0x35c) = 0;
    if (effect != 0) {
        func_ov046_0220ba80(effect);
        Heap_Free(effect);
    }
}

/*
 * Commits and resolves the currently selected +0x2B4 entry. It marks the
 * corresponding game-work byte at +0x5E94 as value 2, stores the descriptor at
 * scene +0x360 and its signed ID at +0x358, then selects that ID's 0x34-byte
 * table entry from data_020D7834 and walks 0xC-byte subrecords until either the
 * descriptor halfword +0x1C matches subrecord +0xA or a type-3 terminator is
 * reached. Scene and persistent game work change; no value is returned.
 */
extern "C" void func_ov022_021fe94c(void *scene)
{
    void *collection = FIELD(void *, scene, 0x2b4);
    s32 selected = FIELD(s32, collection, 0xc);
    void *entry = (u8 *)FIELD(void *, collection, 0x38) + selected * 8;
    s32 record_index = FIELD(s32, entry, 4);
    FIELD(u8, gGameWork, 0x5e94 + record_index) = 2;

    const u8 *descriptor = FIELD(const u8 *, entry, 0);
    FIELD(const u8 *, scene, 0x360) = descriptor;
    s32 descriptor_id = FIELD(s16, descriptor, 0);
    FIELD(s32, scene, 0x358) = descriptor_id;
    const u8 *subrecord = data_020d7834 + descriptor_id * 0x34;
    FIELD(const u8 *, scene, 0x364) = subrecord;
    while (FIELD(s16, subrecord, 0) != 3) {
        if (FIELD(u16, subrecord, 0xa) == FIELD(u16, descriptor, 0x1c))
            return;
        subrecord += 0xc;
        FIELD(const u8 *, scene, 0x364) = subrecord;
    }
}
