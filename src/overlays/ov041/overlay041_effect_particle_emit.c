#include "tingle/types.h"

/*
 * Overlay 41 incidental particle emission. This recovered frame helper chooses
 * mode-specific particles from the effect records and maintains a short
 * view-relative emission trail.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
u32 genrand_int32(void);
void func_ov004_021fb868(void *, s32, s32, s32);
}

/*
 * Emit particles through object+0x958 according to the active mode and frame
 * counter at object+0x93C. Modes other than 4,6,14 can emit type five from a
 * random low-valued record every other frame. Modes 4/6 emit type seven from a
 * random owner-adjusted record every fourth frame. Modes 8/9 emit type six
 * from record zero every sixteenth frame. A positive object+0x94C countdown
 * additionally emits type six at stored X and viewY-0x1E000 every sixteenth
 * frame. The function returns no value, consumes the PRNG on random paths, and
 * changes external particle state; particle meanings are inferred.
 */
extern "C" void func_ov041_02202adc(void *object)
{
    s32 mode = FIELD(s32, object, 0x920);
    s32 frame = FIELD(s32, object, 0x93c);
    void *emitter = FIELD(void *, object, 0x958);

    if (mode != 4 && mode != 6 && mode != 14 && (frame & 1) == 0) {
        s32 index = genrand_int32() % 91;
        if (FIELD(s32, object, 0x624 + index * 4) < 0x2bc) {
            func_ov004_021fb868(
                emitter, 5,
                FIELD(s32, object, 0x6c + index * 12) >> 12,
                FIELD(s32, object, 0x70 + index * 12) >> 12);
        }
    }
    if ((mode == 4 || mode == 6) && (frame & 3) == 0) {
        s32 index = genrand_int32() % 91;
        s32 worldY =
            FIELD(s32, object, 0x70 + index * 12) +
            FIELD(s32, FIELD(void *, object, 0x48), 0x194);
        func_ov004_021fb868(
            emitter, 7, FIELD(s32, object, 0x6c + index * 12) >> 12,
            worldY >> 12);
    }
    if ((mode == 8 || mode == 9) && (frame & 15) == 0) {
        s32 worldY =
            FIELD(s32, object, 0x70) +
            FIELD(s32, FIELD(void *, object, 0x48), 0x194) - 0x32000;
        func_ov004_021fb868(emitter, 6,
                            FIELD(s32, object, 0x6c) >> 12, worldY >> 12);
    }
    if (FIELD(s32, object, 0x94c) > 0) {
        FIELD(s32, object, 0x94c)--;
        if ((frame & 15) == 0) {
            void *view =
                FIELD(void *, FIELD(void *, object, 0x48), 0x14);
            func_ov004_021fb868(
                emitter, 6, FIELD(s32, object, 0x948) >> 12,
                (FIELD(s32, view, 0x15c) - 0x1e000) >> 12);
        }
    }
}
