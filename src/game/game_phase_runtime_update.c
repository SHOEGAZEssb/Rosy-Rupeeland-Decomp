#include "tingle/game_phase_runtime.h"
#include "tingle/heap.h"

/*
 * Main per-frame controller for GamePhaseRuntime. It consumes queued phase
 * requests, advances the active scene, and creates transition/effect objects.
 * The retail instruction schedule is retained in the matching assembly file.
 */

extern u8 data_020d4360[];
extern u8 data_021f38fc[];
extern void *data_020f4e14;
extern void *gDebugFont;
extern void *gGameWork;
extern void *gLupyContext;
extern void *gSceneManager;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0200c244(void *object);
extern void *func_0200c680(void *object);
extern void *func_0200c9fc(void *object, s32 mode);
extern void *func_0200c8bc(void *object, u32 a, u32 b, u32 c, u32 d);
extern void *func_ov059_0220fd20(void *object, s32 mode, s32 value);
extern void *func_0206ec68(void *object);
extern s32 OverlayManager_GetGlobal(void);
extern void OverlayManager_LoadOverlay(s32 value, s32 mode, s32 mask);
extern s32 GameWork_TestFlag(void *work, s32 flag);
extern void func_020021c4(void);
extern void func_020020c4(void);
extern void func_02027f94(void);
extern void func_02027654(void);
extern s32 func_02008f34(void *object);
extern void func_020783cc(void *object);
extern void func_02078384(void *object);
extern void func_020755bc(void *object);
extern s32 func_02010b64(void *context);
extern void func_02010e68(void *context);
extern s32 func_0200ecf0(void *object);
extern void func_0200866c(GamePhaseRuntime *self);
extern s32 func_02008148(GamePhaseRuntime *self, s32 index);
extern void func_0201dcec(void *object, s32 enabled);
extern s32 GamePhaseRuntime_DispatchActorQueryRequest(GamePhaseRuntime *self);
extern void func_020338e4(void *object);
extern void Type7Actor_ClearTarget(void *object);
extern void *SceneManager_GetCurrent(void *manager);
extern s32 Actor_TrySpawnTerrainGateObject(void);
#ifdef __cplusplus
}
#endif

static void *allocRuntimeObject(u32 size)
{
    return Heap_Alloc(size, (const char *)data_020d4360, 4, &gHeapContext);
}

/*
 * Consume runtime request flags and advance the active game phase. The input
 * is the 0x3100-byte runtime; it may call virtual scene methods, mutate request
 * fields at 0x30b8/0x30cc, touch overlay/debug systems, and allocate several
 * tagged transition objects. Returns one only for request bit 3, otherwise
 * zero. Allocation failures simply skip the corresponding constructor.
 */
s32 func_02007430(GamePhaseRuntime *self)
{
    u8 *b = (u8 *)self;
    u32 flags = *(u32 *)(b + 0x30b8);
    void *object;
    s32 restricted;

    if (flags & 8) {
        if (self != 0) {
            void (**vtable)(GamePhaseRuntime *) =
                *(void (***)(GamePhaseRuntime *))self;
            vtable[1](self);
        }
        object = allocRuntimeObject(0x4c);
        if (object != 0)
            func_0200c244(object);
        return 1;
    }

    if (*(s32 *)(b + 0x30e4) != -1) {
        object = allocRuntimeObject(0x24);
        if (object != 0)
            func_0200c680(object);

        switch (*(s32 *)(b + 0x30e4)) {
        case 2:
        case 4:
            object = allocRuntimeObject(0x38);
            if (object != 0)
                func_0200c9fc(object, *(s32 *)(b + 0x30e4));
            break;
        case 1:
            OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x40);
            object = allocRuntimeObject(0x88);
            if (object != 0)
                func_ov059_0220fd20(object, 3, 0);
            break;
        default:
            break;
        }
        return 0;
    }

    object = *(void **)(b + 0x2ea4);
    if (func_02007868(object) &&
        !GameWork_TestFlag(gGameWork, 0x3ee) &&
        (s32)(*(u32 *)(*(u8 **)(b + 0x30bc) + 0x40) << 7) < 0) {
        func_020021c4();
        func_020020c4();
        if (!GameWork_TestFlag(gGameWork, 0x40f)) {
            func_02027f94();
            func_02027654();
        }
        if (func_02008f34(b + 0x30f0))
            func_020783cc(data_021f38fc);
        func_02078384(data_021f38fc);
    }

    if (*(u8 *)(b + 0x30cc) & 8) {
        object = allocRuntimeObject(0x30);
        if (object != 0)
            func_0200c8bc(object, *(u32 *)(b + 0x30d0),
                          *(u32 *)(b + 0x30d4), *(u32 *)(b + 0x30d8),
                          *(u32 *)(b + 0x30e0));
        return 0;
    }

    flags = *(u32 *)(b + 0x30b8);
    if (flags & 0x10) {
        *(u32 *)(b + 0x30b8) = flags & ~0x10;
        func_020755bc(data_020f4e14);
    }
    flags = *(u32 *)(b + 0x30b8);
    if (flags & 0x20) {
        *(u32 *)(b + 0x30b8) = flags & ~0x20;
        func_020755bc(gDebugFont);
    }

    restricted = 0;
    if (!GameWork_TestFlag(gGameWork, 0x3f5) &&
        func_02010b64(gLupyContext) <= 0)
        restricted = 1;

    if (!restricted) {
        func_02007908(self, self->field_04, 3);
        if (func_0200ecf0(b + 0x24))
            return 0;
        func_0200866c(self);
        func_02008148(self, 0);
        func_02008148(self, 1);
        func_0201dcec(b + 0x2ffc, 1);
        func_02007a24(self, self->field_04, 3);
        if (GamePhaseRuntime_DispatchActorQueryRequest(self))
            return 0;
    }

    func_02010e68(gLupyContext);
    if (restricted) {
        func_020338e4(*(void **)(b + 0x2ea4));
        object = *(void **)(b + 0x2ea8);
        if (object != 0 && (*(u32 *)((u8 *)object + 0x268) & 0x10))
            Type7Actor_ClearTarget(object);
        OverlayManager_LoadOverlay(OverlayManager_GetGlobal(), 2, 0x40);
        object = allocRuntimeObject(0x88);
        if (object != 0)
            func_ov059_0220fd20(object, 3, 0);
        return 0;
    }

    object = *(void **)(b + 0x30e8);
    (*(void (***)(void *))object)[4](object);
    if (SceneManager_GetCurrent(gSceneManager) == self &&
        !Actor_TrySpawnTerrainGateObject()) {
        object = *(void **)(*(u8 **)(b + 0x2ea4) + 0x26c);
        if (object != 0 &&
            (s32)(*(u32 *)((u8 *)object + 0x20) << 30) < 0) {
            object = allocRuntimeObject(0x38);
            if (object != 0)
                func_0206ec68(object);
            return 0;
        }
    }
    return 0;
}
