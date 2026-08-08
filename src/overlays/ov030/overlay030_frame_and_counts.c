#include "tingle/types.h"

/* Overlay 30 normal frame servicing and persistent-count UI synchronization. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gLupyContext;
extern const u8 data_021f5ee8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020958d8(void *);
extern void func_02010e68(void *);
extern void func_ov045_0220c18c(void *);
extern void func_ov030_021fd304(void *);
extern void func_ov045_0220b908(void *);
extern void func_02092b70(void *, void *, s32);
extern void func_020b2058(const void *, s32, s32);
extern void func_020b1ff0(const void *, s32, s32);
extern s32 func_0206492c(void *, s32);
extern void func_02095988(void *, s32);
extern void func_02072b68(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Advances all three menu controllers, global Lupy context, optional auxiliary
 * object +0x2C0, optional board widget +0x2C4, and required overlay-45 object
 * +0x2C8. While palette step +0x334 is below 16, it increments the step, blends
 * palette buffers +0x32C/+0x330, and uploads the 0x20-byte palette at 0x021F5EE8
 * through both engine copy paths. Returns void; controller, child, palette, and
 * graphics SDK state may change.
 */
extern "C" void func_ov030_021fe768(void *scene)
{
    func_020958d8((u8 *)scene + 0xb8);
    func_020958d8((u8 *)scene + 0x164);
    func_020958d8((u8 *)scene + 0x210);
    func_02010e68(gLupyContext);
    if (FIELD(void *, scene, 0x2c0) != 0)
        func_ov045_0220c18c(FIELD(void *, scene, 0x2c0));
    if (FIELD(void *, scene, 0x2c4) != 0)
        func_ov030_021fd304(FIELD(void *, scene, 0x2c4));
    func_ov045_0220b908(FIELD(void *, scene, 0x2c8));

    s32 step = FIELD(s32, scene, 0x334);
    if (step < 0x10) {
        ++step;
        FIELD(s32, scene, 0x334) = step;
        func_02092b70(FIELD(void *, scene, 0x32c),
                      FIELD(void *, scene, 0x330), step);
        func_020b2058(data_021f5ee8, 0, 0x20);
        func_020b1ff0(data_021f5ee8, 0, 0x20);
    }
}

/*
 * Looks up catalog IDs 0x164 and 0x165 in collection +0x37C, reads each matched
 * 0x24-byte record's halfword count +4 (or zero when absent), stores the counts
 * at +0x384/+0x38C, selects controller states 0/1 and 2/3 based on positivity,
 * and displays both counts as two decimal digit sprites +0xA8..+0xB4 using the
 * engine's digit indices offset by eight. Returns void; scene count fields,
 * controllers, and sprite selectors change. Catalog record meaning beyond the
 * observed count field remains inferred.
 */
extern "C" void func_ov030_021fe808(void *scene)
{
    void *catalog = FIELD(void *, scene, 0x37c);
    s32 firstIndex = func_0206492c(catalog, 0x164);
    FIELD(s32, scene, 0x380) = firstIndex;
    s32 secondIndex = func_0206492c(catalog, 0x165);
    FIELD(s32, scene, 0x388) = secondIndex;
    s32 firstCount = 0;
    s32 secondCount = 0;
    if (firstIndex >= 0) {
        const u8 *records = FIELD(const u8 *, catalog, 8);
        firstCount = FIELD(u16, records + firstIndex * 0x24, 4);
    }
    FIELD(s32, scene, 0x384) = firstCount;
    func_02095988((u8 *)scene + 0xb8, firstCount > 0 ? 0 : 1);
    if (secondIndex >= 0) {
        const u8 *records = FIELD(const u8 *, catalog, 8);
        secondCount = FIELD(u16, records + secondIndex * 0x24, 4);
    }
    FIELD(s32, scene, 0x38c) = secondCount;
    func_02095988((u8 *)scene + 0x164, secondCount > 0 ? 2 : 3);

    func_02072b68(FIELD(void *, scene, 0xa8), (firstCount / 10 + 8) & 0xff);
    func_02072b68(FIELD(void *, scene, 0xac), (firstCount % 10 + 8) & 0xff);
    func_02072b68(FIELD(void *, scene, 0xb0), (secondCount / 10 + 8) & 0xff);
    func_02072b68(FIELD(void *, scene, 0xb4), (secondCount % 10 + 8) & 0xff);
}
