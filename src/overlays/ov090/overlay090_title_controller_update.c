#include "tingle/display_controller.h"
#include "tingle/game_work.h"
#include "tingle/actor_motion.h"
#include "tingle/game_phase_runtime.h"
#include "tingle/graphics_sprite_renderer.h"
#include "tingle/graphics_sprite_state.h"
#include "tingle/heap.h"
#include "tingle/overlay_manager.h"
#include "tingle/scene.h"
#include "tingle/types.h"
#include "tingle/vec_fx32.h"
#include "tingle/vec_fx32_triple.h"

/* Canonical per-frame state machine for the retail overlay-90 boss-stage controller. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))
#define TITLE_STATE(self) FIELD(u8, self, 0x1ec)
#define TITLE_TIMER(self) FIELD(u16, self, 0x1f0)
#define TITLE_PARTICIPANT(self, index) FIELD(void *, self, 0x1f4 + (index) * 4)
#define TITLE_SPRITE(self) FIELD(GraphicsSpriteState *, self, 0x200)

/*
 * Retail C uses an empty parameter list for calls whose types have not yet
 * been recovered. The host wrapper compiles this unit as C++, where the same
 * spelling incorrectly means that the function accepts no arguments.
 */
#ifdef __cplusplus
#define UNKNOWN_PARAMETERS ...
#else
#define UNKNOWN_PARAMETERS
#endif

typedef void (*TitleActorModeMethod)(void *actor, s32 mode);
typedef void (*TitleActorNoArgMethod)(void);
typedef void (*TitleControllerStateMethod)(void *self, s32 value);

extern u8 *data_021052fc;
extern void *gSoundContext;
extern void *gDebugFont;
extern u8 data_020f4e14[];
extern const s16 data_020c9670[];
extern const char data_ov090_0221cc08[];
extern const char data_ov090_0221cc10[];
extern DisplayBrightnessPair gDisplayBrightnessPair;

extern void GX_HBlankIntr(UNKNOWN_PARAMETERS);
extern void GX_VBlankIntr(UNKNOWN_PARAMETERS);
extern void *RuntimePresentationManager_GetGraphics3dPresentation(UNKNOWN_PARAMETERS);
extern void Actor_PlayHorizontalSpatialSound(void *actor, u32 packedSound, s32 pitch);
extern void func_0204d308(UNKNOWN_PARAMETERS);
extern void Sound_StopAllDirectSequences(UNKNOWN_PARAMETERS);
extern void Sound_PlayDirectSequence(UNKNOWN_PARAMETERS);
extern void Sound_PlayEffectWithParameters(UNKNOWN_PARAMETERS);
extern void Sound_StopEffect(UNKNOWN_PARAMETERS);
extern void Sound_FadeEffectVolume(UNKNOWN_PARAMETERS);
extern void Sound_StopStream(UNKNOWN_PARAMETERS);
extern void func_0209a748(UNKNOWN_PARAMETERS);
extern void func_020a2844(UNKNOWN_PARAMETERS);
extern void func_020a28e0(UNKNOWN_PARAMETERS);
extern void func_020a29ac(UNKNOWN_PARAMETERS);
extern void func_020a63d0(UNKNOWN_PARAMETERS);
extern void func_020a6404(UNKNOWN_PARAMETERS);
extern void func_020a6548(UNKNOWN_PARAMETERS);
extern void func_020a68fc(UNKNOWN_PARAMETERS);
extern s32 func_020befec(s32 numerator, s32 denominator);
extern u64 func_020bf1f8(u32 value, u32 divisor);
extern void func_ov060_0220fd54(UNKNOWN_PARAMETERS);
extern void func_ov063_02210314(UNKNOWN_PARAMETERS);
extern void func_ov077_02215444(UNKNOWN_PARAMETERS);
extern void func_ov090_0221a3cc(UNKNOWN_PARAMETERS);
extern void func_ov090_0221a3dc(UNKNOWN_PARAMETERS);
extern void func_ov090_0221a420(UNKNOWN_PARAMETERS);
extern void func_ov090_0221a460(UNKNOWN_PARAMETERS);
extern void func_ov090_0221a498(UNKNOWN_PARAMETERS);
extern void func_ov090_0221a8bc(UNKNOWN_PARAMETERS);
extern u32 func_ov090_0221aab8(UNKNOWN_PARAMETERS);
extern void func_ov090_0221ab4c(UNKNOWN_PARAMETERS);
extern void func_ov090_0221ad64(UNKNOWN_PARAMETERS);
extern void func_ov090_0221ae1c(UNKNOWN_PARAMETERS);
extern void func_ov090_0221b280(UNKNOWN_PARAMETERS);
extern void func_ov090_0221b428(UNKNOWN_PARAMETERS);
extern void func_ov090_0221b7f8(UNKNOWN_PARAMETERS);
extern u32 genrand_int32(void);
extern void Actor_SetDirectionFromVector(void *actor, s32 x, s32 y);
extern void ActorDerivedType1_StartRecord(void *actor, s32 record);
extern void ActorDerivedType1_TeardownActiveRecord(void *actor);
extern void Type7Actor_SetMotionTargetWithTimer(void *actor,
                                                const void *position,
                                                s32 timer);
extern void Type7Actor_SetFlag40StateEnabled(void *actor, s32 enabled);
extern void *AuxiliaryTimedSpritePresentation_Init(void *allocation, ...);
extern void Sound_Play(void *context, s32 channel, s32 soundId);

/* Expand retail vtable dispatches at their original controller call sites. */
#define TITLE_ACTOR_SET_MODE(actor, mode)                                      \
    ((TitleActorModeMethod)FIELD(void *, FIELD(void *, actor, 0), 0x54))(      \
        actor, mode)
#define TITLE_ACTOR_CALL_SLOT_5C(actor)                                        \
    ((TitleActorNoArgMethod)FIELD(void *, FIELD(void *, actor, 0), 0x5c))()

/* Store one scale value in the paired +0x32/+0x34 sprite fields. */
#define TITLE_SPRITE_SET_SCALE(sprite, scale)                                  \
    do {                                                                       \
        void *titleScaleSprite = (sprite);                                     \
        s32 titleScaleValue = (scale);                                         \
        FIELD(s16, titleScaleSprite, 0x32) = (s16)titleScaleValue;              \
        FIELD(s16, titleScaleSprite, 0x34) = (s16)titleScaleValue;              \
    } while (0)

/*
 * Execute the retail boss-stage sequence's 0x00..0x20 switch. This is a direct
 * reconstruction of the ROM path: display interrupt gates, brightness fades,
 * participant/camera motion, audio, effects, and terminal transitions retain
 * their original state numbers, frame thresholds, offsets, and SDK calls.
 */
