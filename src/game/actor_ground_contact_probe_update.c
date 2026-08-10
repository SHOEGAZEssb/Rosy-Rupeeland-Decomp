#include "tingle/types.h"

/* Probe predicted actor ground contact, manage a contact cooldown, and derive escape motion. */
extern u8 data_021f5ebc[];
extern void *gGameWork;
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_020828a0(void *state, s32 index);
extern s32 Actor_QueryTerrainHeight(void *actor, s32 x, s32 y);
extern s32 func_02033f44(void *actor);
extern u32 Actor_QueryTerrainCell(void *actor, s32 x, s32 y);
extern s32 func_0203463c(void *actor, s32 x, s32 y, s32 height);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void Sound_Play(void *context, s32 channel, s32 sound);
extern void func_02005084(void *vector);
extern void func_02005030(void *destination, const void *source);
extern void func_020050a4(void *destination, const void *source);
extern void func_02005058(void *vector);
extern void func_02034800(void *actor, void *vector);
#ifdef __cplusplus
}
#endif

/* Clear recovered contact countdown +0x204 and flag +0xd0 bit 0x40. */
static void clearContactCountdown(u8 *actor)
{
    *(u16 *)(actor + 0x204) = 0;
    *(u32 *)(actor + 0xd0) &= ~0x40;
}

/* Return whether actor subtype byte +0x4d is one. */
static s32 isTypeOne(const u8 *actor)
{
    return actor[0x4d] == 1;
}

/*
 * Return immediately for actor +0x14 bit two, global state query
 * func_020828a0(data_021f5ebc,1), or +0xd0 bit 0x80000. Bit 0x10000 selects
 * the landing-release path: probe terrain at position plus all primary and
 * secondary motion; once actor Z +0x24 is not above it, clear bit 0x10000 only
 * when bit 0x10 is clear and Z equals floor +0x1dc.
 *
 * The normal path is disabled by +0xd0 bit 0x10. Otherwise predict X/Y from
 * position +0x1c/+0x20 and motion +0x3c/+0x40, +0x8c/+0x90, +0x9c/+0xa0.
 * If terrain height equals func_02033f44, clear countdown +0x204 and flag
 * 0x40. For differing terrain, decode kind bits 5..9 and subtype bits 10..13
 * from Actor_QueryTerrainCell. Kinds 6,16,20,17 are a confirmed special set for type-one
 * actors; kinds 8..13 and kind 7 participate in the recovered floor gates.
 * Countdown duration is 12 with GameWork flag 0x12, otherwise 48.
 *
 * Eligible type-one actors without GameWork flag 0x25d, actor +0x230 bit 0x800,
 * or an existing countdown probe four forward samples with func_0203463c. If
 * all four are empty, optionally play cue 0x43, set timer +0x2a2 to eight, and
 * skip the neighborhood response. Otherwise probe the surrounding 3x3 cells
 * (excluding center), accumulate -0x18000 X/Y impulses for empty cells into
 * +0x9c/+0xa0, clear +0xa4, and normalize vector +0x98 when nonzero.
 *
 * Install/decrement countdown +0x204. While nonzero set +0xd0 bit 0x40 and,
 * for type one, clear +0x230 bit 0x10000. On expiry clear bit 0x40; eligible
 * type-one actors with nonzero +0x2a2 set +0xd0 bit 0x10000, copy vector +0x28,
 * transform it through func_02034800, and retain it at +0x284. Returns no
 * value. Terrain, GameWork, sound, vector, and transform calls have observable
 * engine or SDK effects. Raw kind meanings remain intentionally unnamed.
 */
