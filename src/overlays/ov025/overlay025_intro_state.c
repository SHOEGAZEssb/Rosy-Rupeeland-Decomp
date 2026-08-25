#include "tingle/types.h"

/* Overlay 25's initial record scan and modal-guidance scene state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct TransitionPair {
    u32 first;
    u32 second;
} TransitionPair;

extern const u8 data_ov025_02202e00[];
extern const u8 data_ov025_02202e38[];
extern const u8 data_ov025_02202e50[];
extern const u8 data_ov025_022033b4[];
extern u8 gHeapContext[];
extern void *gRuntimeContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_Reset(void);
extern void *Heap_Alloc(u32, const void *, u32, void *);
extern void Heap_Free(void *);
extern s32 DisplayBrightness_IsMainTransitionComplete(void);
extern void AnimationResourceState_Destroy(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern s32 RetailSaveContext_PollOperation(void *);
extern void RetailSaveContext_BeginDiscovery(void *, s32);
extern void RetailSaveContext_BeginRecordDelete(void *, s32, s32);
extern void func_02091b98(void *, s32);
extern s32 func_02091c7c(void *, s32);
extern void SceneSound_PlayDirectSequence(void *, s32);
extern void TitleCharacterResourceCollection_Destroy(void *);
extern s32 ModalState_UpdateInput(void *, void *, s32);
extern void *func_ov025_021fd5dc(void *, s32);
extern void func_ov025_021ff254(void *, TransitionPair);
extern void func_ov025_02200178(void *);
extern void func_ov025_02200224(void *, s32, void *);
extern void func_ov025_022002b0(void *);
extern void func_ov025_02200398(void *, s32, s32);
extern void func_ov025_02200438(void *, s32);
extern void func_ov025_02200468(void *);
extern s32 func_ov025_02200480(void *);
extern void func_ov025_02200824(void *, s32);
#ifdef __cplusplus
}
#endif

/*
 * Runs one frame of the ten-state introductory record scan. It resets and
 * starts runtime work, creates three record rows, presents per-row modals,
 * refreshes rows after transient work, and selects retail callback pairs.
 * Normal completion through +0x2E00/+0x2E38 enters func_ov025_02200E54; the
 * failure pair +0x2E50 enters func_ov025_02201ED0. State is held at +4, its
 * frame counter at +8, and scan index at +0x638. The routine always performs
 * scene maintenance and returns zero.
 */
extern "C" s32 func_ov025_022009d8(void *scene)
{
    switch (FIELD(u32, scene, 4)) {
    case 0:
        GameWork_Reset();
        RetailSaveContext_BeginDiscovery(gRuntimeContext, 1);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        /* State zero intentionally continues into the runtime-poll state. */
    case 1: {
        s32 status = RetailSaveContext_PollOperation(gRuntimeContext);
        if (status == 0 || status == -1)
            break;
        for (s32 i = 0; i < 3; ++i) {
            void *row = Heap_Alloc(0x90, data_ov025_022033b4, 4, gHeapContext);
            if (row)
                row = func_ov025_021fd5dc(row, i);
            u8 *entry = (u8 *)scene + i * 4;
            FIELD(void *, entry, 0xe4) = row;
        }
        FIELD(u32, scene, 0x20) = (FIELD(u32, scene, 0x20) & ~1u) | 1u;
        SceneSound_PlayDirectSequence(scene, 0xe2);
        func_02091b98((u8 *)scene + 0x5fc, 0x89);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        break;
    }
    case 2:
        if (!func_02091c7c((u8 *)scene + 0x5fc, 2) || !DisplayBrightness_IsMainTransitionComplete())
            break;
        FIELD(s32, FIELD(void *, scene, 0xdc), 0x90) = 0;
        FIELD(s32, FIELD(void *, scene, 0xe0), 0x90) = 0;
        func_02091b98((u8 *)scene + 0x5c4, 0x12c);
        func_02091b98((u8 *)scene + 0x5fc, 0x3c);
        ++FIELD(s32, scene, 4);
        FIELD(s32, scene, 8) = 0;
        break;
    case 3:
        func_ov025_02200824(scene, 4);
        if (func_02091c7c((u8 *)scene + 0x5fc, 2)) {
            FIELD(s32, scene, 0x638) = 0;
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 4: {
        s32 index = FIELD(s32, scene, 0x638);
        u8 *entry = (u8 *)scene + index * 4;
        void *row = FIELD(void *, entry, 0xe4);
        if (FIELD(s32, row, 0x8c)) {
            if (index == 0)
                func_ov025_02200224(scene, 0x22, 0);
            else if (index == 1)
                func_ov025_02200224(scene, 0x23, 0);
            else
                func_ov025_02200224(scene, 0x24, 0);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        } else if (++FIELD(s32, scene, 0x638) >= 3) {
            func_ov025_021ff254(scene,
                *(const TransitionPair *)data_ov025_02202e38);
        }
        break;
    }
    case 5:
        if (ModalState_UpdateInput(FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
                          (s32)(FIELD(u32, scene, 0x20) << 26) >> 31) >= 0) {
            func_ov025_022002b0(scene);
            func_ov025_02200398(scene, 5, 3);
            RetailSaveContext_BeginRecordDelete(gRuntimeContext, FIELD(s32, scene, 0x638), 1);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 6: {
        s32 status = RetailSaveContext_PollOperation(gRuntimeContext);
        if (status == 0)
            break;
        if (status == -1) {
            func_ov025_02200438(scene, 1);
            if (FIELD(s32, gRuntimeContext, 0x10) == 4) {
                func_ov025_02200224(scene, 0x1f, 0);
                    func_ov025_021ff254(scene,
                        *(const TransitionPair *)data_ov025_02202e50);
            }
        } else {
            func_ov025_02200468(scene);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    case 7:
        if (func_ov025_02200480(scene)) {
            s32 index = FIELD(s32, scene, 0x638);
            u8 *entry = (u8 *)scene + index * 4;
            void *row = FIELD(void *, entry, 0xe4);
            if (row) {
                GraphicsSpriteGroup_Destroy(FIELD(void *, row, 0xc));
                TitleCharacterResourceCollection_Destroy((u8 *)row + 0x30);
                AnimationResourceState_Destroy(row);
                Heap_Free(row);
            }
            row = Heap_Alloc(0x90, data_ov025_022033b4, 4, gHeapContext);
            if (row)
                row = func_ov025_021fd5dc(row, FIELD(s32, scene, 0x638));
            index = FIELD(s32, scene, 0x638);
            entry = (u8 *)scene + index * 4;
            FIELD(void *, entry, 0xe4) = row;
            func_ov025_02200438(scene, 0);
            func_ov025_02200224(scene, 0x16, 0);
            ++FIELD(s32, scene, 4);
            FIELD(s32, scene, 8) = 0;
        }
        break;
    case 8:
        if (ModalState_UpdateInput(FIELD(void *, scene, 0x59c), (u8 *)scene + 0x30,
                          (s32)(FIELD(u32, scene, 0x20) << 26) >> 31) >= 0) {
            func_ov025_022002b0(scene);
            if (++FIELD(s32, scene, 0x638) >= 3) {
                func_ov025_021ff254(scene,
                    *(const TransitionPair *)data_ov025_02202e00);
            } else {
                ++FIELD(s32, scene, 4);
                FIELD(s32, scene, 8) = 0;
            }
        }
        break;
    case 9:
        if (++FIELD(s32, scene, 8) > 10) {
            FIELD(s32, scene, 4) = 4;
            FIELD(s32, scene, 8) = 0;
        }
        break;
    }
    func_ov025_02200178(scene);
    return 0;
}