void func_ov090_02217d70(void *self)
{
    u8 *runtime = data_021052fc;
    void *primaryActor;
    void *secondaryActor;
    void *scene;
    s32 i;

    ActorMotionAreaFollower_BindActor(
        (ActorMotion *)(runtime + 0x2fbc), self);
    ActorMotion_BindActor((ActorMotion *)(runtime + 0x3044), self);
    func_0204d308(self);
    primaryActor = FIELD(void *, runtime, 0x2ea4);
    secondaryActor = FIELD(void *, runtime, 0x2ea8);
    scene = SceneManager_GetCurrent(gSceneManager);
    if (FIELD(s32, scene, 4) == 2)
        return;
    scene = SceneManager_GetCurrent(gSceneManager);

    switch (TITLE_STATE(self)) {
    case 0: {
        void *resource;

        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x3f);
        resource = Heap_Alloc(0x58, data_ov090_0221cc08, 4, &gHeapContext);
        if (resource != 0)
            func_ov060_0220fd54(resource, self, 1);
        func_ov090_0221a3cc((u8 *)self + 0x18, 0x200000, 0x208000,
                            0x60000);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)self + 0x18));
        TITLE_ACTOR_SET_MODE(primaryActor, 0);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)primaryActor + 0x18),
                             (VecFx32Object *)((u8 *)self + 0x18));
        GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 1);
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), 0x100);
        if (secondaryActor != 0) {
            VecFx32Object position;

            FIELD(u32, secondaryActor, 0x10) |= 0x100;
            VecFx32Object_InitComponents(&position, 0x220000, 0x28a000, 0);
            VecFx32Object_Assign(
                (VecFx32Object *)((u8 *)secondaryActor + 0x18), &position);
            Type7Actor_SetFlag40StateEnabled(secondaryActor, 1);
            VecFx32Object_Destroy(&position);
        }
        TITLE_STATE(self) = 1;
        break;
    }
    case 1:
        GX_VBlankIntr(0);
        GX_HBlankIntr(0);
        func_020a6404(FIELD(void *, scene, 0x24));
        GX_VBlankIntr(1);
        GX_HBlankIntr(1);
        TITLE_STATE(self) = 2;
        for (i = 0; i < 3; i++) {
            void *actor = TITLE_PARTICIPANT(self, i);
            FIELD(u32, actor, 0x14) |= 0x80;
            FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 0;
            FIELD(u32, FIELD(void *, actor, 0x29c), 0x14) |= 0x80;
            FIELD(u8, FIELD(void *, FIELD(void *, actor, 0x29c), 0x54),
                  0x3a) = 1;
        }
        TITLE_TIMER(self) = 0;
        GX_VBlankIntr(0);
        GX_HBlankIntr(0);
        func_0209a748(RuntimePresentationManager_GetGraphics3dPresentation(runtime + 0x2f7c), 2);
        GX_VBlankIntr(1);
        GX_HBlankIntr(1);
        DisplayBrightness_StartTransition(
            DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 0), 16,
            0, 0x40);
        DisplayBrightness_StartTransition(
            DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1), 16,
            0, 0x40);
        break;
    case 2: {
        VecFx32Object first;
        VecFx32Object second;
        VecFx32Object third;
        VecFx32Object evaluated;
        VecFx32Triple curve;
        s32 scale = FIELD(s16, TITLE_SPRITE(self), 0x32) - 4;

        if (scale < 0x80)
            scale = 0x80;
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), scale);
        VecFx32Object_InitComponents(&first, 0x200000, 0x208000, 0x60000);
        VecFx32Object_InitComponents(&second, 0x200000, 0x21c000, 0);
        VecFx32Object_InitComponents(&third, 0x200000, 0x21c000, 0x3c000);
        func_ov090_0221a3dc(&curve, &first, &second, &third);
        VecFx32Bezier_Evaluate3D(
            &evaluated, &curve,
            func_020befec((s32)TITLE_TIMER(self) << 12, 0x1e));
        VecFx32Object_Assign(
            (VecFx32Object *)((u8 *)primaryActor + 0x18), &evaluated);
        VecFx32Object_Destroy(&evaluated);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (TITLE_TIMER(self) > 0x1d) {
            void *effect;

            TITLE_STATE(self) = 3;
            func_ov090_0221ad64(self, 0x109d, 0x1001, 0x109e);
            FIELD(u16, TITLE_SPRITE(self), 0x24) |= 2;
            FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~1;
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 0);
            TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), 0x100);
            TITLE_TIMER(self) = 0;
            effect = Heap_Alloc(0x14, data_ov090_0221cc10, 4,
                                &gHeapContext);
            if (effect != 0)
                AuxiliaryTimedSpritePresentation_Init(effect, (u8 *)primaryActor + 0x18,
                              FIELD(void *, FIELD(void *, primaryActor, 0x54),
                                    0),
                              0x162b, 0x162c, 0x162d, 0, 4, -1, 1);
            ActorMotionJitter_EnsureMinimum((ActorMotionJitter *)(runtime + 0x2fbc), 0x2d, 2);
            Sound_PlayEffectWithParameters(gSoundContext, 0x142, 10, 0x40, 0, 0);
        }
        VecFx32Triple_Destroy(&curve);
        VecFx32Object_Destroy(&third);
        VecFx32Object_Destroy(&second);
        VecFx32Object_Destroy(&first);
        break;
    }
    case 3:
        if (TITLE_TIMER(self) > 0x5a) {
            FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~3;
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 1);
            TITLE_STATE(self) = 4;
            if (secondaryActor != 0) {
                VecFx32Object position;

                Type7Actor_SetFlag40StateEnabled(secondaryActor, 0);
                VecFx32Object_InitComponents(&position, 0x220000, 0x22b000,
                                              0);
                Type7Actor_SetMotionTargetWithTimer(secondaryActor, &position, 0xf0);
                VecFx32Object_Destroy(&position);
            }
        }
        break;
    case 4:
        if ((FIELD(u16, TITLE_SPRITE(self), 0x24) & 1) != 0) {
            TITLE_STATE(self) = 5;
            func_ov090_0221ad64(self, 0x1000, 0x1001, 0x1002);
            FIELD(u16, TITLE_SPRITE(self), 0x24) |= 2;
            FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~1;
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 8);
            TITLE_TIMER(self) = 0;
        }
        break;
    case 5: {
        u16 timer = TITLE_TIMER(self);

        if (timer > 0x10) {
            FIELD(s32, self, 0x214) = 0x100000;
            FIELD(s32, self, 0x21c) += 2;
            if (FIELD(s32, self, 0x21c) > 0x19a)
                FIELD(s32, self, 0x21c) = 0x19a;
        }
        if (timer == 8)
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 9);
        else if (timer == 0x10)
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 10);
        else if (timer == 0x14)
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 0xb);
        else if (timer == 0x18)
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 0xc);
        else if (timer > 0x77) {
            func_ov090_0221ad64(self, -1, -1, -1);
            TITLE_STATE(self) = 6;
            TITLE_ACTOR_SET_MODE(primaryActor, 1);
            Actor_SetDirectionFromVector(primaryActor, 0, -0x1000);
            TITLE_ACTOR_CALL_SLOT_5C(primaryActor);
            TITLE_TIMER(self) = 0;
            ActorMotionJitter_EnsureMinimum((ActorMotionJitter *)(runtime + 0x2fbc), 300, 2);
            Sound_Play(gSoundContext, 0x142, 0xb);
            FIELD(u8, scene, 0x54) |= 2;
        }
        break;
    }
    case 6:
        if (TITLE_TIMER(self) == 0x78) {
            FIELD(u32, scene, 0x50) =
                ((FIELD(u32, scene, 0x50) & ~1u) | 1) & 0xffff8001 | 6;
            FIELD(u8, scene, 0x54) &= ~1;
            Sound_FadeEffectVolume(gSoundContext, 0x142, 0xb, 0x30, 0x3c);
            if (secondaryActor != 0)
                Type7Actor_SetFlag40StateEnabled(secondaryActor, 1);
        }
        if ((TITLE_TIMER(self) % 0x2d) == 0) {
            s32 participant = TITLE_TIMER(self) / 0x2d - 1;
            if (participant < 3) {
                void *actor = TITLE_PARTICIPANT(self, participant);
                FIELD(u16, actor, 0x2f2) =
                    (FIELD(u16, actor, 0x2f2) & ~1) | 1;
                FIELD(u16, actor, 0x2fe) = 0x20;
                FIELD(u16, actor, 0x300) = 0;
                FIELD(u16, actor, 0x2f2) =
                    (FIELD(u16, actor, 0x2f2) & ~0x30) | 0x10;
            } else {
                TITLE_STATE(self) = 7;
                TITLE_TIMER(self) = 0;
                for (i = 0; i < 3; i++) {
                    void *actor = TITLE_PARTICIPANT(self, i);
                    FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 1;
                    FIELD(u8, FIELD(void *, FIELD(void *, actor, 0x29c), 0x54),
                          0x3a) = 1;
                }
            }
        }
        break;
    case 7:
        if ((FIELD(u8, scene, 0x54) & 1) != 0) {
            Sound_FadeEffectVolume(gSoundContext, 0x142, 0xb, 0, 0x3c);
            func_ov090_0221b7f8(self, 0x10);
            FIELD(u8, scene, 0x54) &= ~2;
            FIELD(u32, scene, 0x50) &= ~1u;
            TITLE_TIMER(self) = 0;
            TITLE_STATE(self) = 8;
            for (i = 0; i < 3; i++)
                func_ov077_02215444(TITLE_PARTICIPANT(self, i));
        }
        break;
    case 8:
        GX_VBlankIntr(0);
        GX_HBlankIntr(0);
        func_020a6548(FIELD(void *, scene, 0x24));
        func_020a68fc(FIELD(void *, scene, 0x24),
                      GameWork_TestFlag(gGameWork, 0x17e) ? 0x31 : 0x30, 0);
        GX_VBlankIntr(1);
        GX_HBlankIntr(1);
        Sound_Play(gSoundContext, 0, 0x6f);
        TITLE_STATE(self) = 9;
        break;
    case 9:
        if (FIELD(s16, FIELD(void *, FIELD(void *, scene, 0x24), 0x4a4),
                  4) == 1) {
            TITLE_TIMER(self) = 0;
            TITLE_STATE(self) = 10;
            func_020a63d0(FIELD(void *, scene, 0x24), -1);
            Sound_Play(gSoundContext, 0, 0x3a);
        }
        break;
    case 10:
        Sound_StopEffect(gSoundContext, 0x142, 0xb);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (FIELD(s32, self, 0x214) < 0x21c000)
            FIELD(s32, self, 0x214) = 0x21c000;
        FIELD(s32, self, 0x21c) += 4;
        if (FIELD(s32, self, 0x21c) > 0x1000)
            FIELD(s32, self, 0x21c) = 0x1000;
        if (TITLE_TIMER(self) > 0x3c) {
            TITLE_TIMER(self) = 0;
            TITLE_STATE(self) = 0xb;
            FIELD(u32, primaryActor, 0x230) |= 4;
            GameWork_SetFlag(gGameWork, 0x3ec);
            GX_VBlankIntr(0);
            GX_HBlankIntr(0);
            func_ov063_02210314(scene);
            Scene_ClearFlag02((Scene *)scene);
            GX_VBlankIntr(1);
            GX_HBlankIntr(1);
            FIELD(s32, gDebugFont, 0x38) = 0;
            GraphicsSpriteRenderer_SetTextGridPosition(
                (GraphicsSpriteRenderer *)FIELD(void *, data_020f4e14, 0), 0,
                0xaa);
            for (i = 0; i < 3; i++)
                FIELD(u16, TITLE_PARTICIPANT(self, i), 0x2f2) |= 2;
            for (i = 0; i < 3; i++) {
                void *actor = TITLE_PARTICIPANT(self, i);
                FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 1;
                FIELD(u8, FIELD(void *, FIELD(void *, actor, 0x29c), 0x54),
                      0x3a) = 1;
            }
            FIELD(u16, TITLE_PARTICIPANT(
                           self, FIELD(u8, self, 0x1ef)),
                  0x2f2) |= 4;
            FIELD(u16, TITLE_PARTICIPANT(
                           self, FIELD(u8, self, 0x1ef)),
                  0x2c8) = 0x118;
            DisplayBrightness_StartTransition(
                DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 0),
                -16, 0, 10);
            if (secondaryActor != 0)
                Type7Actor_SetFlag40StateEnabled(secondaryActor, 0);
        }
        break;
    case 0xb:
        func_ov090_0221b7f8(self, 0x10);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (FIELD(s32, self, 0x214) < 0x21c000)
            FIELD(s32, self, 0x214) = 0x21c000;
        FIELD(s32, self, 0x21c) += 0x52;
        if (FIELD(s32, self, 0x21c) > 0x1000)
            FIELD(s32, self, 0x21c) = 0x1000;
        if (FIELD(u8, self, 0x247) != 0)
            FIELD(u8, self, 0x247)--;
        if (FIELD(s16, self, 0x220) < 1) {
            FIELD(u32, primaryActor, 0x230) &= ~4u;
            GameWork_ClearFlag(gGameWork, 0x3ec);
            TITLE_STATE(self) = 0x18;
        } else {
            func_ov090_0221b280(self);
            func_ov090_0221ab4c(self);
        }
        break;
    case 0xc:
        FIELD(u8, self, 0x247) = 0x3c;
        func_ov090_0221b7f8(self, -0x10);
        FIELD(s32, self, 0x21c) += 0x14;
        if (FIELD(s32, self, 0x21c) > 0x266)
            FIELD(s32, self, 0x21c) = 0x266;
        if ((FIELD(u16, TITLE_SPRITE(self), 0x24) & 1) != 0) {
            void *effect = Heap_Alloc(0x14, data_ov090_0221cc10, 4,
                                      &gHeapContext);
            void *referenceSprite = FIELD(void *, primaryActor, 0x54);

            if (effect != 0) {
                AuxiliaryTimedSpritePresentation_Init(
                    effect, (u8 *)primaryActor + 0x18,
                    FIELD(void *, referenceSprite, 0),
                    FIELD(void *, FIELD(void *, TITLE_SPRITE(self), 0x14),
                          0x10),
                    FIELD(void *, FIELD(void *, TITLE_SPRITE(self), 0x18),
                          0x10),
                    FIELD(void *, FIELD(void *, TITLE_SPRITE(self), 0x1c),
                          0x10),
                    9, 4, -1, 1);
            }
            func_ov090_0221ad64(self, 0x10a9, 0x1001, 0x10aa);
            TITLE_ACTOR_SET_MODE(primaryActor, 0);
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 1);
            FIELD(u16, TITLE_SPRITE(self), 0x2c) =
                FIELD(u16, referenceSprite, 0x2c);
            FIELD(u16, TITLE_SPRITE(self), 0x2e) =
                FIELD(u16, referenceSprite, 0x2e);
            TITLE_TIMER(self) = 0;
            FIELD(s32, primaryActor, 0x24) = 0x28000;
            VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x224),
                                 (VecFx32Object *)((u8 *)primaryActor + 0x18));
            TITLE_STATE(self) = 0xd;
            Sound_Play(gSoundContext, 0x142, 7);
            Sound_Play(gSoundContext, 0, 0x44);
            if (FIELD(void *, primaryActor, 0x278) != 0) {
                void *linked = FIELD(void *, primaryActor, 0x278);
                FIELD(u32, linked, 0x14) |= 0x80;
                FIELD(u8, FIELD(void *, linked, 0x54), 0x3a) = 0;
                FIELD(u32, linked, 0x5c) =
                    (FIELD(u32, linked, 0x5c) & 0xffff0000) | 8;
            }
        }
        FIELD(s32, self, 0x210) = FIELD(s32, primaryActor, 0x1c);
        FIELD(s32, self, 0x214) = FIELD(s32, primaryActor, 0x20);
        FIELD(s32, self, 0x218) += 0x2000;
        if (FIELD(s32, self, 0x218) > 0x28000)
            FIELD(s32, self, 0x218) = 0x28000;
        break;
    case 0xd: {
        VecFx32Object first;
        VecFx32Object second;
        VecFx32Object evaluated;
        VecFx32Triple curve;
        s32 scale = FIELD(s16, TITLE_SPRITE(self), 0x32) + 2;

        func_ov090_0221b7f8(self, -0x10);
        if (scale > 0x180)
            scale = 0x180;
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), scale);
        if (FIELD(void *, primaryActor, 0x278) != 0)
            TITLE_SPRITE_SET_SCALE(
                FIELD(void *, FIELD(void *, primaryActor, 0x278), 0x54),
                scale);
        VecFx32Object_InitComponents(
            &first,
            func_020befec(FIELD(s32, self, 0x228) * 2 + 0x200000, 3),
            0x118000, 0x36000);
        if (first.value.x < 0x1ba000)
            first.value.x = 0x1ba000;
        else if (first.value.x > 0x246000)
            first.value.x = 0x246000;
        VecFx32Object_InitComponents(
            &second,
            (FIELD(s32, self, 0x228) * 3 + 0x200000) / 4, 0x12c000,
            0x50000);
        func_ov090_0221a3dc(&curve, (u8 *)self + 0x224, &first, &second);
        VecFx32Bezier_Evaluate3D(
            &evaluated, &curve,
            func_020befec((s32)TITLE_TIMER(self) << 12, 0x50));
        VecFx32Object_Assign(
            (VecFx32Object *)((u8 *)primaryActor + 0x18), &evaluated);
        VecFx32Object_Destroy(&evaluated);
        if (TITLE_TIMER(self) > 0x4f) {
            FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~3;
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 2);
            TITLE_STATE(self) = 0xe;
        }
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (FIELD(s32, self, 0x214) < 0x100000)
            FIELD(s32, self, 0x214) = 0x100000;
        FIELD(s32, self, 0x21c) += 0x29;
        if (FIELD(s32, self, 0x21c) > 0x1000)
            FIELD(s32, self, 0x21c) = 0x1000;
        func_ov090_0221b280(self);
        VecFx32Triple_Destroy(&curve);
        VecFx32Object_Destroy(&second);
        VecFx32Object_Destroy(&first);
        break;
    }
    case 0xe:
        func_ov090_0221b7f8(self, -0x10);
        if ((FIELD(u16, TITLE_SPRITE(self), 0x24) & 1) != 0) {
            FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~1;
            FIELD(u16, TITLE_SPRITE(self), 0x24) |= 2;
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 3);
            TITLE_STATE(self) = 0xf;
            TITLE_TIMER(self) = 0;
            Sound_Play(gSoundContext, 0x142, 8);
        }
        func_ov090_0221b280(self);
        break;
    case 0xf: {
        u32 direction;
        s32 scale = FIELD(s16, TITLE_SPRITE(self), 0x32) - 1;

        func_ov090_0221b7f8(self, -0x10);
        if (scale < 0x100)
            scale = 0x100;
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), scale);
        if (FIELD(void *, primaryActor, 0x278) != 0)
            TITLE_SPRITE_SET_SCALE(
                FIELD(void *, FIELD(void *, primaryActor, 0x278), 0x54),
                scale);
        FIELD(s32, primaryActor, 0x24) -= 0x4cd;
        FIELD(s32, primaryActor, 0x20) -= 0x4cd / 2;
        direction = func_ov090_0221aab8(self);
        if (direction != 0xffffffff) {
            s32 tableIndex = (direction & 7) << 9;
            FIELD(s32, primaryActor, 0x1c) -= data_020c9670[tableIndex * 2];
            FIELD(s32, primaryActor, 0x20) +=
                data_020c9670[tableIndex * 2 + 1] / 2;
            if (FIELD(s32, primaryActor, 0x1c) < 0x1ba000)
                FIELD(s32, primaryActor, 0x1c) = 0x1ba000;
            else if (FIELD(s32, primaryActor, 0x1c) > 0x246000)
                FIELD(s32, primaryActor, 0x1c) = 0x246000;
            if (FIELD(s32, primaryActor, 0x20) < 0xe0000)
                FIELD(s32, primaryActor, 0x20) = 0xe0000;
            else if (FIELD(s32, primaryActor, 0x20) > 0x160000)
                FIELD(s32, primaryActor, 0x20) = 0x160000;
        }
        if (direction == 0xffffffff || direction == 0 || direction == 4) {
            if (FIELD(s16, self, 0x234) < 0) FIELD(s16, self, 0x234)++;
            else if (FIELD(s16, self, 0x234) > 0) FIELD(s16, self, 0x234)--;
        } else if (direction < 4) {
            FIELD(s16, self, 0x234)++;
        } else {
            FIELD(s16, self, 0x234)--;
        }
        if (FIELD(s16, self, 0x234) < -0x10)
            FIELD(s16, self, 0x234) = -0x10;
        else if (FIELD(s16, self, 0x234) > 0x10)
            FIELD(s16, self, 0x234) = 0x10;
        FIELD(s16, TITLE_SPRITE(self), 0x30) =
            FIELD(s16, self, 0x234) << 4;
        if (direction < 2 || direction == 7)
            FIELD(s16, TITLE_SPRITE(self), 0x34) += 8;
        else if (direction > 2 && direction < 6)
            FIELD(s16, TITLE_SPRITE(self), 0x34) -= 8;
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if ((TITLE_TIMER(self) & 3) == 0)
            func_020a29ac(RuntimePresentationManager_GetGraphics3dPresentation(runtime + 0x2f7c), 0,
                          FIELD(s32, primaryActor, 0x1c) >> 12,
                          ((FIELD(s32, primaryActor, 0x20) >> 12) -
                           (FIELD(s32, primaryActor, 0x24) >> 12)) - 0x3c);
        FIELD(s32, self, 0x21c) += 0x29;
        if (FIELD(s32, self, 0x21c) > 0x1000)
            FIELD(s32, self, 0x21c) = 0x1000;
        if (TITLE_TIMER(self) < 0x80)
            func_ov090_0221b280(self);
        else {
            FIELD(u16, TITLE_SPRITE(self), 0x30) = 0;
            func_ov090_0221ae1c(self);
        }
        break;
    }
    case 0x10:
    case 0x11: {
        VecFx32Object position;
        s32 selected = FIELD(u8, self, 0x223);

        FIELD(s32, self, 0x21c) += 0x14;
        if (FIELD(s32, self, 0x21c) > 0x4cd)
            FIELD(s32, self, 0x21c) = 0x1000;
        func_ov090_0221a420(&position, TITLE_PARTICIPANT(self, selected));
        VecFx32Object_Assign(
            (VecFx32Object *)((u8 *)primaryActor + 0x18), &position);
        VecFx32Object_Destroy(&position);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (TITLE_STATE(self) == 0x11) {
            if (FIELD(u8, TITLE_SPRITE(self), 0x38) == 4 &&
                TITLE_TIMER(self) > 0x14) {
                GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 5);
                FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~2;
            } else if ((FIELD(u16, TITLE_SPRITE(self), 0x24) & 1) != 0) {
                FIELD(u16, TITLE_SPRITE(self), 0x24) |= 4;
            }
        } else if ((TITLE_TIMER(self) % 10) == 0) {
            func_020a28e0(RuntimePresentationManager_GetGraphics3dPresentation(runtime + 0x2f7c), 1,
                          FIELD(s32, primaryActor, 0x1c) >> 12,
                          ((FIELD(s32, primaryActor, 0x20) >> 12) -
                           (FIELD(s32, primaryActor, 0x24) >> 12)) - 0x1c,
                          0x1e);
        }
        if ((FIELD(u8, self, 0x222) & 1) == 0) {
            func_ov090_0221b7f8(self, -0x10);
        } else {
            FIELD(u8, self, 0x222) &= ~1;
            VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x224),
                                 (VecFx32Object *)((u8 *)primaryActor + 0x18));
            FIELD(s32, self, 0x21c) = 0x19a;
            if (TITLE_STATE(self) == 0x10) {
                FIELD(s32, self, 0x230) = 0x10000;
                TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), 0x100);
                FIELD(u16, TITLE_SPRITE(self), 0x24) |= 2;
                FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~1;
                GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 6);
                TITLE_TIMER(self) = 0;
                if ((FIELD(u8, self, 0x222) & 2) == 0) {
                    TITLE_STATE(self) = 0x12;
                    for (i = 0; i < 3; i++)
                        func_020a2844(RuntimePresentationManager_GetGraphics3dPresentation(runtime + 0x2f7c), 0,
                                      FIELD(s32, self, 0x228) >> 12,
                                      (FIELD(s32, self, 0x22c) >> 12) -
                                          (FIELD(s32, self, 0x230) >> 12),
                                      8);
                    Sound_Play(gSoundContext, 0, 0x27);
                } else {
                    TITLE_STATE(self) = 0x1b;
                    for (i = 0; i < 3; i++) {
                        void *actor = TITLE_PARTICIPANT(self, i);
                        FIELD(u16, actor, 0x2f2) |= 0x40;
                        func_020a2844(
                            RuntimePresentationManager_GetGraphics3dPresentation(runtime + 0x2f7c), 0,
                            FIELD(s32, actor, 0x1c) >> 12,
                            (FIELD(s32, actor, 0x20) >> 12) -
                                (FIELD(s32, actor, 0x24) >> 12),
                            10);
                    }
                }
                for (i = 0; i < 3; i++) {
                    void *actor = TITLE_PARTICIPANT(self, i);
                    FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 0;
                    FIELD(u8,
                          FIELD(void *, FIELD(void *, actor, 0x29c), 0x54),
                          0x3a) = 1;
                }
            } else {
                VecFx32Object_Assign(
                    (VecFx32Object *)((u8 *)self + 0x224),
                    (VecFx32Object *)((u8 *)primaryActor + 0x18));
                func_ov090_0221ad64(self, 0x109d, 0x1001, 0x109e);
                FIELD(u16, TITLE_SPRITE(self), 0x24) |= 2;
                FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~1;
                GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 0);
                TITLE_TIMER(self) = 0;
                TITLE_STATE(self) = 0x15;
                Sound_Play(gSoundContext, 0x142, 9);
            }
        }
        break;
    }
    case 0x12: {
        VecFx32Object first;
        VecFx32Object second;
        VecFx32Object evaluated;
        VecFx32Triple curve;
        s32 scale;

        func_ov090_0221b7f8(self, 6);
        VecFx32Object_InitComponents(&first, 0x200000, 0x104000, 0x78000);
        VecFx32Object_InitComponents(
            &second,
            func_020befec(FIELD(s32, self, 0x228) * 2 + 0x200000, 3),
            0xc0000, 0x50000);
        func_ov090_0221a3dc(&curve, (u8 *)self + 0x224, &first, &second);
        VecFx32Bezier_Evaluate3D(
            &evaluated, &curve,
            func_020befec((s32)TITLE_TIMER(self) << 12, 0x3c));
        VecFx32Object_Assign(
            (VecFx32Object *)((u8 *)primaryActor + 0x18), &evaluated);
        VecFx32Object_Destroy(&evaluated);
        scale = FIELD(s16, TITLE_SPRITE(self), 0x32) + 4;
        if (scale > 0x200)
            scale = 0x200;
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), scale);
        if (TITLE_TIMER(self) > 0x3b) {
            TITLE_TIMER(self) = 0;
            TITLE_STATE(self) = 0x13;
            VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x224),
                                 (VecFx32Object *)((u8 *)primaryActor + 0x18));
        }
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (FIELD(s32, self, 0x214) < 0x100000)
            FIELD(s32, self, 0x214) = 0x100000;
        FIELD(s32, self, 0x21c) += 0x14;
        if (FIELD(s32, self, 0x21c) > 0x4cd)
            FIELD(s32, self, 0x21c) = 0x1000;
        func_ov090_0221b280(self);
        VecFx32Triple_Destroy(&curve);
        VecFx32Object_Destroy(&second);
        VecFx32Object_Destroy(&first);
        break;
    }
    case 0x13: {
        VecFx32Object first;
        VecFx32Object second;
        VecFx32Object evaluated;
        VecFx32Triple curve;
        s32 scale;

        func_ov090_0221b7f8(self, 6);
        VecFx32Object_InitComponents(&first, 0x200000, 0x230000, 0);
        VecFx32Object_InitComponents(&second, 0x200000, 0x12c000, 0x5a000);
        func_ov090_0221a3dc(&curve, (u8 *)self + 0x224, &first, &second);
        VecFx32Bezier_Evaluate3D(
            &evaluated, &curve,
            func_020befec((s32)TITLE_TIMER(self) << 12, 0x1e));
        VecFx32Object_Assign(
            (VecFx32Object *)((u8 *)primaryActor + 0x18), &evaluated);
        VecFx32Object_Destroy(&evaluated);
        scale = FIELD(s16, TITLE_SPRITE(self), 0x32) - 8;
        if (scale < 0x100)
            scale = 0x100;
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), scale);
        if (TITLE_TIMER(self) > 0x1d) {
            void *effect;

            TITLE_TIMER(self) = 0;
            FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~3;
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 7);
            TITLE_STATE(self) = 0x17;
            for (i = 0; i < 3; i++) {
                void *actor = TITLE_PARTICIPANT(self, i);
                FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 1;
                FIELD(u8, FIELD(void *, FIELD(void *, actor, 0x29c), 0x54),
                      0x3a) = 1;
            }
            effect = Heap_Alloc(0x14, data_ov090_0221cc10, 4,
                                &gHeapContext);
            if (effect != 0)
                AuxiliaryTimedSpritePresentation_Init(effect, (u8 *)primaryActor + 0x18,
                              FIELD(void *, FIELD(void *, primaryActor, 0x54),
                                    0),
                              0x162b, 0x162c, 0x162d, 0, 4, -1, 1);
            Sound_Play(gSoundContext, 0, 0x28);
            ActorMotionJitter_EnsureMinimum((ActorMotionJitter *)(runtime + 0x2fbc), 0x14, 1);
        }
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (FIELD(s32, self, 0x214) < 0x100000)
            FIELD(s32, self, 0x214) = 0x100000;
        FIELD(s32, self, 0x21c) += 0x14;
        if (FIELD(s32, self, 0x21c) > 0x4cd)
            FIELD(s32, self, 0x21c) = 0x1000;
        func_ov090_0221b280(self);
        VecFx32Triple_Destroy(&curve);
        VecFx32Object_Destroy(&second);
        VecFx32Object_Destroy(&first);
        break;
    }
    case 0x14:
    case 0x15: {
        VecFx32Object first;
        VecFx32Object destination;
        VecFx32Object evaluated;
        VecFx32Triple curve;
        u16 duration;

        func_ov090_0221b7f8(self, 6);
        VecFx32Object_InitComponents(&first, 0x200000, 0x230000, 0);
        VecFx32Object_Init(&destination);
        if (TITLE_STATE(self) == 0x14) {
            func_ov090_0221a3cc(&destination, 0x200000, 0x1e0000,
                                0x30000);
            duration = 0x14;
        } else {
            func_ov090_0221a3cc(&destination, 0x200000, 0x1f4000,
                                0x50000);
            duration = 0x1e;
        }
        func_ov090_0221a3dc(&curve, (u8 *)self + 0x224, &first,
                            &destination);
        VecFx32Bezier_Evaluate3D(
            &evaluated, &curve,
            func_020befec((s32)TITLE_TIMER(self) << 12, duration));
        VecFx32Object_Assign(
            (VecFx32Object *)((u8 *)primaryActor + 0x18), &evaluated);
        VecFx32Object_Destroy(&evaluated);
        if (TITLE_TIMER(self) >= duration) {
            s32 callbackValue;
            void *effect;

            TITLE_TIMER(self) = 0;
            FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~3;
            callbackValue = TITLE_STATE(self) == 0x15 ? 0x14a : 0x32;
            ((TitleControllerStateMethod)FIELD(
                void *, FIELD(void *, self, 0), 0xc4))(self, callbackValue);
            Sound_Play(gSoundContext, 0x142, 10);
            TITLE_STATE(self) = 0x16;
            effect = Heap_Alloc(0x14, data_ov090_0221cc10, 4,
                                &gHeapContext);
            if (effect != 0)
                AuxiliaryTimedSpritePresentation_Init(effect, (u8 *)primaryActor + 0x18,
                              FIELD(void *, FIELD(void *, primaryActor, 0x54),
                                    0),
                              0x162b, 0x162c, 0x162d, 0, 4, -1, 1);
            ActorMotionJitter_EnsureMinimum((ActorMotionJitter *)(runtime + 0x2fbc), 0x2d, 2);
            if (FIELD(s16, self, 0x220) < 1) {
                FIELD(u32, primaryActor, 0x230) &= ~4u;
                GameWork_ClearFlag(gGameWork, 0x3ec);
                TITLE_STATE(self) = 0x18;
                VecFx32Triple_Destroy(&curve);
                VecFx32Object_Destroy(&destination);
                VecFx32Object_Destroy(&first);
                break;
            }
        }
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (FIELD(s32, self, 0x214) < 0x100000)
            FIELD(s32, self, 0x214) = 0x100000;
        FIELD(s32, self, 0x21c) += 0x14;
        if (FIELD(s32, self, 0x21c) > 0x4cd)
            FIELD(s32, self, 0x21c) = 0x1000;
        func_ov090_0221b280(self);
        VecFx32Triple_Destroy(&curve);
        VecFx32Object_Destroy(&destination);
        VecFx32Object_Destroy(&first);
        break;
    }
    case 0x16:
        func_ov090_0221b7f8(self, 6);
        if (TITLE_TIMER(self) > 0x5a) {
            FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~3;
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 1);
            TITLE_STATE(self) = 0x17;
            func_ov090_0221b280(self);
        }
        break;
    case 0x17:
        func_ov090_0221b7f8(self, 6);
        if ((FIELD(u16, TITLE_SPRITE(self), 0x24) & 1) != 0) {
            func_ov090_0221ad64(self, -1, -1, -1);
            TITLE_TIMER(self) = 0;
            TITLE_STATE(self) = 0xb;
            FIELD(u32, primaryActor, 0x230) |= 4;
            TITLE_ACTOR_SET_MODE(primaryActor, 1);
            FIELD(u32, primaryActor, 0x14) &= ~2u;
            GameWork_SetFlag(gGameWork, 0x3ec);
            func_ov090_0221a3cc((u8 *)primaryActor + 0x38, 0, 0, 0);
            func_ov090_0221a3cc((u8 *)primaryActor + 0x88, 0, 0, 0);
            func_ov090_0221a3cc((u8 *)primaryActor + 0x98, 0, 0, 0);
            Actor_SetDirectionFromVector(primaryActor, 0, 0x1000);
            TITLE_ACTOR_CALL_SLOT_5C(primaryActor);
            ActorDerivedType1_TeardownActiveRecord(primaryActor);
            FIELD(u32, primaryActor, 0xd0) &= ~0x4000u;
            FIELD(u16, primaryActor, 0x268) = 0;
            func_ov090_0221b280(self);
        }
        break;
    case 0x18: {
        void *referenceSprite = FIELD(void *, primaryActor, 0x54);

        func_ov090_0221ad64(self, 0x103b, 0x103c, 0x103d);
        GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 0);
        FIELD(u16, TITLE_SPRITE(self), 0x24) |= 2;
        FIELD(u16, referenceSprite, 0x24) |= 0x10;
        FIELD(u16, TITLE_SPRITE(self), 0x2c) =
            FIELD(u16, referenceSprite, 0x2c);
        FIELD(u16, TITLE_SPRITE(self), 0x2e) =
            FIELD(u16, referenceSprite, 0x2e);
        DisplayBrightness_StartTransition(
            DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 0), 0,
            16, 0x5a);
        DisplayBrightness_StartTransition(
            DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1), 0,
            16, 0x5a);
        TITLE_TIMER(self) = 0;
        TITLE_STATE(self) = 0x19;
        FIELD(u8, self, 0x222) |= 4;
        Sound_StopAllDirectSequences(gSoundContext);
        Sound_Play(gSoundContext, 0, 0x2d);
        break;
    }
    case 0x19: {
        s32 scale = FIELD(s16, TITLE_SPRITE(self), 0x32) + 2;
        if (scale > 0x200)
            scale = 0x200;
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), scale);
        if (DisplayBrightness_IsMainTransitionComplete() != 0)
            TITLE_STATE(self) = 0x1a;
        break;
    }
    case 0x1a:
        break;
    case 0x1b: {
        VecFx32Object first;
        VecFx32Object second;
        VecFx32Object evaluated;
        VecFx32Triple curve;
        s32 scale;

        Sound_StopAllDirectSequences(gSoundContext, 0);
        if (TITLE_TIMER(self) == 10)
            Actor_PlayHorizontalSpatialSound(self, 0xa10c, 0);
        else if (TITLE_TIMER(self) == 0x14)
            func_ov090_0221b428(self);
        VecFx32Object_InitComponents(&first, 0x200000, 0x136000, 0x78000);
        VecFx32Object_InitComponents(&second, 0x200000, 0xd2000, 0x50000);
        func_ov090_0221a3dc(&curve, (u8 *)self + 0x224, &first, &second);
        VecFx32Bezier_Evaluate3D(
            &evaluated, &curve,
            func_020befec((s32)TITLE_TIMER(self) << 12, 0x3c));
        VecFx32Object_Assign(
            (VecFx32Object *)((u8 *)primaryActor + 0x18), &evaluated);
        VecFx32Object_Destroy(&evaluated);
        scale = FIELD(s16, TITLE_SPRITE(self), 0x32) + 4;
        if (scale > 0x200)
            scale = 0x200;
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), scale);
        if (TITLE_TIMER(self) > 0x3b) {
            TITLE_TIMER(self) = 0;
            TITLE_STATE(self) = 0x1c;
            VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x224),
                                 (VecFx32Object *)((u8 *)primaryActor + 0x18));
        }
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (FIELD(s32, self, 0x214) < 0x100000)
            FIELD(s32, self, 0x214) = 0x100000;
        FIELD(s32, self, 0x21c) += 0x14;
        if (FIELD(s32, self, 0x21c) > 0x4cd)
            FIELD(s32, self, 0x21c) = 0x1000;
        VecFx32Triple_Destroy(&curve);
        VecFx32Object_Destroy(&second);
        VecFx32Object_Destroy(&first);
        break;
    }
    case 0x1c: {
        VecFx32Object first;
        VecFx32Object second;
        VecFx32Object evaluated;
        VecFx32Triple curve;
        s32 scale;

        VecFx32Object_InitComponents(&first, 0x200000, 0x208000, 0);
        VecFx32Object_InitComponents(&second, 0x200000, 0x17c000, 0x5a000);
        func_ov090_0221a3dc(&curve, (u8 *)self + 0x224, &first, &second);
        VecFx32Bezier_Evaluate3D(
            &evaluated, &curve,
            func_020befec((s32)TITLE_TIMER(self) << 12, 0x3c));
        VecFx32Object_Assign(
            (VecFx32Object *)((u8 *)primaryActor + 0x18), &evaluated);
        VecFx32Object_Destroy(&evaluated);
        scale = FIELD(s16, TITLE_SPRITE(self), 0x32) - 4;
        if (scale < 0x100)
            scale = 0x100;
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), scale);
        if (TITLE_TIMER(self) > 0x3b) {
            void *effect;

            TITLE_TIMER(self) = 0;
            func_ov090_0221ad64(self, 0x1036, 0x1001, 0x1037);
            FIELD(u16, TITLE_SPRITE(self), 0x24) |= 2;
            FIELD(u16, TITLE_SPRITE(self), 0x24) &= ~1;
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 0x23);
            TITLE_STATE(self) = 0x1d;
            for (i = 0; i < 3; i++) {
                void *actor = TITLE_PARTICIPANT(self, i);
                FIELD(u8, FIELD(void *, actor, 0x54), 0x3a) = 1;
                FIELD(u8, FIELD(void *, FIELD(void *, actor, 0x29c), 0x54),
                      0x3a) = 1;
            }
            effect = Heap_Alloc(0x14, data_ov090_0221cc10, 4,
                                &gHeapContext);
            if (effect != 0)
                AuxiliaryTimedSpritePresentation_Init(effect, (u8 *)primaryActor + 0x18,
                              FIELD(void *, FIELD(void *, primaryActor, 0x54),
                                    0),
                              0x162b, 0x162c, 0x162d, 0, 4, -1, 1);
            Sound_Play(gSoundContext, 0, 0x28);
            ActorMotionJitter_EnsureMinimum((ActorMotionJitter *)(runtime + 0x2fbc), 0x14, 1);
        }
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (FIELD(s32, self, 0x214) < 0x100000)
            FIELD(s32, self, 0x214) = 0x100000;
        FIELD(s32, self, 0x21c) += 0x14;
        if (FIELD(s32, self, 0x21c) > 0x4cd)
            FIELD(s32, self, 0x21c) = 0x1000;
        VecFx32Triple_Destroy(&curve);
        VecFx32Object_Destroy(&second);
        VecFx32Object_Destroy(&first);
        break;
    }
    case 0x1d:
        TITLE_TIMER(self)++;
        if (TITLE_TIMER(self) > 0x77) {
            func_ov090_0221ad64(self, -1, -1, -1);
            FIELD(u32, primaryActor, 0x230) |= 4;
            TITLE_ACTOR_SET_MODE(primaryActor, 1);
            FIELD(u32, primaryActor, 0x14) &= ~2u;
            GameWork_SetFlag(gGameWork, 0x3ec);
            func_ov090_0221a3cc((u8 *)primaryActor + 0x38, 0, 0, 0);
            func_ov090_0221a3cc((u8 *)primaryActor + 0x88, 0, 0, 0);
            func_ov090_0221a3cc((u8 *)primaryActor + 0x98, 0, 0, 0);
            Actor_SetDirectionFromVector(primaryActor, 0, 0x1000);
            TITLE_ACTOR_CALL_SLOT_5C(primaryActor);
            FIELD(u32, primaryActor, 0xd0) &= ~0x4000u;
            FIELD(u16, primaryActor, 0x268) = 0;
            ActorDerivedType1_StartRecord(primaryActor, 0x7d);
            TITLE_TIMER(self) = 0;
            TITLE_STATE(self) = 0x1e;
            if (secondaryActor != 0)
                FIELD(u32, secondaryActor, 0x268) |= 0x20000;
            Sound_StopStream(gSoundContext, 10);
            Sound_PlayDirectSequence(gSoundContext, 0x56, 0x7f);
        }
        break;
    case 0x1e: {
        VecFx32Object scaled;

        func_ov090_0221a498(&scaled, (u8 *)primaryActor + 0x38, 0x19a);
        VecFx32Object_Add((VecFx32Object *)((u8 *)primaryActor + 0x88),
                          &scaled);
        VecFx32Object_Destroy(&scaled);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x20c),
                             (VecFx32Object *)((u8 *)primaryActor + 0x18));
        if (FIELD(s32, self, 0x214) < 0x100000)
            FIELD(s32, self, 0x214) = 0x100000;
        FIELD(s32, self, 0x21c) += 0x29;
        if (FIELD(s32, self, 0x21c) > 0x1000)
            FIELD(s32, self, 0x21c) = 0x1000;
        if ((TITLE_TIMER(self) & 7) == 0) {
            VecFx32Object position;
            u32 random = genrand_int32();
            void *effect;

            VecFx32Object_InitCopy(
                &position, (VecFx32Object *)((u8 *)primaryActor + 0x18));
            position.value.x +=
                (s32)(func_020bf1f8(random, 0xc) >> 32) * 0x1000 -
                0x6000;
            position.value.y +=
                (s32)(func_020bf1f8(random >> 8, 6) >> 32) * 0x1000 -
                0x3000;
            effect = Heap_Alloc(0x14, data_ov090_0221cc10, 4,
                                &gHeapContext);
            if (effect != 0)
                AuxiliaryTimedSpritePresentation_Init(effect, &position,
                              FIELD(void *, FIELD(void *, primaryActor, 0x54),
                                    0),
                              0x163c, 0x163d, 0x163e,
                              genrand_int32() & 3, 4, -1, 1);
            VecFx32Object_Destroy(&position);
        }
        if (TITLE_TIMER(self) < 0x2ee) {
            void *collection =
                GamePhaseRuntime_GetActorCollection(
                    (GamePhaseRuntime *)data_021052fc, 1);
            s32 count = 0;
            s32 actorIndex;

            for (actorIndex = 0;
                 actorIndex < FIELD(s32, collection, 0x2e74);
                 actorIndex++) {
                void *actor = FIELD(void *, collection, actorIndex * 4);
                if (actor != 0 && FIELD(s8, actor, 0x4d) == 4 &&
                    FIELD(s16, actor, 0x4e) == 0x12)
                    count++;
            }
            if (count == 0)
                TITLE_TIMER(self) = 0x2ee;
        }
        if (TITLE_TIMER(self) == 0x30c) {
            DisplayBrightness_StartTransition(
                DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 0),
                0, 16, 0x10e);
            DisplayBrightness_StartTransition(
                DisplayBrightnessPair_GetScreen(&gDisplayBrightnessPair, 1),
                0, 16, 0x10e);
        }
        if (TITLE_TIMER(self) > 0x3bf) {
            void *referenceSprite = FIELD(void *, primaryActor, 0x54);

            func_ov090_0221ad64(self, 0x1040, 0x1041, 0x1042);
            GraphicsSpriteState_SetAnimationIndex(TITLE_SPRITE(self), 1);
            FIELD(u16, TITLE_SPRITE(self), 0x24) |= 2;
            FIELD(u16, referenceSprite, 0x24) |= 0x10;
            FIELD(u16, TITLE_SPRITE(self), 0x2c) =
                FIELD(u16, referenceSprite, 0x2c);
            FIELD(u16, TITLE_SPRITE(self), 0x2e) =
                FIELD(u16, referenceSprite, 0x2e);
            TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), 0xc0);
            TITLE_TIMER(self) = 0;
            TITLE_STATE(self) = 0x1f;
            FIELD(u8, self, 0x222) |= 4;
        }
        break;
    }
    case 0x1f: {
        s32 scale = FIELD(s16, TITLE_SPRITE(self), 0x32) + 4;
        if (scale > 0x200)
            scale = 0x200;
        TITLE_SPRITE_SET_SCALE(TITLE_SPRITE(self), scale);
        if (DisplayBrightness_IsMainTransitionComplete() != 0)
            TITLE_STATE(self) = 0x20;
        break;
    }
    case 0x20:
    case 0x21:
        break;
    default:
        break;
    }

    TITLE_TIMER(self)++;
    {
        VecFx32Object first;
        VecFx32Object second;
        VecFx32Object blended;
        VecFx32Object offset;

        func_ov090_0221a498(&first, (u8 *)self + 0x18,
                            0x1000 - FIELD(s32, self, 0x21c));
        func_ov090_0221a498(&second, (u8 *)self + 0x20c,
                            FIELD(s32, self, 0x21c));
        func_ov090_0221a460(&blended, &first, &second);
        VecFx32Object_Assign((VecFx32Object *)((u8 *)self + 0x18), &blended);
        VecFx32Object_Destroy(&blended);
        VecFx32Object_Destroy(&second);
        VecFx32Object_Destroy(&first);
        VecFx32Object_InitComponents(
            &offset, -0x80000,
            -0x74000 - FIELD(s32, self, 0x218) / 2, 0);
        ActorMotion_SetTarget((ActorMotion *)(runtime + 0x2fbc), &offset);
        ActorMotion_SetTarget((ActorMotion *)(runtime + 0x3044), &offset);
        FIELD(u32, runtime, 0x30b8) |= 0x10;
        if (TITLE_STATE(self) < 0xb || TITLE_STATE(self) > 0x19) {
            FIELD(u16, FIELD(void *, self, 0x23c), 0x24) |= 0x10;
        } else {
            func_ov090_0221a8bc(self);
            FIELD(u16, FIELD(void *, self, 0x23c), 0x24) &= ~0x10;
        }
        VecFx32Object_Destroy(&offset);
    }
}
