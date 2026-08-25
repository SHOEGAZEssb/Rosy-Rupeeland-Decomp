#include "tingle/types.h"

/* Overlay 15 record-array updates and its conditional status-panel refresh. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_021e9ac0;
extern void *gDebugFont;
extern u8 gSystemState[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 ActorDescriptor_GetPrimaryLabel(void *);
extern s32 ActorDescriptorState_FindInactiveQuantity(void *, u16);
extern void GraphicsSpriteRenderer_SetFontResource(void *, void *);
extern void GraphicsSpriteRenderer_DrawText(void *, s32, s32, s32, s32, s32, s32);
extern s32 GraphicsSpriteRenderer_MeasureText(void *, s32, s32, s32);
extern void GraphicsSpriteCanvas_FillRect(void *, s32, s32, s32, s32, s32);
extern void GraphicsSpriteRenderer_DrawDecimal(void *, s32, s32, s32, s32, s32, s32, s32);
extern void SpriteMotionController_Update(void *);
extern void SpriteMotionController_SetAnimation(void *, s32);
extern void func_ov001_021fb81c(void *, s32);
extern void Overlay001_PopulatePresentation(void *, void *, s32);
extern void Overlay001_Grid_Update(void *);
extern void *func_ov001_021fc7e4(void *);
#ifdef __cplusplus
}
#endif

/*
 * Update the optional object at +0xDC, then update each of the three 0xAC-byte
 * records beginning at +0xFC. The state and records are mutated by their
 * respective update routines; the function returns void and has no direct
 * hardware effects.
 */
extern "C" void Overlay015_UpdateRecords(void *state)
{
    s32 i;

    if (FIELD(void *, state, 0xdc) != 0) {
        Overlay001_Grid_Update(FIELD(void *, state, 0xdc));
    }
    for (i = 0; i < 3; i++) {
        SpriteMotionController_Update((u8 *)state + 0xfc + i * 0xac);
    }
}

/*
 * Refresh the overlay's status presentation from the object at +0xDC. In the
 * +0xEC mode, draw a count and optional string into the two font surfaces and
 * toggle bit 2 of the halfword at object +0x24. Otherwise, select one of two
 * object states and mirror that selection in state flags +0x4C. Return void;
 * the +0xEC path changes text surfaces and presentation state but not MMIO.
 */
extern "C" void func_ov015_021fd6c8(void *state)
{
    void *status = func_ov001_021fc7e4(FIELD(void *, state, 0xdc));

    if (FIELD(void *, state, 0xec) != 0) {
        s32 value = ActorDescriptorState_FindInactiveQuantity((u8 *)data_021e9ac0 + 0x1c,
                                 *(u16 *)FIELD(void *, state, 0xec));
        s32 bottom = gSystemState[0x5f] != 0 ? 0x7e : 0x7c;

        GraphicsSpriteRenderer_SetFontResource(gDebugFont, FIELD(void *, state, 0x78));
        GraphicsSpriteCanvas_FillRect(gDebugFont, 0x40, 0x74, 0x58, bottom, 0);
        GraphicsSpriteRenderer_DrawDecimal(gDebugFont, value, 10, 0x40, 0x74,
                      value >= 99 ? 3 : 0xe, 8, 1);
        GraphicsSpriteCanvas_FillRect(data_020f4e14, 0x40, 6, 0xc0, 0x16, 0);

        if (FIELD(void *, status, 0xc) == 0) {
            FIELD(u16, FIELD(void *, state, 0x70), 0x24) |= 4;
        } else {
            s32 text = ActorDescriptor_GetPrimaryLabel(FIELD(void *, status, 0xc));
            s32 width;

            FIELD(u16, FIELD(void *, state, 0x70), 0x24) &= (u16)~4;
            GraphicsSpriteRenderer_SetFontResource(data_020f4e14, FIELD(void *, state, 0x7c));
            width = GraphicsSpriteRenderer_MeasureText(data_020f4e14, text, 8, 0);
            text = ActorDescriptor_GetPrimaryLabel(FIELD(void *, status, 0xc));
            GraphicsSpriteRenderer_DrawText(data_020f4e14, text,
                          0x80 - width / 2, 6, 0xe, 8, 0);
        }
    } else if (FIELD(void *, status, 0xc) != 0) {
        Overlay001_PopulatePresentation(FIELD(void *, state, 0xf4), FIELD(void *, status, 0xc), 1);
        FIELD(u32, state, 0x4c) |= 2;
    } else {
        func_ov001_021fb81c(FIELD(void *, state, 0xf4), 1);
        FIELD(u32, state, 0x4c) &= ~2u;
    }
}

/*
 * Append the low byte of value to the next free record, storing the full value
 * at record offset +0xA8 before initialization. Ignore appends once the count
 * at +0x300 reaches three, increment the count on success, and return void.
 */
extern "C" void func_ov015_021fd8a8(void *state, s32 value)
{
    s32 count = FIELD(s32, state, 0x300);
    void *record;

    if (count >= 3) {
        return;
    }
    record = (u8 *)state + 0xfc + count * 0xac;
    FIELD(s32, record, 0xa8) = value;
    SpriteMotionController_SetAnimation(record, value & 0xff);
    FIELD(s32, state, 0x300)++;
}
