#include "tingle/heap.h"
#include "tingle/types.h"

/* Overlay 17 per-frame input projection, grid interaction, effect spawning, and subsystem updates. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const s16 gFx32CosSinTable[];
extern const s32 data_ov017_02201414[];
extern const char data_ov017_022016c4[];
extern const char data_ov017_022016cc[];
extern u8 data_ov017_022016e0[];
extern u8 data_ov017_022016f0[];
extern u8 data_ov017_022016f8[];
extern u8 data_ov017_0220170c[];
extern u8 data_ov017_02201754[];
extern HeapContext gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GraphicsAnimationInstanceManager_CreateInstance(void *, void *);
extern s32 GraphicsAnimationInstance_GetSequenceDuration(void *);
extern void GraphicsAnimationInstanceManager_Update(void *);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern s32 func_0209189c(void *, s32, s32);
extern s32 TitleRandom_NextBounded(void *, s32);
extern void func_02092260(void *, s32);
extern void PresentationScalar_TransitionTo(void *, s32, s32);
extern void Presentation_SetPosition(void *, s32, s32, s32);
extern void PresentationList_Append(void *, void *);
extern void PresentationList_Remove(void *, void *);
extern void PresentationList_UpdateAndDeleteCompleted(void *);
extern void *AlternateSpritePresentation_Init(void *, void *);
extern void func_020958d8(void *);
extern s32 func_020befec(s32, s32);
extern void func_ov017_021fcf6c(void *);
extern void func_ov017_021fd6b0(void *, s32, s32, s32);
extern void *func_ov017_021fe190(void *, s32, s32, s32, s32, s16, s32);
extern void func_ov017_021fe5b0(void *);
extern void func_ov017_021fe894(void *);
extern void Overlay017_UpdatePaletteRamp(void *);
extern s32 Overlay017Timer_Tick(void *);
#ifdef __cplusplus
}
#endif

/* Divide a fixed coordinate by 0x100 with the truncation used by recovered code. */
static s32 coordinateToGrid(s32 value)
{
    return value / 0x100;
}

/*
 * Project input coordinates +0x34/+0x38 into the radius selected by global
 * +0x0C and publish them at global +0x30/+0x34. While input bit 4 and sprite-
 * pool phase 2 are active, deform the 9x9 grid for button bits 5/9, derive a
 * movement vector from the previous projected position, and optionally spawn
 * variant-0 particles. Walk the global effect list at +0x78: phase-2 effects
 * deform the grid, phase-6 effects are converted into variant-2 particles and
 * destroyed, and all others contribute their +0x9E value.
 *
 * Once progress reaches half its limit, emit event 0x4115 once and periodically
 * spawn 2D-backed actors; while the pool remains in phase 2, periodically spawn
 * additional variant-1 particles. Finally update both effect lists, the sprite
 * pool, UI objects, progress group, renderer, and deformation normals, then
 * tick two global cue timers and emit events 0x21/0x2A when they expire. Returns
 * void. Scene/global lists, heap, PRNG, audio/event, graphics, and grid state
 * change; the grid helper uses Nintendo DS square-root MMIO.
 */
