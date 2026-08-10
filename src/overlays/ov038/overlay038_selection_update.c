#include "tingle/types.h"

/*
 * Overlay 38 selection-presentation updates and visible-row rendering. These
 * recovered helpers advance embedded UI systems, blink the auxiliary label,
 * and draw the current five-row window from the filtered record list.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay038TextDescriptor {
    const void *vtable;
    void *text;
    u32 field_08;
    u32 field_0c;
} Overlay038TextDescriptor;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern const u8 data_020d7a48[];
extern const void *data_ov038_021fdd08;
extern void func_020958d8(void *list);
extern void func_02094574(void *model);
extern void func_020740a4(void *owner);
extern void func_ov046_0220c1a4(void *panel);
extern s32 func_02091c7c(void *timer, s32 event);
extern void func_02091b98(void *timer, s32 ticks);
extern const void *func_ov038_021fd508(void *presentation);
extern void func_02028100(void *label, const void *text);
extern void func_0202836c(void *label);
extern void GraphicsSpriteCanvas_FillRect(void *renderer, s32 x, s32 y, s32 width,
                          s32 height, s32 value);
extern void func_0207c460(Overlay038TextDescriptor *descriptor, u16 textId);
extern void func_02075598(void *renderer, void *font);
extern void func_02076148(void *renderer, void *text, s32 x, s32 y,
                          s32 color, s32 spacing, s32 unknown);
#ifdef __cplusplus
}
#endif

/*
 * Advance the embedded list at +0x64, optional selection model at +0x314,
 * resource owner at +0x60, and panel at +0x340. When timer event 2 fires,
 * reload the timer with 60 ticks and toggle +0x364. The set phase computes a
 * label value through func_ov038_021fd508 and applies it to +0x344; the clear
 * phase hides or resets that label. Returns no value; UI, timer, and model
 * state change through the listed callees.
 */
extern "C" void func_ov038_021fd37c(void *presentation)
{
    func_020958d8((u8 *)presentation + 0x64);
    if (FIELD(void *, presentation, 0x314) != 0) {
        func_02094574(FIELD(void *, presentation, 0x314));
    }
    func_020740a4(FIELD(void *, presentation, 0x60));
    func_ov046_0220c1a4(FIELD(void *, presentation, 0x340));
    if (!func_02091c7c((u8 *)presentation + 0x348, 2)) {
        return;
    }

    func_02091b98((u8 *)presentation + 0x348, 60);
    FIELD(s32, presentation, 0x364) = !FIELD(s32, presentation, 0x364);
    if (FIELD(s32, presentation, 0x364)) {
        func_02028100(FIELD(void *, presentation, 0x344),
                      func_ov038_021fd508(presentation));
    } else {
        func_0202836c(FIELD(void *, presentation, 0x344));
    }
}

/*
 * Clear a 176-pixel-wide list region, then draw at most five records beginning
 * at the selection model's +0x0C scroll offset. Record indices come from the
 * filtered array at presentation +0x114; each 0x24-byte record supplies a text
 * ID at +0x1A. Text is resolved through the temporary descriptor using the
 * confirmed overlay descriptor vtable and rendered at x=32, y=24*(row+1),
 * color 14, spacing 8. Stops at the filtered count +0x110 and returns no value;
 * renderer and temporary text state change through SDK-like UI callees.
 */
extern "C" void func_ov038_021fd40c(void *presentation)
{
    void *renderer = *(void **)data_020f4e14;
    GraphicsSpriteCanvas_FillRect(renderer, 0, 0, 0xff, 0xb0, 0);
    if (FIELD(s32, presentation, 0x110) == 0) {
        return;
    }

    for (s32 row = 0; row < 5; row++) {
        s32 item = FIELD(s32, FIELD(void *, presentation, 0x314), 0x0c) + row;
        if (item >= FIELD(s32, presentation, 0x110)) {
            return;
        }
        s32 record = FIELD(s32, presentation, 0x114 + item * 4);
        u16 textId = *(const u16 *)(data_020d7a48 + record * 0x24 + 0x1a);
        Overlay038TextDescriptor descriptor = {data_ov038_021fdd08, 0, 0, 0};
        func_0207c460(&descriptor, textId);
        func_02075598(renderer, FIELD(void *, presentation, 0x31c));
        func_02076148(renderer, (u8 *)descriptor.text + 0x2c, 0x20,
                      (row + 1) * 0x18, 0x0e, 8, 0);
    }
}

/* No-op presentation hook. It consumes no state and has no return-side effect. */
extern "C" void func_ov038_021fd504(void)
{
}
