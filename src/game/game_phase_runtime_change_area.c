#include "tingle/game_phase_runtime.h"

/*
 * Directional area-change logic for GamePhaseRuntime. It resolves an adjacent
 * area, constructs the transfer transform, and retargets all dependent actors.
 * The retail instruction schedule is retained in the matching assembly file.
 */

extern u8 data_02105310[];
extern void *gLupyContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02028388(s32 areaId);
extern void func_02004fe0(void *value);
extern s32 func_020beb18(s32 value);
extern s32 func_020be8c0(s32 a, s32 b);
extern s32 func_020beb6c(s32 a, s32 b);
extern s32 func_020beae4(s32 value);
extern void *func_02009d78(void *object);
extern void func_02005030(void *destination, const void *source);
extern void func_020050c8(void *destination, const void *offset);
extern void func_020091d8(void *object, const void *transform);
extern void func_0200ae8c(void *state);
extern void GamePhaseRuntime_CreateSecondaryActorSubsystem(GamePhaseRuntime *self, void *area, s32 enabled);
extern void func_0200e714(void *state, void *area, const void *transform);
extern void ActorCollection_DispatchEventToActors(void *actor, const void *transform);
extern void func_02020060(void *object, void *area);
extern void func_0201140c(void *context, s32 enabled);
extern void GamePhaseRuntime_RefreshAreaAuxiliaryObject(GamePhaseRuntime *self, void *area, s32 enabled);
extern void func_02012528(void *actor, void *object);
extern void func_020122a0(void *actor, s32 value);
extern void func_ov056_0220f054(void *object, const void *value);
extern void func_02026174(void *object, void *area);
extern void *GamePhaseRuntime_GetActorCollection(GamePhaseRuntime *self, s32 index);
extern void func_020050a4(void *destination, const void *source);
extern void func_02005058(void *value);
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
    u8 transform[16];
    u8 offset[16];
    u8 *oldArea = *(u8 **)(b + 0x30bc);
    s32 areaId = *(s16 *)(oldArea + 0x14 + direction * 2);
    s8 oldVariant = *(s8 *)(oldArea + 0x4c);
    u8 *area;
    s32 component;
    void *object;

    if (areaId == -1)
        return 0;

    area = (u8 *)func_02028388(areaId);
    *(u8 **)(b + 0x30bc) = area;
    func_02004fe0(offset);

    if (direction == 0 || direction == 1) {
        component = (s32)((u16)*(u32 *)(*(u8 **)(b + 0x2ed4) + 0x20) << 16);
        if (direction == 1)
            component = -component;
        component = func_020beb18(component);
        component = component > 0
            ? func_020be8c0(0x3f000000, component)
            : func_020beb6c(component, 0x3f000000);
        *(s32 *)(offset + 4) = func_020beae4(component);
    } else if (direction == 2 || direction == 3) {
        component = (s32)((*(u32 *)(*(u8 **)(b + 0x2ed4) + 0x20) >> 16) << 16);
        if (direction == 3)
            component = -component;
        component = func_020beb18(component);
        component = component > 0
            ? func_020be8c0(0x3f000000, component)
            : func_020beb6c(component, 0x3f000000);
        *(s32 *)(offset + 8) = func_020beae4(component);
    }

    func_02005030(transform, func_02009d78(b + 0x2fbc));
    func_020050c8(transform, offset);
    func_020091d8(b + 0x2fbc, transform);

    object = *(void **)(b + 0x2ea8);
    if (object != 0 && (*(u32 *)((u8 *)object + 0x268) & 0x10) &&
        !(*(u32 *)((u8 *)object + 0x268) & 0x20))
        *(u16 *)((u8 *)object + 0x27e) = (u16)(areaId + 1);

    func_0200ae8c(data_02105310);
    GamePhaseRuntime_CreateSecondaryActorSubsystem(self, area, 1);
    *(u32 *)(b + 0x30b8) |= 0x30;
    func_0200e714(b + 0x24, area, transform);
    ActorCollection_DispatchEventToActors(b + 0x28, transform);

    if (*(s16 *)(area + 0x12) >= 0)
        func_02020060(func_02009d78(b + 0x2fbc), area);

    func_0201140c(gLupyContext, 1);
    *(u16 *)((u8 *)gLupyContext + 0xbc) = 250;
    *(u16 *)((u8 *)gLupyContext + 0xbe) = 30;

    if (oldVariant != *(s8 *)(area + 0x4c))
        GamePhaseRuntime_RefreshAreaAuxiliaryObject(self, area, 1);

    object = *(void **)(b + 0x2fb8);
    if (((*(u32 *)(area + 0x40) << 12) >> 30) == 1)
        func_02012528(object, *(void **)(b + 0x30ec));
    else
        func_020122a0(object, 0);

    if (*(void **)(b + 0x30ec) != 0) {
        GamePhaseRuntime_InitScaledAreaCoordinates(optionalValue, self, area);
        func_ov056_0220f054(*(void **)(b + 0x30ec), optionalValue);
    }
    func_02026174(*(void **)(b + 0x30e8), area);
    *(void **)(b + 0x30f0) = *(void **)(b + 0x2ea4);

    object = GamePhaseRuntime_GetActorCollection(self, 1);
    func_020050a4((u8 *)object + 0x2e94,
                  (u8 *)*(void **)((u8 *)*(void **)(b + 0x2fb8) + 0x2ebc) + 0x18);

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

    func_02005058(transform);
    func_02005058(offset);
    return 1;
}