extern "C" void func_ov017_02200188(void *state)
{
    u32 input = FIELD(u32, state, 0x20);
    s32 radius = data_ov017_02201414[
        FIELD(s32, data_ov017_022016e0, 0xc)];
    s32 inputActive = ((s32)(input << 27)) >> 31;
    void *node;

    FIELD(s32, data_ov017_022016e0, 4) = inputActive;
    FIELD(s32, data_ov017_022016e0, 0x30) = func_020befec(
        (FIELD(s32, state, 0x34) - 0x80) * radius,
        FIELD(s32, state, 0x3a4) - 0x80);
    FIELD(s32, data_ov017_022016e0, 0x34) = func_020befec(
        (FIELD(s32, state, 0x38) - 0x60) * radius,
        FIELD(s32, state, 0x3a8) - 0x60);
    FIELD(s32, data_ov017_022016e0, 0x54) = 0;
    FIELD(s32, data_ov017_022016e0, 0x58) = 0;

    if (inputActive != 0 &&
        FIELD(s32, FIELD(void *, state, 0x254), 0x30) == 2) {
        s32 button5 = ((s32)(input << 26)) >> 31;
        s32 button9 = ((s32)(input << 22)) >> 31;

        if (button5 != 0 || button9 != 0) {
            func_ov017_021fd6b0(
                FIELD(void *, state, 0x2c0),
                FIELD(s32, data_ov017_022016e0, 0x30) << 4,
                FIELD(s32, data_ov017_022016e0, 0x34) << 4, -0x40);
        }
        if (button5 == 0) {
            s32 currentX = FIELD(s32, data_ov017_022016e0, 0x30);
            s32 currentZ = FIELD(s32, data_ov017_022016e0, 0x34);
            s32 dx = currentX - FIELD(s32, state, 0x3b0);
            s32 dz = currentZ - FIELD(s32, state, 0x3b4);

            if ((dx < 0 ? -dx : dx) <= 1)
                FIELD(s32, data_ov017_022016e0, 0x30) =
                    FIELD(s32, state, 0x3b0);
            if ((dz < 0 ? -dz : dz) <= 1)
                FIELD(s32, data_ov017_022016e0, 0x34) =
                    FIELD(s32, state, 0x3b4);
            currentX = FIELD(s32, data_ov017_022016e0, 0x30);
            currentZ = FIELD(s32, data_ov017_022016e0, 0x34);

            if (currentX * currentX + currentZ * currentZ < radius * radius) {
                FIELD(s32, data_ov017_022016e0, 0x54) =
                    currentX - FIELD(s32, state, 0x3b0);
                FIELD(s32, data_ov017_022016e0, 0x58) =
                    currentZ - FIELD(s32, state, 0x3b4);
                if (button9 != 0 && FIELD(s32, state, 0x3f8) < 0x20 &&
                    (FIELD(u32, data_ov017_022016e0, 0) & 1)) {
                    void *effect = Heap_Alloc(
                        0xa0, data_ov017_022016c4, 4, &gHeapContext);
                    if (effect != 0) {
                        effect = func_ov017_021fe190(
                            effect, 0, currentX << 4, currentZ << 4, -0x80,
                            (s16)func_0209189c((u8 *)state + 0x3fc,
                                               0x20, 0x30),
                            TitleRandom_NextBounded((u8 *)state + 0x3fc, 0x1000) << 4);
                    }
                    PresentationList_Append((u8 *)state + 0x3ec, effect);
                }
            }
        }
        if ((u8 *)state + 0x3ac != data_ov017_0220170c) {
            FIELD(s32, state, 0x3b0) =
                FIELD(s32, data_ov017_022016e0, 0x30);
            FIELD(s32, state, 0x3b4) =
                FIELD(s32, data_ov017_022016e0, 0x34);
        }
    } else {
        FIELD(s32, data_ov017_022016e0, 0x30) = 0;
        FIELD(s32, data_ov017_022016e0, 0x34) = 0;
    }

    PresentationList_UpdateAndDeleteCompleted(data_ov017_02201754);
    FIELD(s32, state, 0x3d0) = 0;
    node = FIELD(void *, data_ov017_022016e0, 0x78);
    while (node != 0) {
        void *next = FIELD(void *, node, 8);
        s32 x = coordinateToGrid(FIELD(s32, node, 0x10));
        s32 y = coordinateToGrid(FIELD(s32, node, 0x20));
        s32 z = coordinateToGrid(FIELD(s32, node, 0x30));
        s32 phase = FIELD(s32, node, 0xb4);

        if (phase == 2)
            func_ov017_021fd6b0(FIELD(void *, state, 0x2c0), x, z, -0x80);
        if (phase == 6) {
            void *effect = Heap_Alloc(
                0xa0, data_ov017_022016c4, 4, &gHeapContext);
            if (effect != 0) {
                effect = func_ov017_021fe190(
                    effect, 2, x, z, y,
                    (s16)func_0209189c((u8 *)state + 0x3fc, 0x10, 0x18),
                    TitleRandom_NextBounded((u8 *)state + 0x3fc, 0x1000) << 4);
            }
            PresentationList_Append((u8 *)state + 0x3ec, effect);
            FIELD(s32, state, 0x3cc) += FIELD(u16, node, 0x9c);
            PresentationList_Remove(data_ov017_02201754, node);
            if (node != 0) {
                typedef void (*Destructor)(void *);
                FIELD(Destructor *, node, 0)[1](node);
            }
        } else {
            FIELD(s32, state, 0x3d0) += FIELD(u16, node, 0x9e);
        }
        node = next;
    }

    FIELD(s32, FIELD(void *, state, 0x25c), 0x64) =
        FIELD(s32, state, 0x3cc) + FIELD(s32, state, 0x3d0);
    Overlay017_UpdatePaletteRamp(state);
    PresentationList_UpdateAndDeleteCompleted((u8 *)state + 0x3ec);

    if (FIELD(s32, data_ov017_022016e0, 0) >=
        FIELD(s32, data_ov017_022016e0, 8) / 2) {
        if (FIELD(void *, state, 0x440) == 0) {
            func_02092260(state, 0x4115);
            FIELD(s32, state, 0x440) = 1;
        }
        if (++FIELD(s32, state, 0x3d4) > 8) {
            s32 angleIndex;
            s32 distance;
            s32 x;
            s32 z;
            void *sprite;
            void *actor;

            FIELD(s32, state, 0x3d4) = 0;
            angleIndex = TitleRandom_NextBounded((u8 *)state + 0x3fc, 0x1000);
            distance = TitleRandom_NextBounded((u8 *)state + 0x3fc, radius);
            x = coordinateToGrid(distance * gFx32CosSinTable[angleIndex * 2]);
            z = coordinateToGrid(distance * gFx32CosSinTable[angleIndex * 2 + 1]);
            sprite = GraphicsAnimationInstanceManager_CreateInstance(FIELD(void *, state, 0x244),
                                   (u8 *)state + 0x248);
            actor = Heap_Alloc(0xa0, data_ov017_022016cc, 4, &gHeapContext);
            if (actor != 0)
                actor = AlternateSpritePresentation_Init(actor, sprite);
            PresentationList_Append((u8 *)state + 0x3d8, actor);
            Presentation_SetPosition(actor, x, 0, z);
            PresentationScalar_TransitionTo((u8 *)actor + 0x1c, 2,
                          func_0209189c((u8 *)state + 0x3fc, 0x600, 0x900));
            FIELD(s32, actor, 0x7c) = (s16)GraphicsAnimationInstance_GetSequenceDuration(sprite);
            FIELD(s32, actor, 0x80) = 0;
            FIELD(s32, actor, 0x88) = 1;
            FIELD(u16, sprite, 0x50) |= 0x40;
            FIELD(u8, sprite, 0x5a) = 0x10;
            FIELD(u8, sprite, 0x59) = 3;
            if (func_0209189c((u8 *)state + 0x3fc, 0, 1) != 0)
                FIELD(u16, sprite, 0x50) |= 0x400;
        }

        if (FIELD(s32, FIELD(void *, state, 0x254), 0x30) == 2 &&
            ++FIELD(s32, state, 0x3e8) > 7) {
            s32 angleIndex;
            s32 distance;
            s32 x;
            s32 z;

            FIELD(s32, state, 0x3e8) = 0;
            angleIndex = TitleRandom_NextBounded((u8 *)state + 0x3fc, 0x1000);
            distance = TitleRandom_NextBounded((u8 *)state + 0x3fc, radius);
            x = coordinateToGrid(distance * gFx32CosSinTable[angleIndex * 2]);
            z = coordinateToGrid(distance * gFx32CosSinTable[angleIndex * 2 + 1]);
            if (FIELD(s32, state, 0x3f8) < 0x20) {
                void *effect = Heap_Alloc(
                    0xa0, data_ov017_022016c4, 4, &gHeapContext);
                if (effect != 0) {
                    effect = func_ov017_021fe190(
                        effect, 1, x, z, -0x80,
                        (s16)func_0209189c((u8 *)state + 0x3fc,
                                           0x10, 0x18),
                        angleIndex << 4);
                }
                PresentationList_Append((u8 *)state + 0x3ec, effect);
            }
        }
    }

    PresentationList_UpdateAndDeleteCompleted((u8 *)state + 0x3d8);
    func_ov017_021fe5b0(FIELD(void *, state, 0x254));
    func_020958d8((u8 *)state + 0x12c);
    func_020958d8((u8 *)state + 0x80);
    func_ov017_021fe894(FIELD(void *, state, 0x25c));
    GraphicsAnimationInstanceManager_Update(FIELD(void *, state, 0x244));
    GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0x58));
    func_ov017_021fcf6c(FIELD(void *, state, 0x2c0));
    if (Overlay017Timer_Tick(data_ov017_022016f0))
        func_02092260(state, 0x21);
    if (Overlay017Timer_Tick(data_ov017_022016f8))
        func_02092260(state, 0x2a);
}
