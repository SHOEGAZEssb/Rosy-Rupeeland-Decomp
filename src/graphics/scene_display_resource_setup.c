#include "tingle/types.h"

/*
 * Configure scene-specific display hardware and load paired graphics resource
 * sets.  Scene index 13 uses the main engine; all other indices use the sub
 * engine.  Six resource IDs per scene come from the recovered data table.
 */

typedef struct GraphicsResourceSet { void *a; void *b; void *c; } GraphicsResourceSet;
typedef struct SceneResourceIds { u16 first[3]; u16 second[3]; } SceneResourceIds;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGameWork;
extern void *data_020f4e18;
extern void *data_021055dc;
extern const SceneResourceIds data_020d6418[];
extern void GameWork_ClearFlag(void *, s32);
extern void GraphicsResourceSet_Init(GraphicsResourceSet *);
extern void GraphicsResourceSet_Load(GraphicsResourceSet *, void *, s32, s32, s32, s32);
extern void GraphicsResourceSet_Destroy(GraphicsResourceSet *);
extern void func_020b44e8(void);
extern void func_020923a4(void *);
extern void func_020af1f8(s32);
extern void MainBg1_SetControl(s32, s32, s32, s32, s32);
extern void SubBg2_SetControl(s32, s32, s32, s32);
extern void func_02070638(void *);
extern void func_020706c4(void *, s32, s32);
extern void func_02070b50(void *, s32);
extern void func_02070bc4(void *, s32);
extern void func_02070e0c(void *, s32, s32);
extern void func_02070eac(void *, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Clear GameWork flag 0x38e, configure confirmed blend/background registers
 * for the selected engine, load two resource sets using the six IDs at
 * data_020d6418[index], apply engine-specific layer/palette operations, then
 * destroy both temporary sets.  The routine returns no value and directly
 * changes Nintendo DS display state.
 */
void SceneDisplayResources_Setup(s32 index)
{
    GraphicsResourceSet first;
    GraphicsResourceSet second;
    const SceneResourceIds *ids = &data_020d6418[index];

    GameWork_ClearFlag(gGameWork, 0x38e);
    if (index == 13) {
        func_020923a4(data_021055dc);
        func_020af1f8(0x40);
        *(volatile u32 *)0x04000000 &= ~0x0300;
        *(volatile u16 *)0x04000008 =
            (u16)((*(volatile u16 *)0x04000008 & 0x43) | 0x7890);
        MainBg1_SetControl(1, 1, 0x1a, 4, 1);
        *(volatile u16 *)0x0400000a &= (u16)~3;
        *(volatile u16 *)0x0400000c =
            (u16)((*(volatile u16 *)0x0400000c & ~3) | 1);
    } else {
        *(volatile u32 *)0x04001000 &= ~0x0c00;
        SubBg2_SetControl(1, 1, 0x18, 4);
        *(volatile u16 *)0x0400100e =
            (u16)((*(volatile u16 *)0x0400100e & 0x43) | 0x5a90);
        *(volatile u16 *)0x0400100c &= (u16)~3;
        *(volatile u16 *)0x0400100e =
            (u16)((*(volatile u16 *)0x0400100e & ~3) | 1);
    }
    GraphicsResourceSet_Init(&first);
    GraphicsResourceSet_Init(&second);
    GraphicsResourceSet_Load(&first, data_020f4e18, ids->first[0],
                             ids->first[1], ids->first[2], ids->first[2]);
    GraphicsResourceSet_Load(&second, data_020f4e18, ids->second[0],
                             ids->second[1], ids->second[2], ids->second[2]);
    func_020b44e8();
    if (index == 13) {
        func_02070638(first.a);
        func_02070b50(first.b, 0x4000);
        func_02070b50(first.b, 0x6000);
        func_02070e0c(first.c, 0, 0);
        func_02070e0c(second.c, 1, 0);
    } else {
        func_020706c4(first.a, 2, 0);
        func_02070bc4(first.b, 0x4000);
        func_02070bc4(first.b, 0x6000);
        func_02070eac(first.c, 2, 0);
        func_02070eac(second.c, 3, 0);
    }
    GraphicsResourceSet_Destroy(&second);
    GraphicsResourceSet_Destroy(&first);
}
