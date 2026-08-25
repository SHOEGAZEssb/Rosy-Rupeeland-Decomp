#include "tingle/types.h"

/*
 * Overlay 5 scene-population update. This recovered callback oscillates a
 * blend animation, emits randomized child effects, and advances renderer state.
 */

typedef struct Overlay005ScenePopulation {
    u8 bytes[0x15c];
} Overlay005ScenePopulation;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020f4e14;
extern void *gHeapContext;
extern const u8 data_ov005_021fcb04[];
extern const s32 data_ov005_021fc8f0[];
extern s32 func_02091c7c(void *animation, s32 channel);
extern void TitleInterpolatedValue_Configure(void *animation, s32 mode, s32 value, s32 target,
                          s32 duration);
extern void func_020afca0(volatile void *registers, s32 value);
extern void func_02091b98(void *animation, s32 value);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                        void *heapContext);
extern void *Overlay005_RenderEffect_Init(void *memory, void *owner);
extern s32 func_0209189c(u32 *randomState, s32 minimum, s32 maximum);
extern void PresentationScalar_SetImmediate(void *object, s32 value);
extern void PresentationScalar_TransitionBy(void *object, s32 mode, s32 value);
extern void PresentationList_Append(void *container, void *object);
extern void PresentationList_UpdateAndDeleteCompleted(void *container);
extern s32 GraphicsSpriteGroup_AdvanceAnimations(void *context);
#ifdef __cplusplus
}
#endif

/*
 * Advance animation +0x110 channel 2. On completion, restart it for 30 frames
 * between 0 and 0xA000, choosing direction from +0x11C. Convert +0x120 from
 * signed 20.12 fixed point and submit it to main BLDCNT at 0x04000050 when
 * owner +0x00 equals data_020f4e14, otherwise to sub BLDCNT at 0x04001050.
 *
 * When +0x158 is nonzero and animation +0x12C channel 2 completes, submit
 * value 0x10, allocate a 0xCC-byte child tagged by data_ov005_021fcb04, and
 * construct Overlay005_RenderEffect_Init with context +0x04. Choose its +0x0C position
 * randomly from 0..0x100 (then shift by 12), and its +0x1C position from the
 * range beginning at data_ov005_021fc8f0[+0x100] and extending 0xC0. Configure
 * +0x1C with mode 2/value 0x18000, set child +0x7C/+0x80 to 64/0, and enqueue
 * it into +0x148. The original assumes allocation succeeds before dereference.
 * Always advance +0x148 through PresentationList_UpdateAndDeleteCompleted, update context +0x04 through
 * GraphicsSpriteGroup_AdvanceAnimations, and return that final result. MMIO destinations and random
 * ranges are confirmed; visual identities and +0x100's semantic name are not.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay005_UpdateScenePopulation(Overlay005ScenePopulation *state)
{
    void *animation = (u8 *)state + 0x110;
    s32 blend;

    if (func_02091c7c(animation, 2)) {
        if (FIELD(s32, state, 0x11c) == 0) {
            TitleInterpolatedValue_Configure(animation, 2, 0, 0xa000, 30);
        } else {
            TitleInterpolatedValue_Configure(animation, 2, 0xa000, 0, 30);
        }
    }

    blend = FIELD(s32, state, 0x120) / 0x1000;
    if (FIELD(void *, state, 0x000) == data_020f4e14) {
        func_020afca0((volatile void *)0x04000050, blend);
    } else {
        func_020afca0((volatile void *)0x04001050, blend);
    }

    if (FIELD(s32, state, 0x158) != 0 &&
        func_02091c7c((u8 *)state + 0x12c, 2)) {
        void *child;
        s32 tableValue;

        func_02091b98((u8 *)state + 0x12c, 0x10);
        child = Heap_Alloc(0xcc, data_ov005_021fcb04, 4, gHeapContext);
        if (child != 0) {
            child = Overlay005_RenderEffect_Init(child,
                                       FIELD(void *, state, 0x004));
        }
        PresentationScalar_SetImmediate((u8 *)child + 0x0c,
                      func_0209189c((u32 *)((u8 *)state + 0x10c), 0,
                                     0x100)
                          << 12);
        tableValue = data_ov005_021fc8f0[FIELD(s32, state, 0x100)];
        PresentationScalar_SetImmediate((u8 *)child + 0x1c,
                      func_0209189c((u32 *)((u8 *)state + 0x10c), tableValue,
                                     tableValue + 0xc0)
                          << 12);
        PresentationScalar_TransitionBy((u8 *)child + 0x1c, 2, 0x18000);
        FIELD(s32, child, 0x7c) = 64;
        FIELD(s32, child, 0x80) = 0;
        PresentationList_Append((u8 *)state + 0x148, child);
    }

    PresentationList_UpdateAndDeleteCompleted((u8 *)state + 0x148);
    return GraphicsSpriteGroup_AdvanceAnimations(FIELD(void *, state, 0x004));
}

#undef FIELD