void func_0203bba4(void *self)
{
    u8 *actor = (u8 *)self;
    u32 flags;
    s32 totalX;
    s32 totalY;
    s32 predictedX;
    s32 predictedY;
    s32 terrain;
    s32 currentGround;
    u32 cell;
    u32 kind;
    u32 subtype;
    s32 kind8to13;
    s32 kind7;
    s32 special;
    u16 duration;

    if ((*(u32 *)(actor + 0x14) & 2) != 0 ||
        func_020828a0(data_021f5ebc, 1) != 0)
        return;
    flags = *(u32 *)(actor + 0xd0);
    if ((flags & 0x80000) != 0)
        return;
    if ((flags & 0x10000) != 0) {
        predictedX = *(s32 *)(actor + 0x1c) + *(s32 *)(actor + 0x3c) +
                     *(s32 *)(actor + 0x8c) + *(s32 *)(actor + 0x9c);
        predictedY = *(s32 *)(actor + 0x20) + *(s32 *)(actor + 0x40) +
                     *(s32 *)(actor + 0x90) + *(s32 *)(actor + 0xa0);
        terrain = Actor_QueryTerrainHeight(actor, predictedX >> 16, predictedY >> 16)
                  << 16;
        if (*(s32 *)(actor + 0x24) <= terrain &&
            (*(u32 *)(actor + 0xd0) & 0x10) == 0 &&
            *(s32 *)(actor + 0x24) == *(s32 *)(actor + 0x1dc))
            *(u32 *)(actor + 0xd0) &= ~0x10000;
        return;
    }
    if ((flags & 0x10) != 0) {
        *(u32 *)(actor + 0xd0) &= ~0x40;
        return;
    }

    totalX = *(s32 *)(actor + 0x3c) + *(s32 *)(actor + 0x8c) +
             *(s32 *)(actor + 0x9c);
    totalY = *(s32 *)(actor + 0x40) + *(s32 *)(actor + 0x90) +
             *(s32 *)(actor + 0xa0);
    predictedX = *(s32 *)(actor + 0x1c) + totalX;
    predictedY = *(s32 *)(actor + 0x20) + totalY;
    terrain = Actor_QueryTerrainHeight(actor, predictedX >> 16, predictedY >> 16) << 16;
    currentGround = func_02033f44(actor);
    if (terrain == currentGround) {
        clearContactCountdown(actor);
        return;
    }

    cell = Actor_QueryTerrainCell(actor, predictedX >> 16, predictedY >> 16);
    kind = (cell >> 5) & 0x1f;
    subtype = (cell >> 10) & 0x0f;
    kind8to13 = kind >= 8 && kind <= 13;
    kind7 = kind == 7;
    special = isTypeOne(actor) &&
              (kind == 6 || kind == 16 || kind == 20 || kind == 17);
    duration = GameWork_TestFlag(gGameWork, 0x12) ? 12 : 48;

    if (subtype != 1) {
        s32 floor = *(s32 *)(actor + 0x1dc);
        s32 z = *(s32 *)(actor + 0x24);
        if (z != floor ||
            !((floor > terrain + 0x10000 || floor < terrain ||
               (kind7 && terrain == floor)) && !kind8to13)) {
            clearContactCountdown(actor);
            return;
        }
    }

    if (special && *(u16 *)(actor + 0x204) != 0)
        goto updateCountdown;

    if (isTypeOne(actor) && GameWork_TestFlag(gGameWork, 0x25d) == 0 &&
        *(u16 *)(actor + 0x204) == 0 &&
        (*(u32 *)(actor + 0x230) & 0x800) == 0 && special) {
        s32 validCount = 4;
        s32 i;
        s32 height = func_02033f44(actor) >> 16;
        for (i = 0; i < 4; ++i) {
            s32 scale = i * 9 + 8;
            if (func_0203463c(actor,
                    (predictedX + totalX * scale) >> 16,
                    (predictedY + totalY * scale) >> 16, height) == 0)
                --validCount;
        }
        if (validCount == 0) {
            if (*(u16 *)(actor + 0x2a2) == 0 &&
                *(s32 *)(actor + 0x1dc) < terrain + 0x40000)
                Sound_Play(gSoundContext, 0, 0x43);
            *(u16 *)(actor + 0x2a2) = 8;
        } else {
            s32 impulseX = 0;
            s32 impulseY = 0;
            s32 centerX = *(s32 *)(actor + 0x1c) >> 16;
            s32 centerY = *(s32 *)(actor + 0x20) >> 16;
            s32 x;
            s32 y;
            for (x = -1; x <= 1; ++x) {
                for (y = -1; y <= 1; ++y) {
                    if ((x != 0 || y != 0) &&
                        (centerX != (*(s32 *)(actor + 0x1c) +
                                     x * 17 * 0x1000) >> 16 ||
                         centerY != (*(s32 *)(actor + 0x20) +
                                     y * 0x7000) >> 16) &&
                        func_0203463c(actor,
                            (*(s32 *)(actor + 0x1c) + x * 17 * 0x1000) >> 16,
                            (*(s32 *)(actor + 0x20) + y * 0x7000) >> 16,
                            height) == 0) {
                        impulseX += x * -0x18000;
                        impulseY += y * -0x18000;
                    }
                }
            }
            *(s32 *)(actor + 0x9c) = impulseX;
            *(s32 *)(actor + 0xa0) = impulseY;
            *(s32 *)(actor + 0xa4) = 0;
            if (impulseX != 0 || impulseY != 0)
                func_02005084(actor + 0x98);
        }
    }
    *(u16 *)(actor + 0x204) = duration;

updateCountdown:
    if (*(u16 *)(actor + 0x204) != 0) {
        --*(u16 *)(actor + 0x204);
        if (*(u16 *)(actor + 0x204) != 0) {
            *(u32 *)(actor + 0xd0) |= 0x40;
            if (isTypeOne(actor))
                *(u32 *)(actor + 0x230) &= ~0x10000;
            return;
        }
        *(u32 *)(actor + 0xd0) &= ~0x40;
        if (special && isTypeOne(actor) && *(u16 *)(actor + 0x2a2) != 0) {
            s32 vector[4];
            *(u32 *)(actor + 0xd0) |= 0x10000;
            func_02005030(vector, actor + 0x28);
            func_02034800(actor, vector);
            func_020050a4(actor + 0x284, vector);
            func_02005058(vector);
        }
    } else {
        *(u32 *)(actor + 0xd0) &= ~0x40;
    }
}
