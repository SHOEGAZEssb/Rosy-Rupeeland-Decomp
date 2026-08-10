#include "tingle/types.h"

/* Advance table-record actor strength, recoil, terrain presentation, and virtual frame state. */
extern u8 *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020adae4(s32 numerator, s32 denominator);
extern s32 func_02034164(void *actor);
extern void func_020328d0(void *vector, s32 scale);
extern s32 func_02005070(void *vector);
extern s32 Actor_QueryTerrainHeight(void *actor, s32 x, s32 y);
extern void func_0203a0f0(void *actor, u32 resource, u16 value);
extern void func_02032228(void *actor, s32 x, s32 y, s32 scale);
extern void Actor_UpdateAnimationState(void *actor);
#ifdef __cplusplus
}
#endif

/* Return rounded fixed-point square of value. */
static s32 squareFxRound(s32 value)
{
    return (s32)(((s64)value * value + 0x800) >> 12);
}

/*
 * Invoke virtual +0x18. Average halfwords +0x208/+0x20a and low 13 bits of
 * word +0x20c, store the result back into those low 13 bits while preserving
 * higher flags, clear +0x20a, and clear bits 0x4000/0x8000. When actor +0x10
 * bit 0x01000000 is set, return early if func_02034164 is false.
 *
 * While byte +0x210 is nonzero, decrement it and scale vector +0x88 by record
 * +0x214 signed halfword +0x06 times 16. Otherwise use record halfword +0x08,
 * clear +0xd0 bit 0x40, and clear vector components +0x8c..+0x94 when its
 * length is below 410. Decrement nonzero byte +0x211.
 *
 * Until actor +0x14 bit 0x10000000 is set, query the runtime map at actor X/Y.
 * When decoded bits 10..13 equal one and Actor_QueryTerrainHeight (shifted four)
 * is at least actor Z shifted down 12, spawn resource one with value 0x100,
 * invoke virtual +0x54 with zero, and set that actor flag.
 *
 * Set +0xd0 bit 0x2000 and invoke virtual +0xa4. If the virtual clears that
 * bit, divide motion +0x3c/+0x40 by three and zero both when their rounded
 * fixed-point squared sum is below 410. For +0x20c bit 0x2000, store vector
 * +0x88 length divided by 16 into attachment +0x54 halfword +0x36 and invoke
 * func_02032228(actor,+0x8c,+0x90,0x800). Finish through Actor_UpdateAnimationState and
 * virtual +0x20. Returns no value; map, presentation, vector, and virtual calls
 * have observable actor/engine effects.
 */
void func_0203cf8c(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *record;
    u32 strength;

    (*(void (**)(void *))(*(u8 **)actor + 0x18))(actor);
    strength = (*(u16 *)(actor + 0x208) + *(u16 *)(actor + 0x20a) +
                (*(u32 *)(actor + 0x20c) & 0x1fff)) / 2;
    *(u32 *)(actor + 0x20c) =
        (*(u32 *)(actor + 0x20c) & ~0x1fff) | (strength & 0x1fff);
    *(u16 *)(actor + 0x20a) = 0;
    *(u32 *)(actor + 0x20c) &= ~(0x4000 | 0x8000);
    if ((*(u32 *)(actor + 0x10) & 0x01000000) != 0 &&
        func_02034164(actor) == 0)
        return;

    record = *(u8 **)(actor + 0x214);
    if (actor[0x210] != 0) {
        --actor[0x210];
        func_020328d0(actor + 0x88, *(s16 *)(record + 6) * 16);
    } else {
        func_020328d0(actor + 0x88, *(s16 *)(record + 8) * 16);
        *(u32 *)(actor + 0xd0) &= ~0x40;
        if (func_02005070(actor + 0x88) < 410) {
            *(s32 *)(actor + 0x8c) = 0;
            *(s32 *)(actor + 0x90) = 0;
            *(s32 *)(actor + 0x94) = 0;
        }
    }
    if (actor[0x211] != 0)
        --actor[0x211];

    if ((*(u32 *)(actor + 0x14) & 0x10000000) == 0) {
        s32 x = *(s32 *)(actor + 0x1c) >> 16;
        s32 y = *(s32 *)(actor + 0x20) >> 16;
        u8 *map = *(u8 **)(data_021052fc + 0x2ed4);
        u32 cell = (*(u32 (**)(void *, s32, s32))(*(u8 **)map + 0x2c))(
            map, x, y);
        if (((cell >> 10) & 0x0f) == 1 &&
            (Actor_QueryTerrainHeight(actor, x, y) << 4) >=
                (*(s32 *)(actor + 0x24) >> 12)) {
            func_0203a0f0(actor, 1, 0x100);
            (*(void (**)(void *, s32))(*(u8 **)actor + 0x54))(actor, 0);
            *(u32 *)(actor + 0x14) |= 0x10000000;
        }
    }

    *(u32 *)(actor + 0xd0) |= 0x2000;
    (*(void (**)(void *))(*(u8 **)actor + 0xa4))(actor);
    if ((*(u32 *)(actor + 0xd0) & 0x2000) == 0) {
        *(s32 *)(actor + 0x3c) = func_020adae4(*(s32 *)(actor + 0x3c), 3);
        *(s32 *)(actor + 0x40) = func_020adae4(*(s32 *)(actor + 0x40), 3);
        if (squareFxRound(*(s32 *)(actor + 0x3c)) +
            squareFxRound(*(s32 *)(actor + 0x40)) < 410) {
            *(s32 *)(actor + 0x3c) = 0;
            *(s32 *)(actor + 0x40) = 0;
        }
    }
    if ((*(u32 *)(actor + 0x20c) & 0x2000) != 0) {
        *(u16 *)(*(u8 **)(actor + 0x54) + 0x36) =
            (u16)func_020adae4(func_02005070(actor + 0x88), 16);
        func_02032228(actor, *(s32 *)(actor + 0x8c),
                      *(s32 *)(actor + 0x90), 0x800);
    }
    Actor_UpdateAnimationState(actor);
    (*(void (**)(void *))(*(u8 **)actor + 0x20))(actor);
}
