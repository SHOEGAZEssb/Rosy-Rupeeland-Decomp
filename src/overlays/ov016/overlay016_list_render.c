#include "tingle/types.h"

/* Overlay 16 five-row text and numeric list rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_021e9ac0;
extern u8 data_021f3ecc[];
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorDescriptor_GetPrimaryLabel(void *);
extern s32 ActorDescriptorState_FindInactiveQuantity(void *, u16);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_DrawText(void *, s32, s32, s32, s32, s32, s32);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern void *RetailTextTable_FindRecordById(void *, s32);
extern void GraphicsSpriteRenderer_DrawDecimal(void *, s32, s32, s32, s32, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Clear the list font surface at +0, then render up to five rows starting at
 * presentation index +0x58/+0x0C. Populated descriptors use linked text at
 * item +0/+4 and a count queried from global work +0x1C with the item's +4
 * halfword; descriptor flag bits 0-2 select text color 5 versus 0x0E, while bit
 * 1 selects numeric color 3 versus 0x0E. Empty rows draw message 0x188+2.
 * Rendering stops at count +0x54, returns void, and mutates font surfaces through
 * SDK calls. The system-state byte +0x5F shifts numeric baselines by two pixels.
 */
extern "C" void func_ov016_021fd3f8(void *state)
{
    void *font = FIELD(void *, state, 0);
    s32 slot;

    GraphicsSpriteCanvas_FillRect(font, 0, 0, 0xff, 0xb0, 0);
    if (FIELD(s32, state, 0x54) == 0) {
        return;
    }
    for (slot = 0; slot < 5; slot++) {
        s32 index = FIELD(s32, FIELD(void *, state, 0x58), 0xc) + slot;
        void *descriptor;
        void *item;

        if (index >= FIELD(s32, state, 0x54)) {
            return;
        }
        descriptor = (u8 *)FIELD(void *, state, 0x4c) + index * 0x14;
        item = FIELD(void *, descriptor, 0);
        GraphicsSpriteRenderer_SetFontResource(font,
                                               FIELD(void *, state, 0x28));
        if (item != 0) {
            void *metadata = FIELD(void *, item, 0);
            s32 textColor = (FIELD(u16, descriptor, 0xc) & 7) != 0 ? 5 : 0xe;
            s32 numberColor = (FIELD(u16, descriptor, 0xc) & 2) != 0 ? 3 : 0xe;
            s32 value;
            s32 baseline = slot * 0x18 + 0x20;

            GraphicsSpriteRenderer_DrawText(font, ActorDescriptor_GetPrimaryLabel((u8 *)metadata + 4), 0x44,
                          (slot + 1) * 0x18, textColor, 4, 0);
            value = ActorDescriptorState_FindInactiveQuantity((u8 *)data_021e9ac0 + 0x1c,
                                  FIELD(u16, metadata, 4));
            if (gSystemState[0x5f] != 0) {
                baseline -= 2;
            }
            GraphicsSpriteRenderer_SetFontResource(
                font, FIELD(void *, state, 0x2c));
            GraphicsSpriteRenderer_DrawDecimal(font, value, 10, 0xb0, baseline, numberColor, 8, 1);
        } else {
            void *message = RetailTextTable_FindRecordById(data_021f3ecc, 0x188);
            GraphicsSpriteRenderer_DrawText(font, (s32)((u8 *)message + 2), 0x44,
                          (slot + 1) * 0x18, 1, 4, 0);
        }
    }
}
