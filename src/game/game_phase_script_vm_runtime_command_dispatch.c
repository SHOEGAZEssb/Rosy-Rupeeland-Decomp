#include "tingle/game_phase_script_vm.h"
#include "tingle/heap.h"
#include "tingle/vec_fx32.h"

/* Dispatch the second large actor-script command family for runtime scenes, effects, flags, and queries. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern u8 data_021f3d68[];
extern const char data_020d5b3c[], data_020d5b44[], data_020d5b4c[];
extern const char data_020d5b54[], data_020d5b5c[], data_020d5b64[];
extern const char data_020d5b6c[], data_020d5b74[], data_020d5b7c[];
extern const char data_020d5b84[], data_020d5b8c[];
extern void OS_Halt(void);
extern void *ActorMotionAreaFollower_GetPosition(...);
extern void *ActorCollection_FindActorByDescriptorValue(...);
extern void *Actor_GetCollection(...);
extern void *func_02098490(...);
extern void *func_0209d774(...);
extern void *func_0209f2f8(...);
extern void *func_0209fd50(...);
extern void *func_020a042c(...);
extern void *func_020200bc(...);
extern void *func_0201cfd0(...);
extern void *func_0206ec68(...);
extern void *GamePhaseLoadScene_Init(...);
extern void func_0201ded4(...);
extern u8 *func_02079a7c(...);
#ifdef __cplusplus
}
#endif

static void *allocCommandObject(u32 size, const char *tag)
{
    return Heap_Alloc(size, tag, 4, &gHeapContext);
}

/*
 * Pop a parameter and selector, dispatch selectors 0..82, and return zero.
 * Confirmed paths create runtime scenes/effects, register an effect relative
 * to the active actor, modify actor presentation flags, or push queried data.
 * Unsupported selectors halt. Most simple selectors map to a kind passed with
 * the parameter to a 0x9c-byte GamePhaseLoadScene object. Selector 18 reaches that
 * path with the incoming r7 value in retail; portable C uses zero while the
 * matching assembly preserves the register-dependent behavior.
 */
s32 func_02016238(GamePhaseActorScriptVm *self)
{
    u32 parameter = func_02012704(&self->base);
    u32 selector = func_02012704(&self->base);
    u32 kind = 0;
    void *object;

    switch (selector) {
    case 1: kind = 2; break;
    case 3: kind = 5; break;
    case 4: kind = 6; break;
    case 5: kind = 16; break;
    case 8: kind = 1; break;
    case 10: kind = 8; break;
    case 12: kind = 13; break;
    case 13: kind = 10; break;
    case 14: kind = 11; break;
    case 17: kind = 12; break;
    case 18: break; /* Retail forwards the incoming r7 register. */
    case 20: kind = 15; break;
    case 22: kind = 17; break;
    case 23: kind = 19; break;
    case 24: kind = 18; break;
    case 25: kind = 20; break;
    case 29: kind = 21; break;
    case 30: kind = 22; break;
    case 38: kind = 23; break;
    case 39: kind = 24; break;
    case 40: kind = 25; break;

    case 21:
        object = allocCommandObject(0x30, data_020d5b3c);
        if (object != 0)
            func_02098490(object);
        return 0;
    case 60:
    case 64:
        object = allocCommandObject(0x38,
            selector == 60 ? data_020d5b44 : data_020d5b4c);
        if (object != 0)
            func_0209d774(object, selector == 60 ? 1 : 2);
        return 0;
    case 61:
    case 65:
        object = allocCommandObject(0x38, data_020d5b54);
        if (object != 0)
            func_0209f2f8(object, 1);
        return 0;
    case 62:
    case 66:
        object = allocCommandObject(0x5c,
            selector == 62 ? data_020d5b5c : data_020d5b64);
        if (object != 0)
            func_0209fd50(object, selector == 62 ? 1 : 2);
        return 0;
    case 80:
    case 81:
    case 82:
        object = allocCommandObject(0x58, data_020d5b6c);
        if (object != 0)
            func_020a042c(object, 1);
        return 0;

    case 11: {
        u8 *runtime = (u8 *)data_021052fc;
        u8 *actor = *(u8 **)(runtime + 0x2ea4);
        VecFx32Object position;
        s32 x, y;
        func_02005030(&position,
                      (const VecFx32Object *)ActorMotionAreaFollower_GetPosition(runtime + 0x2fbc));
        x = (*(s32 *)(actor + 0x1c) >> 12) - (position.value.y >> 12);
        y = (*(s32 *)(actor + 0x20) >> 12) - (*(s32 *)(actor + 0x24) >> 12)
            - (position.value.z >> 12) - 16;
        object = allocCommandObject(0x1c, data_020d5b74);
        if (object != 0)
            object = func_020200bc(object, parameter, x, y, 30);
        func_0201ded4(runtime + 0x2f7c, object);
        func_02005058(&position);
        return 0;
    }
    case 15:
        object = allocCommandObject(0x2c, data_020d5b7c);
        if (object != 0)
            func_0201cfd0(object, parameter);
        return 0;
    case 26:
        *(u16 *)((u8 *)*(void **)((u8 *)self->actor_84 + 0x54) + 0x24)
            |= (u16)parameter;
        return 0;
    case 27:
        *(u16 *)((u8 *)*(void **)((u8 *)self->actor_84 + 0x54) + 0x24)
            &= (u16)~parameter;
        return 0;
    case 31:
    case 32:
    case 33: {
        u8 *actor = (u8 *)ActorCollection_FindActorByDescriptorValue(Actor_GetCollection(self->actor_84),
                                        parameter);
        u8 *presentation = actor != 0 ? *(u8 **)(actor + 0x54) : 0;
        if (presentation != 0) {
            u32 offset = selector == 31 ? 0x14 : selector == 32 ? 0x18 : 0x1c;
            func_020127f8(&self->base,
                          *(u32 *)(*(u8 **)(presentation + offset) + 0x10));
        }
        return 0;
    }
    case 34:
        object = allocCommandObject(0x38, data_020d5b84);
        if (object != 0)
            func_0206ec68(object);
        return 0;
    case 35:
    case 36:
    case 37: {
        u8 *record = func_02079a7c(data_021f3d68, parameter);
        if (selector == 35)
            func_020127f8(&self->base, *(u16 *)(record + 0x12));
        else if (selector == 36)
            func_020127f8(&self->base, *(u16 *)(record + 0x14));
        else
            func_020127f8(&self->base, *(u16 *)(record + 0x10) & 0xff);
        return 0;
    }
    default:
        OS_Halt();
        return 0;
    }

    object = allocCommandObject(0x9c, data_020d5b8c);
    if (object != 0)
        GamePhaseLoadScene_Init(object, kind, parameter);
    return 0;
}
