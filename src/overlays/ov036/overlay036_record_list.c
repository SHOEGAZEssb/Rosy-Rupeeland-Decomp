#include "tingle/types.h"

/* Overlay 36 linked timed-record construction and list lifecycle helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206138[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void func_02091b6c(void *timer);
extern void func_02091b98(void *timer, s32 duration);
extern s32 func_02091c7c(void *timer, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Initializes a 0x34-byte timed record. next +0 is cleared; the five supplied
 * values occupy +4 through +0x14, and duration starts the common timer at
 * +0x18. Returns record; only that record and its timer state change.
 */
extern "C" void *func_ov036_021fdba0(void *record, s32 duration,
                                      s32 value4, s32 value8, s32 valueC,
                                      s32 value10, s32 value14)
{
    func_02091b6c((u8 *)record + 0x18);
    FIELD(void *, record, 0) = 0;
    FIELD(s32, record, 4) = value4;
    FIELD(s32, record, 8) = value8;
    FIELD(s32, record, 0xc) = valueC;
    FIELD(s32, record, 0x10) = value10;
    FIELD(s32, record, 0x14) = value14;
    func_02091b98((u8 *)record + 0x18, duration);
    return record;
}

/*
 * Initializes an empty record list. Head +0, tail +4, count +8, and field +C
 * are cleared; value10 is stored at +0x10 and the halfword sentinel +0x14 is
 * set to 0x7FFF. It returns nothing and changes only the supplied list.
 */
extern "C" void func_ov036_021fdbf4(void *list, s32 value10)
{
    FIELD(void *, list, 4) = 0;
    FIELD(void *, list, 0) = 0;
    FIELD(s32, list, 8) = 0;
    FIELD(s32, list, 0xc) = 0;
    FIELD(s32, list, 0x10) = value10;
    FIELD(u16, list, 0x14) = 0x7fff;
}

/*
 * Frees every record reachable through next +0, then clears list tail +4,
 * head +0, and count +8. It returns nothing and releases heap allocations;
 * field +0xC and later configuration are preserved.
 */
extern "C" void func_ov036_021fdc1c(void *list)
{
    void *record = FIELD(void *, list, 0);
    while (record != 0) {
        void *next = FIELD(void *, record, 0);
        Heap_Free(record);
        record = next;
    }
    FIELD(void *, list, 4) = 0;
    FIELD(void *, list, 0) = 0;
    FIELD(s32, list, 8) = 0;
}

/*
 * Allocates and appends a 0x34-byte timed record using list configuration
 * +0xC/+0x10 as its final two values. The original control flow still links
 * and increments count +8 if allocation fails, so the count can include a
 * null record. It returns nothing; the heap and list links/count can change.
 */
extern "C" void func_ov036_021fdc5c(void *list, s32 duration,
                                      s32 value4, s32 value8, s32 valueC)
{
    void *record = Heap_Alloc(0x34, data_ov036_02206138, 4, gHeapContext);
    if (record != 0) {
        record = func_ov036_021fdba0(record, duration, value4, value8,
                                     valueC, FIELD(s32, list, 0xc),
                                     FIELD(s32, list, 0x10));
    }
    if (FIELD(void *, list, 0) == 0) {
        FIELD(void *, list, 4) = record;
        FIELD(void *, list, 0) = record;
    } else {
        FIELD(void *, FIELD(void *, list, 4), 0) = record;
        FIELD(void *, list, 4) = record;
    }
    FIELD(s32, list, 8)++;
}

/*
 * Advances every record timer in mode 2 and frees records that report done.
 * The matching control flow assigns head +0 to each completed record's next
 * link but does not repair tail +4, implying callers maintain completion in
 * list order. Count +8 is decremented per freed record. It returns nothing and
 * changes timer state, list bookkeeping, and heap ownership.
 */
extern "C" void func_ov036_021fdcec(void *list)
{
    void *record = FIELD(void *, list, 0);
    while (record != 0) {
        void *next = FIELD(void *, record, 0);
        if (func_02091c7c((u8 *)record + 0x18, 2) != 0) {
            FIELD(void *, list, 0) = next;
            Heap_Free(record);
            FIELD(s32, list, 8)--;
        }
        record = next;
    }
}
