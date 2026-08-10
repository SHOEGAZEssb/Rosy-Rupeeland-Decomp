#include "tingle/types.h"

/* Overlay 22 selected-action particles, messages, progression flags, and marker motion. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 data_020c9670[];
extern const u8 data_020d780c[];
extern const u8 data_020d7828[];
extern const u8 data_020d782c[];
extern const u8 data_020d782e[];
extern const u8 data_020d7a48[];
extern const u8 data_021f3ecc[];
extern const u8 data_ov022_02200664[];
extern void *gGameWork;
extern s32 data_020c37e4;

#ifdef __cplusplus
extern "C" {
#endif
extern u32 genrand_int32(void);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void func_02073e48(void *, s32, s32, s32, ...);
extern void GraphicsSpriteText_FormatDecimal(void *, s32, u32, s32);
extern void *func_02079f3c(const void *, u16);
extern void func_0207c460(void *, u16);
extern s32 func_020918f4(void *, s32);
extern s32 func_02091a70(s32, s32, s32, s32);
extern void func_020922f0(void *, s32);
extern void func_020939d8(void *);
extern s32 func_020befec(s32, s32);
extern void GameWork_SetFlag(void *, u16);
extern s32 GameWork_TestFlag(void *, u16);
extern s32 func_ov043_0220b740(s32);
extern s32 func_ov046_0220b77c(s32);
extern s32 func_ov046_0220c3bc(void *, s32);
extern s32 func_ov046_0220c410(void *, s32);
extern void func_ov046_0220c46c(void *, s32, s32);
extern void func_ov046_0220bffc(void *, s32, s32, s32);
extern void func_ov022_021ff2c4(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Spawns one resource-slot-1 sprite near the descriptor selected at +0x358.
 * A random adjacent pair from the shared signed lookup table supplies a radial
 * displacement, while subrecord +6/+8 and overlay-46 coordinates supply the
 * center. A random value from the scene generator at +0x390 selects one of
 * four frames. Sprite/graphics and PRNG state change; no value is returned.
 */
extern "C" void func_ov022_021fe9e8(void *scene)
{
    void *sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, scene, 0xa0),
                                 (u8 *)scene + 0x90, 1);
    u32 table_index = ((genrand_int32() & 0xffff) >> 4) * 2;
    s32 x_term = data_020c9670[table_index] * 12;
    s32 y_term = data_020c9670[table_index + 1] * 12;
    s32 descriptor_id = FIELD(s32, scene, 0x358);
    const u8 *subrecord = FIELD(const u8 *, scene, 0x364);
    s32 x = func_ov043_0220b740(descriptor_id) + FIELD(s16, subrecord, 6)
          + ((x_term + ((x_term >> 11) >> 20)) >> 12);
    s32 y = func_ov046_0220b77c(descriptor_id) + FIELD(s16, subrecord, 8)
          + ((y_term + ((y_term >> 11) >> 20)) >> 12);
    s32 frame = func_020918f4((u8 *)scene + 0x390, 4);
    func_02073e48(sprite, frame, x, y, 0, 0, 0x100);
}

/*
 * Loads the selected descriptor's +0x1A message resource through a temporary
 * four-word loader descriptor, copies at most 32 UTF-16 units from resource
 * +0x2C into scene +0x2D0, configures +0x310 from descriptor halfword +0x18,
 * resets dialog +0x2CC, and routes it to message state 0x203. Loader, dialog,
 * and scene display state change; no value is returned.
 */
extern "C" void func_ov022_021feac8(void *scene)
{
    void *loader[4];
    loader[0] = (void *)data_ov022_02200664;
    loader[1] = 0;
    loader[2] = 0;
    loader[3] = 0;
    const u8 *descriptor = FIELD(const u8 *, scene, 0x360);
    func_0207c460(loader, FIELD(u16, descriptor, 0x1a));
    const u16 *text = (const u16 *)((u8 *)loader[1] + 0x2c);
    for (s32 i = 0; i < 0x20; ++i) {
        FIELD(u16, scene, 0x2d0 + i * 2) = text[i];
        if (text[i] == 0)
            break;
    }
    GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x310,
                  FIELD(u16, descriptor, 0x18), 0xff676980, 0);
    func_020939d8(FIELD(void *, scene, 0x2cc));
    func_ov022_021ff2c4(scene, 0x203);
}

/*
 * Empty action callback hook. The input is ignored, no state changes, and no
 * value is returned.
 */
