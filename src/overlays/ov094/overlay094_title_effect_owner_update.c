#include "tingle/types.h"

/* Overlay 94 frame update for the title/menu's auxiliary sprite effects. */

typedef struct Overlay094AnimationChoices {
    s32 values[28];
} Overlay094AnimationChoices;

extern const Overlay094AnimationChoices data_ov094_02219c28;
extern const u8 data_ov094_02219f14[];
extern const u8 data_ov094_02219f1c[];
extern void *gGameWork;
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *gameWork, s32 flag);
extern s32 GameWork_TestFlag(void *gameWork, s32 flag);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *group,
                                                       void *resourceSet,
                                                       s32 mode);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *group);
extern void GraphicsSpriteState_SetAnimationIndex(void *state, s32 index);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                        void *heapContext);
extern s32 func_0209189c(void *randomState, s32 lower, s32 upper);
extern s32 func_020918f4(void *randomState, s32 upper);
extern void PresentationList_Append(void *effectList, void *effect);
extern void PresentationList_UpdateAndDeleteCompleted(void *effectList);
extern void *func_ov094_02219234(void *effect);
extern void *func_ov094_02219344(void *effect, void *firstState,
                                void *secondState, s32 firstCoordinate,
                                s32 secondCoordinate, s32 thirdCoordinate);
#ifdef __cplusplus
}
#endif

/*
 * When the primary sprite group is resident, consumes GameWork event 0x3D3
 * by choosing one of the retail animation variants, creating paired states,
 * and appending a coordinate-randomized 0xA8-byte effect. Event 0x3D5 creates
 * and appends the independent 0xA0-byte effect. It then advances the owned
 * effect list and both sprite groups. Returns one exactly when event 0x3D4 is
 * set; allocation is through the game heap and no direct GX writes occur.
 */
extern "C" s32 func_ov094_022196e8(void *object)
{
    if (*(s32 *)((u8 *)*(void **)((u8 *)object + 0x0c) + 0x20) != 0) {
        if (GameWork_TestFlag(gGameWork, 0x3d3)) {
            GameWork_ClearFlag(gGameWork, 0x3d3);

            Overlay094AnimationChoices choices = data_ov094_02219c28;
            s32 choice = choices.values[
                func_020918f4((u8 *)object + 0x14, 28)] & 0xff;
            void *firstState = GraphicsSpriteGroup_CreateStateFromSource(
                *(void **)((u8 *)object + 0x0c), object, 1);
            void *secondState = GraphicsSpriteGroup_CreateStateFromSource(
                *(void **)((u8 *)object + 0x10), object, 1);
            GraphicsSpriteState_SetAnimationIndex(firstState, choice);
            GraphicsSpriteState_SetAnimationIndex(secondState, choice);
            *(u16 *)((u8 *)firstState + 0x24) |= 2;
            *(u16 *)((u8 *)secondState + 0x24) |= 2;

            void *effect =
                Heap_Alloc(0xa8, data_ov094_02219f14, 4, gHeapContext);
            if (effect != 0) {
                s32 firstCoordinate =
                    func_0209189c((u8 *)object + 0x14, 0, 0x100);
                s32 secondCoordinate = func_0209189c(
                    (u8 *)object + 0x14,
                    *(s32 *)((u8 *)object + 0x44),
                    *(s32 *)((u8 *)object + 0x48));
                s32 thirdCoordinate =
                    func_0209189c((u8 *)object + 0x14, 0x8c, 0xb4);
                effect = func_ov094_02219344(
                    effect, firstState, secondState, firstCoordinate << 12,
                    secondCoordinate << 12, thirdCoordinate);
            }
            PresentationList_Append((u8 *)object + 0x34, effect);
        }

        if (GameWork_TestFlag(gGameWork, 0x3d5)) {
            GameWork_ClearFlag(gGameWork, 0x3d5);
            void *effect =
                Heap_Alloc(0xa0, data_ov094_02219f1c, 4, gHeapContext);
            if (effect != 0) {
                effect = func_ov094_02219234(effect);
            }
            PresentationList_Append((u8 *)object + 0x34, effect);
        }

        PresentationList_UpdateAndDeleteCompleted((u8 *)object + 0x34);
        GraphicsSpriteGroup_AdvanceAnimations(
            *(void **)((u8 *)object + 0x0c));
        GraphicsSpriteGroup_AdvanceAnimations(
            *(void **)((u8 *)object + 0x10));
    }

    return GameWork_TestFlag(gGameWork, 0x3d4) != 0;
}
