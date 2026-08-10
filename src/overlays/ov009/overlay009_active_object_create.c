#include "tingle/types.h"

/*
 * Overlay 9 active-object creation. This recovered helper selects one packed
 * record, configures an embedded descriptor, and creates the retained object.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e18;
extern void func_02071ee0(void *member, void *archive, s32 first, s32 second,
                          s32 third);
extern void func_020708c4(void *member);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *owner, void *member, u8 variant);
#ifdef __cplusplus
}
#endif

/*
 * Clear +0xD8/+0xDC. Use +0xA4 to select a loaded buffer at +0x8C and its
 * 32-byte-record index at +0xC0, then pass that record's first three words to
 * member +0x78 with archive data_020f4e18. Finalize the member through its
 * pointer at +0x7C, create an object from +0x84, member +0x78, and low byte of
 * +0xF8, store it at +0x88, and set object byte +0x3A to 3. Reset
 * +0x120/+0x124/+0x128 to 0x100 and +0x12C to zero. Set +0x130 to one less
 * than the product of the +0x04/+0x06 halfwords in the metadata reached via
 * +0x7C,+0x20, and clear +0x138. Return no value. Resource and allocation
 * effects are delegated and no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov009_021fd360(void *state)
{
    s32 selection = FIELD(s32, state, 0xa4);
    u8 *record = (u8 *)FIELD(void *, state, 0x8c + selection * 4) +
                 FIELD(s32, state, 0xc0 + selection * 4) * 0x20;
    void *object;
    void *metadata;

    FIELD(s32, state, 0xd8) = 0;
    FIELD(s32, state, 0xdc) = 0;
    func_02071ee0((u8 *)state + 0x78, data_020f4e18,
                  FIELD(s32, record, 0), FIELD(s32, record, 4),
                  FIELD(s32, record, 8));
    func_020708c4(FIELD(void *, state, 0x7c));
    object = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0x84), (u8 *)state + 0x78,
                          (u8)FIELD(s32, state, 0xf8));
    FIELD(void *, state, 0x88) = object;
    FIELD(u8, object, 0x3a) = 3;
    FIELD(s32, state, 0x120) = 0x100;
    FIELD(s32, state, 0x124) = 0x100;
    FIELD(s32, state, 0x128) = 0x100;
    FIELD(s32, state, 0x12c) = 0;
    metadata = FIELD(void *, FIELD(void *, state, 0x7c), 0x20);
    FIELD(s32, state, 0x130) =
        (s32)FIELD(u16, metadata, 4) * FIELD(u16, metadata, 6) - 1;
    FIELD(s32, state, 0x138) = 0;
}