extern "C" void func_ov022_021feb74(void *scene)
{
    (void)scene;
}

/*
 * Counts records sharing descriptor +0x358 and how many nonzero records have
 * game-work byte +0x5E94 set to 2, then copies the descriptor-specific message
 * into scene +0x2D0 and resets dialog +0x2CC. If all qualifying records are
 * complete it sets two descriptor flags, plays sound 0x9C, configures +0x310,
 * and routes through states 0x205/0x20C according to persistent flag 0x3CB.
 * Otherwise it displays the integer completion percentage and uses state
 * 0x204. Scene UI, audio, and persistent game-work flags may change.
 */
extern "C" void func_ov022_021feb78(void *scene)
{
    s32 matching = 0;
    s32 completed = 0;
    for (s32 i = 0; i < data_020c37e4; ++i) {
        s32 record_id = FIELD(s16, data_020d7a48, i * 0x24);
        if (FIELD(s32, scene, 0x358) == record_id) {
            if (i != 0 && FIELD(u8, gGameWork, 0x5e94 + i) == 2)
                ++completed;
            ++matching;
        }
    }

    s32 table_offset = FIELD(s32, scene, 0x358) * 0x34;
    const u8 *message = (const u8 *)func_02079f3c(
        data_021f3ecc, FIELD(u16, data_020d780c, table_offset));
    const u16 *text = (const u16 *)(message + 2);
    for (s32 i = 0; i < 0x20; ++i) {
        FIELD(u16, scene, 0x2d0 + i * 2) = text[i];
        if (text[i] == 0)
            break;
    }
    func_020939d8(FIELD(void *, scene, 0x2cc));

    if (matching == completed) {
        FIELD(s32, scene, 0x2ac) = 1;
        GameWork_SetFlag(gGameWork, FIELD(u16, data_020d7828, table_offset));
        GameWork_SetFlag(gGameWork, FIELD(u16, data_020d782c, table_offset));
        func_020922f0(scene, 0x9c);
        GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x310,
                      FIELD(u16, data_020d782e, table_offset),
                      0xff676980, 0);
        if (GameWork_TestFlag(gGameWork, 0x3cb)) {
            func_ov022_021ff2c4(scene, 0x205);
        } else {
            FIELD(s32, scene, 0x2b0) = 1;
            GameWork_SetFlag(gGameWork, 0x3cb);
            func_ov022_021ff2c4(scene, 0x20c);
        }
    } else {
        FIELD(s32, scene, 0x2ac) = 0;
        s32 percentage = func_020befec(completed * 100, matching);
        GraphicsSpriteText_FormatDecimal((u8 *)scene + 0x310, percentage, 0xff676980, 0);
        func_ov022_021ff2c4(scene, 0x204);
    }
}

/*
 * Moves overlay-46 object +0x35C from descriptor +0x358 toward the signed ID
 * of the collection's current row. Controller +0x24/+0x28 are passed as the
 * interpolation numerator/denominator for both coordinates. At rounded
 * halfway progress it also selects the destination descriptor in overlay-46.
 * Graphics state changes; the scene and collection are otherwise read only.
 */
extern "C" void func_ov022_021fed74(void *scene)
{
    void *collection = FIELD(void *, scene, 0x2b4);
    s32 selected = FIELD(s32, collection, 0xc);
    void *entry = (u8 *)FIELD(void *, collection, 0x38) + selected * 8;
    s32 destination = FIELD(s16, FIELD(void *, entry, 0), 0);
    void *effect = FIELD(void *, scene, 0x35c);
    s32 source = FIELD(s32, scene, 0x358);
    s32 source_x = func_ov046_0220c3bc(effect, source);
    s32 source_y = func_ov046_0220c410(effect, source);
    s32 destination_x = func_ov046_0220c3bc(effect, destination);
    s32 destination_y = func_ov046_0220c410(effect, destination);
    s32 numerator = FIELD(s32, collection, 0x24);
    s32 denominator = FIELD(s32, collection, 0x28);
    s32 x = func_02091a70(source_x, destination_x, numerator, denominator);
    s32 y = func_02091a70(source_y, destination_y, numerator, denominator);
    func_ov046_0220c46c(effect, x, y);
    if (denominator == (numerator + ((u32)numerator >> 31)) / 2)
        func_ov046_0220bffc(effect, destination, 0, 0);
}
