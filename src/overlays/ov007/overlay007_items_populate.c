#include "tingle/types.h"

/*
 * Overlay 7 item population. This recovered routine creates or refreshes a
 * primary object, ten table-positioned items, two fixed-position items, and
 * the controller's embedded update member.
 */

typedef struct Overlay007ItemState {
    u8 bytes[0xdc];
} Overlay007ItemState;

typedef void (*Overlay007PlaceObject)(void *state, void *object, s32 x, s32 y,
                                      s32 first, s32 second);

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern u32 data_ov007_021fc280;
extern s32 data_ov007_021fc284[20];
extern void *func_0209a208(void *state, s32 firstId, s32 secondId, s32 thirdId,
                          s32 argument, s32 mode);
extern void GraphicsSpriteState_SetAnimationIndex(void *member, s32 value);
extern void VecFx32Object_InitComponents(void *member, s32 first, s32 second, s32 third);
extern void VecFx32Object_Assign(void *destination, const void *source);
extern void VecFx32Object_Destroy(void *member);
#ifdef __cplusplus
}
#endif

/* Call state vtable slot +0x00 to place an object in 20.12 coordinates. */
static void overlay007_place_object(Overlay007ItemState *state, void *object,
                                    s32 x, s32 y)
{
    void *vtable = FIELD(void *, state, 0x000);
    Overlay007PlaceObject place = FIELD(Overlay007PlaceObject, vtable, 0x00);

    place(state, object, x, y, 0, 0);
}

/* Clear the confirmed bit 2 in an object's halfword at +0x42. */
static void overlay007_show_object(void *object)
{
    FIELD(u16, object, 0x42) &= ~4;
}

/* Seed the ten confirmed pixel-coordinate pairs once per overlay lifetime. */
static void overlay007_initialize_item_positions(void)
{
    static const s32 positions[20] = {
        0xbb, 0x72, 0xd0, 0x63, 0xe4, 0x55, 0xb8, 0x4f, 0xd6, 0x40,
        0x9d, 0x3e, 0xba, 0x35, 0xe6, 0x31, 0xae, 0x28, 0xcd, 0x28
    };
    s32 index;

    if ((data_ov007_021fc280 & 1) == 0) {
        for (index = 0; index < 20; index++) {
            data_ov007_021fc284[index] = positions[index];
        }
        data_ov007_021fc280 |= 1;
    }
}

/*
 * When +0x4C is null, create it with IDs 0x104F..0x1051 and place it at
 * 0xA0000/0x87000. Lazily initialize ten global coordinate pairs beginning at
 * data_ov007_021fc284. For indices 9 down to 0, create an item with IDs
 * 0x1160..0x1162 at state +0x50+index*4, place it at the corresponding pair
 * shifted to 20.12, submit palette/value `(index & 3)*2` through the member at
 * object +0x0C, and clear state counter +0xA4+index*4. Create +0x78 with IDs
 * 0x13BA..0x13BC at 0x2B000/0x49000 and set its +0x42 halfword to 4. Create
 * +0x7C with IDs 0x137E..0x1380 at 0x2A000/0xB4000 and clear that flag bit.
 *
 * When +0x4C already exists, clear bit 2 at its +0x42, on each indexed item
 * whose +0xA4 counter is <=8, and on +0x7C. In both paths, construct a zeroed
 * temporary member through VecFx32Object_InitComponents, copy it into +0x80, destroy the
 * temporary, clear +0x98, bytes +0xA0/+0xA1, halfword +0xD8, word +0xCC, and
 * byte +0xD0, then set +0xD4 to one. Return no value. Allocation/object creation
 * is delegated; object IDs, positions, flags, and reset offsets are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
void Overlay007_PopulateItems(Overlay007ItemState *state, s32 argument)
{
    s32 index;
    u8 temporary[0x10];

    if (FIELD(void *, state, 0x04c) == 0) {
        void *object = func_0209a208(state, 0x104f, 0x1050, 0x1051, argument,
                                    2);
        FIELD(void *, state, 0x04c) = object;
        overlay007_place_object(state, object, 0xa0000, 0x87000);
        overlay007_initialize_item_positions();

        for (index = 9; index >= 0; index--) {
            object = func_0209a208(state, 0x1160, 0x1161, 0x1162, argument, 2);
            FIELD(void *, state, 0x050 + index * 4) = object;
            overlay007_place_object(state, object,
                                    data_ov007_021fc284[index * 2] << 12,
                                    data_ov007_021fc284[index * 2 + 1] << 12);
            GraphicsSpriteState_SetAnimationIndex((u8 *)object + 0x0c, (index & 3) * 2);
            FIELD(s32, state, 0x0a4 + index * 4) = 0;
        }

        object = func_0209a208(state, 0x13ba, 0x13bb, 0x13bc, argument, 2);
        FIELD(void *, state, 0x078) = object;
        overlay007_place_object(state, object, 0x2b000, 0x49000);
        FIELD(u16, object, 0x42) = 4;

        object = func_0209a208(state, 0x137e, 0x137f, 0x1380, argument, 2);
        FIELD(void *, state, 0x07c) = object;
        overlay007_place_object(state, object, 0x2a000, 0xb4000);
        overlay007_show_object(object);
    } else {
        overlay007_show_object(FIELD(void *, state, 0x04c));
        for (index = 9; index >= 0; index--) {
            if (FIELD(s32, state, 0x0a4 + index * 4) <= 8) {
                overlay007_show_object(FIELD(void *, state,
                                              0x050 + index * 4));
            }
        }
        overlay007_show_object(FIELD(void *, state, 0x07c));
    }

    VecFx32Object_InitComponents(temporary, 0, 0, 0);
    VecFx32Object_Assign((u8 *)state + 0x80, temporary);
    VecFx32Object_Destroy(temporary);
    FIELD(s32, state, 0x098) = 0;
    FIELD(u8, state, 0x0a0) = 0;
    FIELD(u8, state, 0x0a1) = 0;
    FIELD(u16, state, 0x0d8) = 0;
    FIELD(s32, state, 0x0cc) = 0;
    FIELD(u8, state, 0x0d0) = 0;
    FIELD(s32, state, 0x0d4) = 1;
}

#undef FIELD
