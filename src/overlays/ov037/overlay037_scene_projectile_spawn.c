#include "tingle/types.h"

/* Overlay 37 randomized projectile/model spawning into the secondary child container. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021feec0[];
extern const s16 gFx32CosSinTable[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern s32 func_0209189c(void *randomState, s32 minimum, s32 maximum);
extern s32 TitleRandom_NextBounded(void *randomState, s32 bound);
extern void *func_ov037_021fd554(void *object, void *owner, s32 offset);
extern void func_02094bf0(void *object, s32 x, s32 y, s32 z);
extern void PresentationScalar_SetImmediate(void *field, s32 value, ...);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void func_ov037_021fdf50(void *object, s32 lifetime);
extern void PresentationList_Append(void *container, void *object);
#ifdef __cplusplus
}
#endif

static s32 fixedMul15(s16 value, s32 scale)
{
    /* The original signed multiply/shift sequence truncates toward zero. */
    return ((s32)value * scale) / 0x8000;
}

/*
 * Allocates a 0xC8-byte specialized render object, assigns randomized angular
 * offsets, selects one of seven weighted texture/scale pairs, derives position
 * and motion from the shared sine/cosine table, gives it a 90..119 frame
 * lifetime, and registers it in the secondary container at +0x13C. Returns
 * nothing; heap, RNG, object animation, and container ownership change. The
 * weighting (1,2,3,4,5,6,7 outcomes) is confirmed by the 28-entry jump table.
 */
extern "C" void func_ov037_021fdf68(void *scene)
{
    void *randomState = (u8 *)scene + 0xbc;
    void *object = Heap_Alloc(0xc8, data_ov037_021feec0, 4, gHeapContext);
    if (object != 0) {
        s32 offset = func_0209189c(randomState, -0x800, 0x800);
        object = func_ov037_021fd554(object, FIELD(void *, scene, 0x110), offset);
    }

    s32 angle = func_0209189c(randomState, 0x740, 0x8c0) << 4;
    s32 secondAngle = TitleRandom_NextBounded(randomState, 0x1000) << 4;
    func_02094bf0(object, 0, secondAngle, -angle);

    s32 choice = TitleRandom_NextBounded(randomState, 0x1c);
    u16 texture;
    s32 scale;
    if (choice >= 21) {
        texture = 0x074c; scale = 0x00cd;
    } else if (choice >= 15) {
        texture = 0x6b21; scale = 0x00f6;
    } else if (choice >= 10) {
        texture = 0x0757; scale = 0x011f;
    } else if (choice >= 6) {
        texture = 0x1859; scale = 0x0148;
    } else if (choice >= 3) {
        texture = 0x4c59; scale = 0x0171;
    } else if (choice >= 1) {
        texture = 0x01fd; scale = 0x019a;
    } else {
        texture = 0x4e73; scale = 0x01c3;
    }
    FIELD(u16, object, 0xbc) = texture;
    FIELD(u16, object, 0xc0) = texture;
    FIELD(s32, object, 0xa4) = 1;
    PresentationScalar_SetImmediate((u8 *)object + 0x6c, scale, 1);

    s32 tableIndex = (angle >> 4) * 2;
    s16 sine = gFx32CosSinTable[tableIndex];
    s16 cosine = gFx32CosSinTable[tableIndex + 1];
    s32 depth = func_0209189c(randomState, -0xc00, -0x200);
    Presentation_SetPosition(object, fixedMul15(sine, 0x180),
                   fixedMul15(cosine, 0x180) + 0x3000, depth);
    PresentationScalar_TransitionTo((u8 *)object + 0x0c, 1, fixedMul15(sine, 0x380));
    PresentationScalar_TransitionTo((u8 *)object + 0x1c, 1,
                  fixedMul15(cosine, 0x380) + 0x3000);
    func_ov037_021fdf50(object, func_0209189c(randomState, 0x5a, 0x78));
    FIELD(s32, object, 0x88) = 1;
    PresentationList_Append((u8 *)scene + 0x13c, object);
}
