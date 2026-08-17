#include "tingle/types.h"

/* Overlay 94 construction for the title/menu's auxiliary sprite-effect owner. */

extern void *data_020f4e14;
extern void *data_020f4e18;
extern u8 *data_021052fc;
extern void *gDebugFont;
extern void *gGameWork;

typedef struct Overlay094SpriteGroup {
    u8 unknown_00[0x18];
    s32 parameter_18;
    s32 parameter_1c;
} Overlay094SpriteGroup;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *gameWork, s32 flag);
extern Overlay094SpriteGroup *GraphicsSpriteGroupOwner_CreateGroup(void *owner);
extern void AnimationResourceState_InitEmbedded(void *resourceSet);
extern void func_02071ee0(void *resourceSet, void *archive, s32 characterId,
                         s32 paletteId, s32 screenId);
extern void func_02091b6c(void *randomState);
extern void func_ov094_02217c34(void *effectList);
#ifdef __cplusplus
}
#endif

/*
 * Initializes the resource set, random state, and effect list, records the two
 * coordinate limits supplied by the caller, loads the area-dependent sprite
 * resource triplet, and creates its normal/debug sprite groups. The second
 * group receives the retail zero/0x100 presentation parameters. Finally this
 * clears GameWork event flags 0x3D3 through 0x3D6 and returns the object; the
 * helper calls allocate/cache graphics resources but perform no direct GX IO.
 */
extern "C" void *func_ov094_02219568(void *object, s32 width, s32 height)
{
    AnimationResourceState_InitEmbedded(object);
    *(s32 *)((u8 *)object + 0x14) = 0;
    func_02091b6c((u8 *)object + 0x18);
    func_ov094_02217c34((u8 *)object + 0x34);
    *(s32 *)((u8 *)object + 0x44) = width;
    *(s32 *)((u8 *)object + 0x48) = height;

    void *area = *(void **)(data_021052fc + 0x30bc);
    if (*(s32 *)area == 0xa7) {
        func_02071ee0(object, data_020f4e18, 0x1690, 0x1691, 0x1692);
    } else {
        func_02071ee0(object, data_020f4e18, 0x13cf, 0x13d0, 0x13d1);
    }

    *(void **)((u8 *)object + 0x0c) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    Overlay094SpriteGroup *debugGroup =
        GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
    *(Overlay094SpriteGroup **)((u8 *)object + 0x10) = debugGroup;
    debugGroup->parameter_18 = 0;
    void **firstGameWork = &gGameWork;
    debugGroup->parameter_1c = 0x100;

    GameWork_ClearFlag(*firstGameWork, 0x3d3);
    GameWork_ClearFlag(gGameWork, 0x3d4);
    GameWork_ClearFlag(gGameWork, 0x3d5);
    GameWork_ClearFlag(gGameWork, 0x3d6);
    return object;
}
