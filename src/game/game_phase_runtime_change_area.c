#include "tingle/game_phase_runtime.h"
#include "tingle/vec_fx32.h"

/*
 * Directional area-change logic for GamePhaseRuntime. It resolves an adjacent
 * area, constructs the transfer transform, and retargets all dependent actors.
 * The retail instruction schedule is retained in the matching assembly file.
 */

extern u8 gActorRuntimeCollection[];
extern void *gGamePhaseCurrencyHud;

#ifdef __cplusplus
extern "C" {
#endif
extern void *GamePhaseMetadata_GetByIndex(s32 areaId);
extern s32 func_020beb18(s32 value);
extern s32 func_020be8c0(s32 a, s32 b);
extern s32 func_020beb6c(s32 a, s32 b);
extern s32 func_020beae4(s32 value);
extern void *ActorMotionAreaFollower_GetPosition(void *object);
extern void ActorMotion_SetPosition(void *object, const void *transform);
extern void ActorRuntimeCollection_Reset(void *state);
extern void GamePhaseRuntime_CreateSecondaryActorSubsystem(GamePhaseRuntime *self, void *area, s32 enabled);
extern void GamePhaseState_ApplyAreaChange(void *state, void *area, const void *transform);
extern void ActorCollection_DispatchEventToActors(void *actor, const void *transform);
extern void TimedSpriteRecordPresentation_SpawnAndRegister(
    void *object, void *area);
extern void GamePhaseCurrencyHud_SetVisible(void *context, s32 enabled);
extern void GamePhaseRuntime_RefreshAreaAuxiliaryObject(GamePhaseRuntime *self, void *area, s32 enabled);
extern void GamePhaseAreaScene_SetOverlayObject(void *actor, void *object);
extern void GamePhaseAreaScene_SetEnabled(void *actor, s32 value);
extern void func_ov056_0220f054(void *object, const void *value);
extern void DualScreenUiStandardPresentation_BindSource(void *object, void *area);
extern void *GamePhaseRuntime_GetActorCollection(GamePhaseRuntime *self, s32 index);
#ifdef __cplusplus
}
#endif

/*
 * Change to the area neighboring the current area in direction 0..3. Returns
 * zero when the neighbor id is -1; otherwise returns one after replacing the
 * area at 0x30bc, transferring actor/scene state, queuing debug refresh bits,
 * updating the optional follower, and halving its two velocity components.
 */
s32 GamePhaseRuntime_ChangeToNeighborArea(GamePhaseRuntime *self, s32 direction)
{
    u8 *b = (u8 *)self;
    u8 optionalValue[12];
    VecFx32Object transform;
    VecFx32Object offset;
    u8 *oldArea = *(u8 **)(b + 0x30bc);
    s32 areaId = *(s16 *)(oldArea + 0x14 + direction * 2);
    s8 oldVariant = *(s8 *)(oldArea + 0x4c);
    u8 *area;
    s32 component;
    void *object;

    if (areaId == -1)
        return 0;

    area = (u8 *)GamePhaseMetadata_GetByIndex(areaId);
    *(u8 **)(b + 0x30bc) = area;
    VecFx32Object_Init(&offset);

    if (direction == 0 || direction == 1) {
        component = (s32)((u16)*(u32 *)(*(u8 **)(b + 0x2ed4) + 0x20) << 16);
        if (direction == 1)
            component = -component;
        component = func_020beb18(component);
        component = component > 0
            ? func_020be8c0(0x3f000000, component)
            : func_020beb6c(component, 0x3f000000);
        offset.value.x = func_020beae4(component);
    } else if (direction == 2 || direction == 3) {
        component = (s32)((*(u32 *)(*(u8 **)(b + 0x2ed4) + 0x20) >> 16) << 16);
        if (direction == 3)
            component = -component;
        component = func_020beb18(component);
        component = component > 0
            ? func_020be8c0(0x3f000000, component)
            : func_020beb6c(component, 0x3f000000);
        offset.value.y = func_020beae4(component);
    }

    VecFx32Object_InitCopy(
        &transform,
        (const VecFx32Object *)ActorMotionAreaFollower_GetPosition(b + 0x2fbc));
    VecFx32Object_Add(&transform, &offset);
    ActorMotion_SetPosition(b + 0x2fbc, &transform);

    object = *(void **)(b + 0x2ea8);
    if (object != 0 && (*(u32 *)((u8 *)object + 0x268) & 0x10) &&
        !(*(u32 *)((u8 *)object + 0x268) & 0x20))
        *(u16 *)((u8 *)object + 0x27e) = (u16)(areaId + 1);

    ActorRuntimeCollection_Reset(gActorRuntimeCollection);
    GamePhaseRuntime_CreateSecondaryActorSubsystem(self, area, 1);
    *(u32 *)(b + 0x30b8) |= 0x30;
    GamePhaseState_ApplyAreaChange(b + 0x24, area, &transform);
    ActorCollection_DispatchEventToActors(b + 0x28, &transform);

    if (*(s16 *)(area + 0x12) >= 0)
        TimedSpriteRecordPresentation_SpawnAndRegister(
            ActorMotionAreaFollower_GetPosition(b + 0x2fbc), area);

    GamePhaseCurrencyHud_SetVisible(gGamePhaseCurrencyHud, 1);
    *(u16 *)((u8 *)gGamePhaseCurrencyHud + 0xbc) = 250;
    *(u16 *)((u8 *)gGamePhaseCurrencyHud + 0xbe) = 30;

    if (oldVariant != *(s8 *)(area + 0x4c))
        GamePhaseRuntime_RefreshAreaAuxiliaryObject(self, area, 1);

    object = *(void **)(b + 0x2fb8);
    if (((*(u32 *)(area + 0x40) << 12) >> 30) == 1)
        GamePhaseAreaScene_SetOverlayObject(object, *(void **)(b + 0x30ec));
    else
        GamePhaseAreaScene_SetEnabled(object, 0);

    if (*(void **)(b + 0x30ec) != 0) {
        GamePhaseRuntime_InitScaledAreaCoordinates(optionalValue, self, area);
        func_ov056_0220f054(*(void **)(b + 0x30ec), optionalValue);
    }
    DualScreenUiStandardPresentation_BindSource(*(void **)(b + 0x30e8), area);
    *(void **)(b + 0x30f0) = *(void **)(b + 0x2ea4);

    object = GamePhaseRuntime_GetActorCollection(self, 1);
    VecFx32Object_Assign(
        (VecFx32Object *)((u8 *)object + 0x2e94),
        (const VecFx32Object *)((u8 *)*(void **)(
            (u8 *)*(void **)(b + 0x2fb8) + 0x2ebc) + 0x18));

    object = *(void **)((u8 *)*(void **)(b + 0x2fb8) + 0x2ebc);
    *(s32 *)((u8 *)object + 0x1c) =
        (*(s32 *)((u8 *)object + 0x1c) +
         ((u32)*(s32 *)((u8 *)object + 0x1c) >> 31)) >> 1;
    object = *(void **)((u8 *)*(void **)(b + 0x2fb8) + 0x2ebc);
    *(s32 *)((u8 *)object + 0x20) =
        (*(s32 *)((u8 *)object + 0x20) +
         ((u32)*(s32 *)((u8 *)object + 0x20) >> 31)) >> 1;
    object = *(void **)((u8 *)*(void **)(b + 0x2fb8) + 0x2ebc);
    *(s32 *)((u8 *)object + 0x24) = 0;

    VecFx32Object_Destroy(&transform);
    VecFx32Object_Destroy(&offset);
    return 1;
}
