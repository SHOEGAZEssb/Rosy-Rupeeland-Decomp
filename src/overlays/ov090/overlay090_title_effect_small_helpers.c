#include "tingle/types.h"

/* Small paired-sprite and transform helpers for the overlay-90 boss-stage effect. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TitleEffectTransformView {
    const void *vtable;
    s32 x;
    s32 y;
} TitleEffectTransformView;

extern const void *data_ov090_0221cc88[];
extern void func_ov090_0221b97c(void *resource, u16 flags);
extern void func_ov090_0221bc5c(void *resource, u16 flags);

/* Store one animation-frame halfword at +0x28 in both paired sprites. */
void func_ov090_0221c9f8(void *self, s32 frame)
{
    FIELD(u16, FIELD(void *, self, 4), 0x28) = (u16)frame;
    FIELD(u16, FIELD(void *, self, 8), 0x28) = (u16)frame;
}

/* Construct a transform view by copying the source payload words +4 and +8. */
void func_ov090_0221ca14(TitleEffectTransformView *self,
                         const TitleEffectTransformView *source)
{
    self->vtable = data_ov090_0221cc88;
    self->x = source->x;
    self->y = source->y;
}

/* Set or clear sprite flag 0x10 on the paired resource referenced at +4. */
void func_ov090_0221ca34(void *self, s32 clear)
{
    if (clear != 0)
        func_ov090_0221bc5c(FIELD(void *, self, 4), 0x10);
    else
        func_ov090_0221b97c(FIELD(void *, self, 4), 0x10);
}

/* Store the signed-coordinate offsets used by the effect update at +0xC/+0xE. */
void func_ov090_0221ca58(void *self, u16 xOffset, u16 yOffset)
{
    FIELD(u16, self, 0x0c) = xOffset;
    FIELD(u16, self, 0x0e) = yOffset;
}
