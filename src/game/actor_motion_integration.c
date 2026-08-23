#include "tingle/types.h"

/* Integrate actor horizontal vectors, damping, and baseline-relative vertical motion. */
typedef struct MotionActorVTable {
    u8 field_00[0x8c];
    void (*land_8c)(void *);
    void (*accelerate_90)(void *, s32);
    u8 field_94[0x1c];
    s32 (*getGravityAcceleration_b0)(void *);
} MotionActorVTable;

#ifdef __cplusplus
extern "C" {
#endif
extern void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern void VecFx32Object_Destroy(void *);
extern s32 VecFx32Object_GetMagnitude(void *);
extern void VecFx32Object_Assign(void *, const void *);
extern void VecFx32Object_Add(void *, const void *);
extern void ActorRuntimeTriple_Assign(void *, s32, s32, s32);
extern s32 func_020adae4(s32, s32);
extern s32 func_020adc90(s32, s32);
extern void Actor_UpdateTerrainMotionFeedback(void *);
extern void func_020328d0(void *, s32);
#ifdef __cplusplus
}
#endif

static s32 multiplyFx(s32 a, s32 b)
{
    return (s32)(((s64)a * b + 0x800) >> 12);
}

/*
 * Copy position 0x18 to previous position 0x28 and optionally update terrain
 * toggle state for actor flag 0x100000. Skip integration while step state 0xac
 * is active. Flag 0x40 at word 0xd0 resets motion and vectors. Otherwise add
 * vector 0x38 directly, or with flag 0x10 accumulate 3/8 of fields 0x3c/0x40
 * into vector 0x88, normalize when squared length exceeds 0x10000, clear field
 * 0x44, and call vtable offset 0x90. Add/damp vector 0x88 with coefficients
 * 0xee1/0xf5c/0xfae. Normalize/add vector 0x98 when its magnitude is at least
 * 0x1000, otherwise clear it, then damp with 0x99a or 0xee1. Unless actor flag
 * 0x40 is set, process baseline 0x1dc: landing calls vtable 0x8c and clears
 * flags, airborne motion subtracts vtable-0xb0 gravity acceleration from FX32
 * vertical velocity, and Z is clamped not below baseline. Returns no value;
 * virtual callbacks own gameplay effects.
 */
void Actor_IntegrateMotion(void *self)
{
    u8 *actor = (u8 *)self;
    MotionActorVTable *vtable = *(MotionActorVTable **)actor;
    u32 flags;

    VecFx32Object_Assign(actor + 0x28, actor + 0x18);
    if (*(u32 *)(actor + 0x14) & 0x100000)
        Actor_UpdateTerrainMotionFeedback(actor);
    if (*(s16 *)(actor + 0xac) != 0xff)
        return;

    flags = *(u32 *)(actor + 0xd0);
    if (flags & 0x40) {
        *(s32 *)(actor + 0x3c) = 0;
        *(s32 *)(actor + 0x40) = 0;
        ActorRuntimeTriple_Assign(actor + 0x88, 0, 0, 0);
        if (actor[0x4d] != 1) {
            ActorRuntimeTriple_Assign(actor + 0x98, 0, 0, 0);
        } else if (*(s32 *)(actor + 0x44) <= 0 &&
                   *(s32 *)(actor + 0x24) == *(s32 *)(actor + 0x1dc)) {
            *(s32 *)(actor + 0xa4) = 0;
        } else {
            ActorRuntimeTriple_Assign(actor + 0x98, 0, 0, 0);
        }
        *(u32 *)(actor + 0xd0) &= ~0x40;
    }

    if (!(*(u32 *)(actor + 0xd0) & 0x10)) {
        VecFx32Object_Add(actor + 0x18, actor + 0x38);
        *(u32 *)(actor + 0xd0) &= ~0x20;
    } else {
        s32 x;
        s32 y;
        s32 lengthSquared;

        *(s32 *)(actor + 0x8c) +=
            func_020adae4(multiplyFx(*(s32 *)(actor + 0x3c), 0xc00), 2);
        *(s32 *)(actor + 0x90) +=
            func_020adae4(multiplyFx(*(s32 *)(actor + 0x40), 0xc00), 2);
        x = *(s32 *)(actor + 0x8c);
        y = *(s32 *)(actor + 0x90);
        lengthSquared = multiplyFx(x, x) + multiplyFx(y, y);
        if (lengthSquared > 0x10000) {
            *(s32 *)(actor + 0x8c) = func_020adae4(x << 16, lengthSquared);
            *(s32 *)(actor + 0x90) = func_020adae4(y << 16, lengthSquared);
        }
        *(s32 *)(actor + 0x44) = 0;
        vtable->accelerate_90(actor, 0);
    }

    VecFx32Object_Add(actor + 0x18, actor + 0x88);
    if (*(u32 *)(actor + 0xd0) & 0x10)
        func_020328d0(actor + 0x88, 0xfae);
    else if (*(s32 *)(actor + 0x24) == *(s32 *)(actor + 0x1dc))
        func_020328d0(actor + 0x88, 0xee1);
    else
        func_020328d0(actor + 0x88, 0xf5c);

    if (*(s32 *)(actor + 0x9c) || *(s32 *)(actor + 0xa0) ||
        *(s32 *)(actor + 0xa4)) {
        s32 magnitude = VecFx32Object_GetMagnitude(actor + 0x98);
        if (magnitude >= 0x1000) {
            *(s32 *)(actor + 0x9c) =
                func_020adc90(*(s32 *)(actor + 0x9c), magnitude);
            *(s32 *)(actor + 0xa0) =
                func_020adc90(*(s32 *)(actor + 0xa0), magnitude);
            *(s32 *)(actor + 0xa4) =
                func_020adc90(*(s32 *)(actor + 0xa4), magnitude);
            VecFx32Object_Add(actor + 0x18, actor + 0x98);
            func_020328d0(actor + 0x98,
                          *(s32 *)(actor + 0x24) ==
                                  *(s32 *)(actor + 0x1dc)
                              ? 0x99a
                              : 0xee1);
        } else {
            VecFx32Object_InitComponents(actor + 0x98, 0, 0, 0);
        }
    }

    if (!(*(u32 *)(actor + 0x14) & 0x40)) {
        s32 baseline = *(s32 *)(actor + 0x1dc);
        s32 z = *(s32 *)(actor + 0x24);

        if (z <= baseline && *(s32 *)(actor + 0x44) < 0) {
            s32 vertical = 0;
            if (*(u32 *)(actor + 0xd0) & 0x2000) {
                *(u32 *)(actor + 0xd0) &= ~0x2000;
                vertical = func_020adae4(*(s32 *)(actor + 0x44), -2);
            }
            *(s32 *)(actor + 0x44) = vertical;
            vtable->land_8c(actor);
            *(u32 *)(actor + 0xd0) &= ~2;
            *(u32 *)(actor + 0x14) &= ~0x20000000;
        } else if (z > baseline) {
            *(s32 *)(actor + 0x44) -=
                vtable->getGravityAcceleration_b0(actor);
        }
        if (*(s32 *)(actor + 0x24) < baseline)
            *(s32 *)(actor + 0x24) = baseline;
    }
}
