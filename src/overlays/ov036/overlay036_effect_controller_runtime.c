#include "tingle/types.h"

/* Overlay 36 effect-controller timed spawning, updates, and GX rendering. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02205ce0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091b98(void *timer, s32 duration);
extern s32 func_02091c7c(void *timer, s32 mode);
extern void func_ov036_021fef6c(void *controller, s32 configIndex);
extern void PresentationList_UpdateAndDeleteCompleted(void *list);
extern void GraphicsAnimationInstanceManager_Update(void *manager);
extern void Graphics3DSceneState_Apply(void *transform);
extern void GraphicsAnimationInstanceManager_Render(void *manager, void *matrix);
extern void func_ov036_021fe028(void *object);
extern void func_ov036_021fd128(s32, s32, s32, s32, s32, s32);
extern void func_ov036_021fdef0(s32, s32, s32, s32,
                                s32, s32, s32, s32);
extern void func_ov036_021fe988(void *object);
#ifdef __cplusplus
}
#endif

/*
 * Advances controller phase +0xA0. Phase 0 starts a 20-frame timer and falls
 * into phase 1; each timer completion there spawns the next of eight 0x20-byte
 * configurations and reloads duration from its first word. Phase 2 waits for
 * count/status +0x114 to become zero; phase 3 reports completion. Both embedded
 * lists +0xF8/+0x108 and manager +0xDC update every call, including the terminal
 * call. Returns one only in phase 3; timers, lists, manager, spawn index +0x118,
 * and phase state can change.
 */
extern "C" s32 func_ov036_021ff098(void *controller)
{
    switch (FIELD(s32, controller, 0xa0)) {
    case 0:
        func_02091b98((u8 *)controller + 0xa4, 0x14);
        FIELD(s32, controller, 0xa0)++;
        /* Fall through to timer-driven spawning. */
    case 1:
        if (func_02091c7c((u8 *)controller + 0xa4, 2) != 0) {
            s32 index = FIELD(s32, controller, 0x118);
            func_ov036_021fef6c(controller, index);
            func_02091b98((u8 *)controller + 0xa4,
                          FIELD(s32, data_ov036_02205ce0, index * 0x20));
            if (++FIELD(s32, controller, 0x118) >= 8)
                FIELD(s32, controller, 0xa0)++;
        }
        break;
    case 2:
        if (FIELD(s32, controller, 0x114) == 0)
            FIELD(s32, controller, 0xa0)++;
        break;
    case 3:
        PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0xf8);
        PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0x108);
        GraphicsAnimationInstanceManager_Update(FIELD(void *, controller, 0xdc));
        return 1;
    }

    PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0xf8);
    PresentationList_UpdateAndDeleteCompleted((u8 *)controller + 0x108);
    GraphicsAnimationInstanceManager_Update(FIELD(void *, controller, 0xdc));
    return 0;
}

/*
 * Renders the effect controller. It submits transform +0xC, applies manager
 * +0xDC using matrix/work area +0x64, draws owned object +0x11C, establishes
 * common GX attributes, then follows list head +0x10C through +8 and renders
 * each particle-list object. It returns nothing and changes transform, manager,
 * and Nintendo DS GX state.
 */
extern "C" void func_ov036_021ff184(void *controller)
{
    Graphics3DSceneState_Apply((u8 *)controller + 0xc);
    GraphicsAnimationInstanceManager_Render(FIELD(void *, controller, 0xdc),
                  (u8 *)controller + 0x64);
    func_ov036_021fe028(FIELD(void *, controller, 0x11c));
    func_ov036_021fd128(0, 0, 3, 0x13, 0x1f, 0);
    func_ov036_021fdef0(0, 0, 0, 0, 0, 0, 0, 0);
    void *object = FIELD(void *, controller, 0x10c);
    while (object != 0) {
        func_ov036_021fe988(object);
        object = FIELD(void *, object, 8);
    }
}
