#include "tingle/types.h"

/*
 * Overlay 41 effect record helpers. These recovered utilities query completion,
 * choose random targets, convert all record Y coordinates between local and
 * owner-relative spaces, and generate a triangular steering perturbation.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 genrand_int32(void);

/*
 * Return one only when every one of the 91 values beginning at object+0x624 is
 * at least 0x1000; otherwise return zero. No state or SDK facilities change.
 */
extern "C" s32 func_ov041_022029cc(void *object)
{
    for (s32 i = 90; i >= 0; --i) {
        if (FIELD(s32, object, 0x624 + i * 4) < 0x1000)
            return 0;
    }
    return 1;
}

/*
 * Replace object+0x4B0/0x4B4 with a random fixed-point target. X ranges from
 * 78 through 177 and Y from -100 through -21, both scaled by 0x1000. The
 * global PRNG is consumed twice; no value is returned.
 */
extern "C" void func_ov041_02202a00(void *object)
{
    FIELD(s32, object, 0x4b0) = ((s32)(genrand_int32() % 100) + 78) << 12;
    FIELD(s32, object, 0x4b4) = ((s32)(genrand_int32() % 80) - 100) << 12;
}

/*
 * Subtract the owning context's Y offset at owner+0x194 from all 91 record Y
 * coordinates, converting the observed array to owner-local space. No value
 * is returned and no hardware or SDK state changes.
 */
extern "C" void func_ov041_02202a3c(void *object)
{
    s32 ownerY = FIELD(s32, FIELD(void *, object, 0x48), 0x194);
    for (s32 i = 90; i >= 0; --i)
        FIELD(s32, object, 0x70 + i * 12) -= ownerY;
}

/*
 * Add the owning context's Y offset at owner+0x194 to all 91 record Y
 * coordinates, reversing func_ov041_02202a3c's observed conversion. No value
 * is returned and no hardware or SDK state changes.
 */
extern "C" void func_ov041_02202a70(void *object)
{
    s32 ownerY = FIELD(s32, FIELD(void *, object, 0x48), 0x194);
    for (s32 i = 90; i >= 0; --i)
        FIELD(s32, object, 0x70 + i * 12) += ownerY;
}

/*
 * Return a triangular perturbation derived from object+0x934 modulo 80:
 * residues zero through 40 rise from -200 to 200 and the remainder mirrors
 * downward. Increment object+0x934 after sampling. No SDK or hardware effects
 * occur.
 */
extern "C" s32 func_ov041_02202aa4(void *object)
{
    s32 phase = FIELD(s32, object, 0x934) % 80;
    if (phase >= 40)
        phase = 80 - phase;
    FIELD(s32, object, 0x934)++;
    return (phase - 20) * 10;
}
