#include "tingle/types.h"

/* Overlay 35 senary burst-pair and periodic sprite spawning updates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov035_02203d20[];
extern const u8 data_ov035_02202bbc[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_0209189c(void *randomState, s32 first, s32 second);
extern s32 TitleRandom_NextBounded(void *randomState, s32 limit);
extern void func_ov035_02201d10(void *scene, s32 x, s32 y, s32 z,
                               s32 targetX, s32 targetY, s32 targetZ,
                               s32 targetScale, s32 resourceIndex);
extern void PresentationScalar_TransitionTo(void *field, s32 mode, s32 value);
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *resourceSet, void *resource);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *AlternateSpritePresentation_Init(void *allocation, void *spriteRecord);
extern void PresentationList_Append(void *collection, void *object);
extern void func_ov035_021fdd28(void *record, s32 identifier, s32 value20,
                               s32 value24, s32 value28, u8 value5a,
                               u16 flags);
extern void Presentation_SetPosition(void *object, s32 x, s32 y, s32 z);
extern void Presentation_SetScript(void *object, const void *animation, s32 loop);
extern void PresentationScalar_SetImmediate(void *field, s32 value);
#ifdef __cplusplus
}
#endif

/* Allocates one common sprite and attaches it to scene collection +0x10C. */
static void *allocate_sprite(void *scene, void *record)
{
    void *sprite = Heap_Alloc(0xa0, data_ov035_02203d20, 4, gHeapContext);
    if (sprite != 0)
        sprite = AlternateSpritePresentation_Init(sprite, record);
    PresentationList_Append((u8 *)scene + 0x10c, sprite);
    return sprite;
}

/*
 * Spawns one side-selected burst model plus a transient sprite. side zero uses
 * initial X=0xC00, model entry 0, negative +0x4C motion, and random targets in
 * the positive-X/negative-scale ranges; nonzero side mirrors those choices.
 * Once scene counter +0x164 reaches 0x2B, fixed target values replace most RNG
 * choices. The burst is created at (X,-0x800,-0x4000). Model +0x104 receives a
 * seven-frame +0x4C transition. A sprite from resource +0xE8 gets random ID
 * 0..7, random X/Y, Z=-0x3C00, non-looping data_ov035_02202bbc animation,
 * field +0x6C=0, and flag +0x88=1. There is no return value; RNG, heap,
 * transforms, animation, renderer, sound (through the burst spawner), and
 * scene state change.
 */
extern "C" void func_ov035_02201df8(void *scene, s32 side)
{
    s32 initialX = 0xc00;
    s32 modelMotion = 0x1800;
    s32 targetX;
    s32 targetScale;
    if (side == 0) {
        targetX = func_0209189c((u8 *)scene + 0xc0, 0x400, 0x800);
        targetScale = func_0209189c((u8 *)scene + 0xc0, -0x4000, 0);
        modelMotion = -0x1800;
    } else {
        initialX = -0xc00;
        targetX = func_0209189c((u8 *)scene + 0xc0, -0x400, -0x800);
        targetScale = func_0209189c((u8 *)scene + 0xc0, 0, 0x4000);
    }

    s32 targetY;
    s32 targetZ;
    if (FIELD(s32, scene, 0x164) >= 0x2b) {
        targetX = 0;
        targetY = -0x500;
        targetScale = 0x2000;
        targetZ = 0x800;
    } else {
        targetY = func_0209189c((u8 *)scene + 0xc0, -0x1000, 0);
        targetZ = 0;
    }
    func_ov035_02201d10(scene, initialX, -0x800, -0x4000,
                        targetX, targetY, targetZ, targetScale, side);

    void *model = FIELD(void *, scene, 0x104);
    PresentationScalar_TransitionTo((u8 *)model + 0x4c, 2, modelMotion);
    FIELD(s32, model, 0x7c) = 7;
    FIELD(s32, model, 0x80) = 0;

    void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0xf4),
                                  (u8 *)scene + 0xe8);
    void *sprite = allocate_sprite(scene, record);
    func_ov035_021fdd28(record,
                        TitleRandom_NextBounded((u8 *)scene + 0xc0, 8),
                        0, 0, 0, 7, 0x40);
    s32 x = func_0209189c((u8 *)scene + 0xc0, -0x1000, 0x1000);
    s32 y = func_0209189c((u8 *)scene + 0xc0, -0x1800, 0x1800);
    Presentation_SetPosition(sprite, x, y, -0x3c00);
    Presentation_SetScript(sprite, data_ov035_02202bbc, 0);
    PresentationScalar_SetImmediate((u8 *)sprite + 0x6c, 0);
    FIELD(s32, sprite, 0x88) = 1;
}

/*
 * Increments timer +0x160 and, every 30 calls, emits one sprite from resource
 * +0xDC. Its record receives random ID 0..1, value +0x5A=7, and flags 0x40.
 * A random branch starts the object at Y=+/-0xE00 with a mode-3 target of the
 * opposite sign (+/-0xA00); X is random in [-0x800,0x800), Z is zero, timing
 * is 30 frames, and flag +0x88 is set. There is no return value; timer, RNG,
 * heap, collection, transform, and animation state may change.
 */
extern "C" void func_ov035_02201fe4(void *scene)
{
    if (++FIELD(s32, scene, 0x160) < 30)
        return;
    FIELD(s32, scene, 0x160) = 0;

    void *record = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, scene, 0xf4),
                                  (u8 *)scene + 0xdc);
    void *sprite = allocate_sprite(scene, record);
    func_ov035_021fdd28(record,
                        TitleRandom_NextBounded((u8 *)scene + 0xc0, 2),
                        0, 0, 0, 7, 0x40);
    s32 x = func_0209189c((u8 *)scene + 0xc0, -0x800, 0x800);
    if (TitleRandom_NextBounded((u8 *)scene + 0xc0, 2) != 0) {
        PresentationScalar_SetImmediate((u8 *)sprite + 0x5c, 0x8000);
        Presentation_SetPosition(sprite, x, 0xe00, 0);
        PresentationScalar_TransitionTo((u8 *)sprite + 0x1c, 3, 0xa00);
    } else {
        Presentation_SetPosition(sprite, x, -0xe00, 0);
        PresentationScalar_TransitionTo((u8 *)sprite + 0x1c, 3, -0xa00);
    }
    FIELD(s32, sprite, 0x7c) = 30;
    FIELD(s32, sprite, 0x80) = 0;
    FIELD(s32, sprite, 0x88) = 1;
}
