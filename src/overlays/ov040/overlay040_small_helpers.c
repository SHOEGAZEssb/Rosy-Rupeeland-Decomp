#include "tingle/types.h"

/*
 * Overlay 40 low-level helpers shared by its large scene update routines.
 * This recovered group covers record/vector copies, vector-operation wrappers,
 * a timed scene gate, presentation activation, sub-screen BG setup, and small
 * destruction thunks.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02004fe0(void *vector);
extern void func_020adfbc(const void *left, const void *right, void *output);
extern void func_020adff0(const void *left, const void *right, void *output);
extern void *func_02005030(void *destination, const void *source);
extern void *func_020050a4(void *destination, const void *source);
extern void func_02072b68(void *renderer, u8 orientation);
extern void func_02099fb0(void *object);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/* Copy all four words from source to destination; no value is returned. */
extern "C" void func_ov040_021fe18c(void *destination, const void *source)
{
    FIELD(u32, destination, 0) = FIELD(u32, source, 0);
    FIELD(u32, destination, 4) = FIELD(u32, source, 4);
    FIELD(u32, destination, 8) = FIELD(u32, source, 8);
    FIELD(u32, destination, 0x0c) = FIELD(u32, source, 0x0c);
}

/*
 * Construct output, select the payload at +4 from each non-null vector object,
 * and apply the SDK vector operation at 0x020ADFBC into output +4. Null inputs
 * remain null. Returns no value; only output and SDK vector state change.
 */
extern "C" void func_ov040_021ff3f4(void *output, const void *left,
                                      const void *right)
{
    func_02004fe0(output);
    if (right != 0) right = (const u8 *)right + 4;
    if (left != 0) left = (const u8 *)left + 4;
    func_020adfbc(left, right, (u8 *)output + 4);
}

/*
 * Tail-copy the vector object at source +0x2C into destination through the
 * common copy constructor. Returns that constructor's destination result.
 */
extern "C" void *func_ov040_02200108(void *destination, const void *source)
{
    return func_02005030(destination, (const u8 *)source + 0x2c);
}

/*
 * Tail-assign source into the vector object at destination +0x2C. Returns the
 * common assignment helper's destination result.
 */
extern "C" void *func_ov040_02200118(void *destination, const void *source)
{
    return func_020050a4((u8 *)destination + 0x2c, source);
}

/*
 * Add source words +4/+8 into destination words +4/+8. The untouched first
 * and fourth words show that this is a two-component accumulation helper.
 * Returns no value and changes only destination.
 */
extern "C" void func_ov040_022005d4(void *destination, const void *source)
{
    FIELD(s32, destination, 4) += FIELD(s32, source, 4);
    FIELD(s32, destination, 8) += FIELD(s32, source, 8);
}

/*
 * Construct output, select the payload at +4 from each non-null vector object,
 * and apply the SDK vector operation at 0x020ADFF0 into output +4. Null inputs
 * remain null. Returns no value; only output and SDK vector state change.
 */
extern "C" void func_ov040_022021dc(void *output, const void *left,
                                      const void *right)
{
    func_02004fe0(output);
    if (right != 0) right = (const u8 *)right + 4;
    if (left != 0) left = (const u8 *)left + 4;
    func_020adff0(left, right, (u8 *)output + 4);
}

/*
 * If signed word +0xBA4 is not positive, start a 150-frame interval, store
 * value at +0xBA8, and set the presentation referenced by +0xBA0 to orientation
 * zero. The final two arguments are unused. Returns no value; scene and
 * renderer state may change.
 */
extern "C" void func_ov040_02202214(void *scene, s32 value,
                                      s32 unused2, s32 unused3)
{
    (void)unused2;
    (void)unused3;
    if (FIELD(s32, scene, 0xba4) > 0) return;
    FIELD(s32, scene, 0xba4) = 150;
    FIELD(s32, scene, 0xba8) = value;
    func_02072b68(FIELD(void *, FIELD(void *, scene, 0xba0), 0x0c), 0);
}

/*
 * Rewrite sub-engine BG0CNT at 0x04001008. Preserve priority bits 0-1 and
 * mosaic bit 6, then pack screen size, color mode, screen-base block,
 * character-base block, and extended-palette selector. Returns no value; only
 * the display hardware register changes.
 */
extern "C" void func_ov040_0220255c(s32 screenSize, s32 colorMode,
                                      s32 screenBase, s32 characterBase,
                                      s32 extendedPalette)
{
    volatile u16 *bg0cnt = (volatile u16 *)0x04001008;
    *bg0cnt = (*bg0cnt & 0x43) | (u16)(screenSize << 14) |
              (u16)(colorMode << 7) | (u16)(screenBase << 8) |
              (u16)(characterBase << 2) | (u16)(extendedPalette << 13);
}

/* Invoke the common base-scene destructor and return the original object. */
extern "C" void *func_ov040_0220262c(void *object)
{
    func_02099fb0(object);
    return object;
}

/*
 * Mark each of the six presentation objects at +0x58..+0x6C with halfword
 * value 4 at object offset +0x42, then set owner word +0x50 to one. Returns no
 * value; the owner and all six referenced objects change.
 */
extern "C" void func_ov040_02202a10(void *owner)
{
    FIELD(u16, FIELD(void *, owner, 0x58), 0x42) = 4;
    FIELD(u16, FIELD(void *, owner, 0x5c), 0x42) = 4;
    FIELD(u16, FIELD(void *, owner, 0x60), 0x42) = 4;
    FIELD(u16, FIELD(void *, owner, 0x64), 0x42) = 4;
    FIELD(u16, FIELD(void *, owner, 0x68), 0x42) = 4;
    FIELD(u16, FIELD(void *, owner, 0x6c), 0x42) = 4;
    FIELD(s32, owner, 0x50) = 1;
}

/* Free allocation through the game heap and return its original address. */
extern "C" void *func_ov040_02202e90(void *allocation)
{
    Heap_Free(allocation);
    return allocation;
}
