#include "tingle/types.h"

/*
 * Overlay 41 primary effect frame update. This recovered routine dispatches
 * mode-specific controllers, integrates the 91-record trail, synchronizes
 * special presentation state, emits particles, and detects effect completion.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_ov041_021fd000(void *);
void func_ov041_021fec04(void *, const void *);
s32 func_ov041_022009e8(void *);
void func_ov041_02201784(void *);
void func_ov041_022017f8(void *, s32 *, s32 *);
void func_ov041_02201b38(void *, s32 *, s32 *);
void func_ov041_02201e98(void *, s32 *, s32 *);
void func_ov041_02202220(void *);
void func_ov041_0220232c(void *);
void func_ov041_022024c8(void *, s32 *, s32 *);
void func_ov041_022025b0(void *);
s32 func_ov041_022029cc(void *);
void func_ov041_02202a00(void *);
void func_ov041_02202a3c(void *);
s32 func_ov041_02202aa4(void *);
void func_ov041_02202adc(void *);
void func_ov004_021fb868(void *, s32, s32, s32);
void func_ov008_021fbd1c(void *);
void func_ov070_02210320(void *);
void VecFx32Object_Init(void *);
void VecFx32Object_Assign(void *, const void *);
void VecFx32Object_Destroy(void *);
void Sound_Play(void *, s32, s32);
extern void *gSoundContext;
extern s16 gFx32CosSinTable[];
}

/* Multiply two signed 20.12 fixed-point values with the game's rounding. */
static s32 mul_fx(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/*
 * Update an active effect object. A positive object+0x924 only counts down and
 * updates the external emitter. Otherwise the routine dispatches modes 3,4,
 * 6-14, computes requested steering, shifts record data toward the trail tail,
 * steps record zero using fixed-point direction-table vectors, and applies the
 * owner Y delta used by modes 4,6,11. It then emits incidental particles.
 * Except for modes 8-10 and 14, an effect whose records have all crossed the
 * view boundary is stopped; owner completion state two is cleared and the
 * linked overlay-70 callback is invoked. Mode 13 also updates owner presentation
 * transform data and audio. The function returns no value and can affect audio,
 * rendering, particles, and the linked object.
 */
extern "C" void func_ov041_02202c34(void *object)
{
    if (FIELD(s32, object, 0x920) == 0)
        return;

    s32 requestedTurn = 0;
    s32 maxTurn = 0x200;
    if (FIELD(s32, object, 0x924) > 0) {
        FIELD(s32, object, 0x924)--;
        func_ov008_021fbd1c(FIELD(void *, object, 0x958));
        return;
    }

    s32 mode = FIELD(s32, object, 0x920);
    if (mode == 8) {
        func_ov041_02202220(object);
    } else if (mode == 9) {
        func_ov041_0220232c(object);
    } else if (mode == 10) {
        func_ov041_022024c8(object, &requestedTurn, &maxTurn);
    } else if (mode == 13) {
        s32 state = FIELD(s32, object, 0x91c);
        if (state == 0) {
            FIELD(s32, object, 0x4b8) =
                (FIELD(s32, object, 0x4b8) +
                 func_ov041_02202aa4(object) * 2) &
                0xffff;
            if (FIELD(s32, object, 0x4b4) >
                FIELD(s32, object, 0x70)) {
                FIELD(s32, object, 0x91c) = 1;
                FIELD(s32, object, 0x930) = 0;
                FIELD(s32, object, 0x934) = 0;
                Sound_Play(gSoundContext, 0x12d, 1);
            }
        } else if (state == 1) {
            s32 direction = FIELD(s32, object, 0x4b8) - 0x12c;
            if (direction < 0)
                direction += 0x10000;
            if (direction < 0x12c) {
                direction = 0;
                FIELD(s32, object, 0x91c)++;
            }
            FIELD(s32, object, 0x4b8) = direction & 0xffff;
        } else if (state == 2) {
            void *view =
                FIELD(void *, FIELD(void *, object, 0x48), 0x14);
            if (FIELD(s32, object, 0x70) >
                FIELD(s32, view, 0x15c) - 0x64000) {
                Sound_Play(gSoundContext, 0x12d, 11);
                FIELD(s32, object, 0x91c)++;
                state = 3;
            }
        }
        if (FIELD(s32, object, 0x91c) == 3) {
            void *view =
                FIELD(void *, FIELD(void *, object, 0x48), 0x14);
            s32 viewY = FIELD(s32, view, 0x15c);
            if (FIELD(s32, object, 0x70) > viewY - 0x64000) {
                s32 frame = FIELD(s32, object, 0x93c);
                if ((frame & 15) == 0)
                    func_ov004_021fb868(
                        FIELD(void *, object, 0x958), 6,
                        FIELD(s32, object, 0x6c) >> 12,
                        (viewY - 0x14000) >> 12);
                if ((frame & 63) == 16)
                    Sound_Play(gSoundContext, 0x12d, 11);
            }
        }
        if (FIELD(s32, object, 0x91c) > 0) {
            s32 phase = FIELD(s32, object, 0x934) + 0xc8;
            if (phase > 0x8000)
                phase = 0x8000;
            FIELD(s32, object, 0x934) = phase;
            s32 tablePhase = phase * 4;
            if (tablePhase > 0x10000)
                tablePhase = 0;
            u32 index = ((u16)tablePhase >> 4) * 2;
            FIELD(s32, object, 0x940) =
                (0x1000 - gFx32CosSinTable[index + 1]) >> 1;
        }

        void *owner = FIELD(void *, object, 0x48);
        FIELD(s32, owner, 0x1ac) = 41;
        s32 transform[3];
        VecFx32Object_Init(transform);
        transform[1] = FIELD(s32, object, 0x6c) - 0x80000;
        transform[2] = FIELD(s32, object, 0x70) + 0x1e000;
        if (FIELD(s32, object, 0x91c) > 0) {
            u32 index =
                ((u32)FIELD(s32, object, 0x934) >> 4) * 2;
            s32 rise =
                mul_fx(0x1000 - gFx32CosSinTable[index + 1], 0x46000);
            transform[2] =
                FIELD(s32, object, 0x70) + rise + 0x1e000;
        }
        VecFx32Object_Assign((u8 *)owner + 0x19c, transform);
        VecFx32Object_Destroy(transform);
    } else if (mode == 4) {
        func_ov041_022017f8(object, &requestedTurn, &maxTurn);
    } else if (mode == 6 || mode == 7) {
        func_ov041_02201b38(object, &requestedTurn, &maxTurn);
    } else if (mode == 11 || mode == 12) {
        func_ov041_02201e98(object, &requestedTurn, &maxTurn);
    } else if (mode == 3) {
        s32 state = FIELD(s32, object, 0x91c);
        if (state == 1) {
            s32 direction = FIELD(s32, object, 0x4b8) + 0xaa;
            if (direction > 0xff55) {
                direction = 0;
                FIELD(s32, object, 0x91c) = 3;
            }
            FIELD(s32, object, 0x4b8) = direction & 0xffff;
        } else if (state == 2) {
            s32 direction = FIELD(s32, object, 0x4b8) - 0xaa;
            if (direction < 0)
                direction += 0x10000;
            if (direction < 0xaa) {
                direction = 0;
                FIELD(s32, object, 0x91c) = 3;
            }
            FIELD(s32, object, 0x4b8) = direction & 0xffff;
        }
        if (func_ov041_022029cc(object)) {
            FIELD(s32, object, 0x920) = 4;
            FIELD(s32, object, 0x91c) = 1;
            FIELD(s32, object, 0x930) = 80;
            FIELD(s32, object, 0x934) = 0;
            func_ov041_02202a00(object);
            func_ov041_02202a3c(object);
        }
    } else if (mode == 14) {
        func_ov041_022025b0(object);
    }

    s32 substeps = 1;
    mode = FIELD(s32, object, 0x920);
    if (mode == 4 || mode == 6 || mode == 11) {
        void *view =
            FIELD(void *, FIELD(void *, object, 0x48), 0x14);
        FIELD(s32, object, 0x944) +=
            func_ov041_022009e8(view) == 0 ? 0x2800 : 0x2000;
        substeps = FIELD(s32, object, 0x944) >> 12;
        FIELD(s32, object, 0x944) -= substeps << 12;
    } else if (mode == 14 &&
               FIELD(s32, object, 0x91c) >= 10) {
        substeps = 0;
    }

    for (s32 step = substeps; step >= 0; --step) {
        void *recordZero = (u8 *)object + 0x68;
        for (s32 i = 90; i >= 2; --i) {
            func_ov041_021fec04((u8 *)recordZero + i * 12,
                                (u8 *)recordZero + (i - 1) * 12);
            FIELD(s32, object, 0x4b8 + i * 4) =
                FIELD(s32, object, 0x4b8 + (i - 1) * 4);
            FIELD(s32, object, 0x624 + i * 4) =
                FIELD(s32, object, 0x624 + (i - 1) * 4);
        }
        if (FIELD(s32, object, 0x928) != 0)
            func_ov041_02201784(object);

        if (requestedTurn != 0) {
            if (requestedTurn < -0x8000)
                requestedTurn += 0x10000;
            if (requestedTurn > 0x7fff)
                requestedTurn -= 0x10000;
            s32 amount = requestedTurn < 0 ? -requestedTurn : requestedTurn;
            if (amount < maxTurn)
                FIELD(s32, object, 0x4b8) += requestedTurn;
            else
                FIELD(s32, object, 0x4b8) +=
                    requestedTurn <= 0 ? -maxTurn : maxTurn;
            FIELD(s32, object, 0x4b8) &= 0xffff;
        }

        s32 vector[3];
        func_ov041_021fd000(vector);
        s32 remaining = 0x1000 - FIELD(s32, object, 0x624);
        s32 magnitude = mul_fx(remaining, 0x1800) + 0x99a;
        u32 index =
            (((u16)FIELD(s32, object, 0x4b8) >> 4) * 2);
        vector[1] = mul_fx(gFx32CosSinTable[index], magnitude);
        vector[2] = mul_fx(gFx32CosSinTable[index + 1], magnitude);
        FIELD(s32, object, 0x6c) += vector[1];
        FIELD(s32, object, 0x70) += vector[2];
    }

    mode = FIELD(s32, object, 0x920);
    if (mode == 4 || mode == 6 || mode == 11) {
        s32 ownerDelta =
            FIELD(s32, FIELD(void *, object, 0x48), 0x1b4);
        for (s32 i = 90; i >= 0; --i)
            FIELD(s32, object, 0x70 + i * 12) += ownerDelta;
    }
    func_ov041_02202adc(object);

    mode = FIELD(s32, object, 0x920);
    if (mode == 14 || mode == 8 || mode == 9 || mode == 10)
        return;
    void *owner = FIELD(void *, object, 0x48);
    void *view = FIELD(void *, owner, 0x14);
    s32 viewY = FIELD(s32, view, 0x15c);
    s32 below = 0;
    for (s32 i = 90; i >= 0; --i) {
        if (FIELD(s32, object, 0x70 + i * 12) < viewY)
            below++;
    }
    if (below == 0) {
        FIELD(s32, object, 0x920) = 0;
        if (FIELD(s32, owner, 0x1cc) == 2) {
            FIELD(s32, owner, 0x1cc) = 0;
            func_ov070_02210320(FIELD(void *, owner, 8));
        }
    }
}
