#include "tingle/types.h"

/* Overlay 17 effect motion integration, boundary reflection, peer separation, attraction, and speed limiting. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 gFx32CosSinTable[];
extern const s32 data_ov017_02201414[];
extern u8 data_ov017_022016e0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void PresentationScalar_SetImmediate(void *, s32);
extern s32 func_020adc90(s32, s32);
extern u16 func_020ae024(s32, s32);
extern s32 func_020befec(s32, s32);
extern s32 Overlay017_WaitForSquareRoot(void);
#ifdef __cplusplus
}
#endif

/* Multiply two signed 20.12 fixed-point values with the recovered rounding. */
static s32 fxMul(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/* Submit a non-negative squared distance to the DS square-root unit. */
static s32 hardwareSqrt(s32 squared)
{
    volatile u8 *regs = (volatile u8 *)0x040002b0;
    *(volatile u16 *)regs = 1;
    *(volatile s32 *)(regs + 8) = squared;
    *(volatile s32 *)(regs + 0xc) = squared >> 31;
    return Overlay017_WaitForSquareRoot();
}

/*
 * Integrate X/Z velocities +0xA8/+0xB0 into position components +0x0C/+0x2C,
 * accumulate quarter-velocity terms into +0xDC/+0xE4, and damp both velocities
 * by 0xFD7/0x1000. Reflect motion when the integer position exceeds the radius
 * selected by global index +0xC minus object radius +0xA4. Otherwise traverse
 * the peer list at global +0x78, adding separation impulses for overlapping
 * peers, and apply the optional global +0x54/+0x58 attraction when within
 * squared distance 0x900 of global +0x30/+0x34. Finally clamp velocity magnitude
 * to 0x2000. Object/component state changes, peer/global state is read, SDK math
 * helpers run, and the DS square-root MMIO registers are used directly.
 */
extern "C" void Overlay017_UpdateEffectMotion(void *state)
{
    s32 vx = FIELD(s32, state, 0xa8);
    s32 vz = FIELD(s32, state, 0xb0);
    s32 x;
    s32 z;
    s32 distanceSquared;

    PresentationScalar_SetImmediate((u8 *)state + 0xc, FIELD(s32, state, 0x10) + vx);
    PresentationScalar_SetImmediate((u8 *)state + 0x2c, FIELD(s32, state, 0x30) + vz);
    FIELD(s32, state, 0xdc) += vx / 4;
    FIELD(s32, state, 0xe4) += vz / 4;
    vx = fxMul(vx, 0xfd7);
    vz = fxMul(vz, 0xfd7);
    FIELD(s32, state, 0xa8) = vx;
    FIELD(s32, state, 0xb0) = vz;

    x = FIELD(s32, state, 0x10) / 0x1000;
    z = FIELD(s32, state, 0x30) / 0x1000;
    distanceSquared = x * x + z * z;
    {
        s32 boundary = data_ov017_02201414[
            FIELD(s32, data_ov017_022016e0, 0xc)] -
            FIELD(s32, state, 0xa4);
        if (distanceSquared > boundary * boundary) {
            u16 angle = func_020ae024(x, z) + 0x4000;
            s32 index = angle >> 4;
            s32 nx = gFx32CosSinTable[index * 2];
            s32 nz = gFx32CosSinTable[index * 2 + 1];
            s32 projection = fxMul(nx, vx) + fxMul(nz, vz);
            vx += (fxMul(nx, projection) - vx) * 2;
            vz += (fxMul(nz, projection) - vz) * 2;
            FIELD(s32, state, 0xa8) = vx;
            FIELD(s32, state, 0xb0) = vz;
            PresentationScalar_SetImmediate((u8 *)state + 0xc,
                          FIELD(s32, state, 0x10) + vx);
            PresentationScalar_SetImmediate((u8 *)state + 0x2c,
                          FIELD(s32, state, 0x30) + vz);
        } else {
            void *peer = FIELD(void *, data_ov017_022016e0, 0x78);
            while (peer != 0) {
                if (peer != state) {
                    s32 peerDx = x - FIELD(s32, peer, 0x10) / 0x1000;
                    s32 peerDz = z - FIELD(s32, peer, 0x30) / 0x1000;
                    s32 squared = peerDx * peerDx + peerDz * peerDz;
                    s32 radii = FIELD(s32, state, 0xa4) +
                                FIELD(s32, peer, 0xa4);
                    if (squared > 0 && squared <= radii * radii) {
                        s32 length = hardwareSqrt(squared);
                        vx += (func_020befec(peerDx << 12, length)) / 32;
                        vz += (func_020befec(peerDz << 12, length)) / 32;
                        FIELD(s32, state, 0xa8) = vx;
                        FIELD(s32, state, 0xb0) = vz;
                    }
                }
                peer = FIELD(void *, peer, 8);
            }
        }
    }

    if (FIELD(void *, data_ov017_022016e0, 4) != 0) {
        s32 dx = x - FIELD(s32, data_ov017_022016e0, 0x30);
        s32 dz = z - FIELD(s32, data_ov017_022016e0, 0x34);
        s32 squared = dx * dx + dz * dz;
        if (squared <= 0x900) {
            s32 length = squared > 0 ? hardwareSqrt(squared) : 1;
            vx += func_020befec(
                      FIELD(s32, data_ov017_022016e0, 0x54) << 12, length) /
                  8;
            vz += func_020befec(
                      FIELD(s32, data_ov017_022016e0, 0x58) << 12, length) /
                  8;
            FIELD(s32, state, 0xa8) = vx;
            FIELD(s32, state, 0xb0) = vz;
        }
    }

    distanceSquared = vx * vx + vz * vz;
    {
        s32 speed = hardwareSqrt(distanceSquared);
        if (speed > 0x2000) {
            s32 scale = func_020adc90(0x2000, speed);
            FIELD(s32, state, 0xa8) = fxMul(vx, scale);
            FIELD(s32, state, 0xb0) = fxMul(vz, scale);
        }
    }
}
