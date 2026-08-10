#include "tingle/game_phase_script_vm.h"
#include "tingle/vec_fx32.h"

/*
 * Dispatch actor-script effect, snapshot, manager, and collection operations.
 * The snapshot and effect descriptor layouts are retained as byte offsets
 * because their concrete owning SDK/game types have not yet been confirmed.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_021052fc;
extern s32 data_0210570c;
extern s32 data_02105710;
extern u8 ActorBounds_GetWidth(const void *value);
extern u8 ActorBounds_GetHeight(const void *value);
extern void func_020066a4(void *destination, const void *source,
                          const void *transform);
extern void *func_0202d568(void *collection, s32 index);
extern void *func_0202ecd0(void *collection, const void *descriptor);
extern void ActorCollection_SpawnDescriptorsBySelector(
    void *collection, void *descriptors, s32 selector);
extern void *ActorCollection_FindActorByDescriptorValue(void *collection, s32 index);
extern void *Actor_GetCollisionCenter(VecFx32Object *destination, void *actor);
extern void *func_020337d4(void *actor);
extern void func_02038ecc(void *manager, s32 value);
extern s32 func_020397d4(void *manager);
extern void func_0204e3f4(s32 duration, s16 amount,
                          const VecFx32Object *position);
extern void func_0204f7e4(const VecFx32Object *position,
                          const void *descriptor, s32 duration);
extern void func_0204f854(const VecFx32Object *first,
                          const VecFx32Object *second,
                          const void *descriptor, s32 duration);
extern void func_02050078(s32 effect, const VecFx32Object *first,
                          const VecFx32Object *second);
extern void func_020627a0(void *descriptor, u16 type, s32 enabled);
#ifdef __cplusplus
}
#endif

void *func_02019890(void *descriptor, u16 type, s32 enabled);

/* Store a signed halfword through the retail signed-byte truncation. */
static s16 truncateSignedByte(s16 value)
{
    return (s8)value;
}

/*
 * Build and register the recovered actor snapshot descriptor used by mode 0.
 * This copies confirmed actor/presentation fields and transformed coordinates;
 * return the descriptor registration result through the collection callee.
 */
static void spawnActorSnapshot(GamePhaseActorScriptVm *self, s32 actorIndex,
                               s32 value, s32 descriptorValue)
{
    u8 descriptor[0x5c];
    VecFx32Object transform;
    VecFx32Object position;
    u8 *actor = (u8 *)ActorCollection_FindActorByDescriptorValue(func_020337d4(self->actor_84), actorIndex);
    u8 *presentation = *(u8 **)(actor + 0x54);
    s32 resource0 = 0x1000;
    s32 resource1 = 0x1001;
    s32 resource2 = 0x1002;
    u8 presentationMode = 2;
    u8 presentationValue = 0;

    if (presentation) {
        resource0 = *(s32 *)(*(u8 **)(presentation + 0x14) + 0x10);
        resource1 = *(s32 *)(*(u8 **)(presentation + 0x18) + 0x10);
        resource2 = *(s32 *)(*(u8 **)(presentation + 0x1c) + 0x10);
        presentationMode = (*(u8 *)(presentation + 0x3b) & 1) ? 1 : 2;
        presentationValue = *(u8 *)(presentation + 0x38);
    }

    *(u16 *)(descriptor + 0x00) = *(u8 *)(actor + 0x4d);
    *(u16 *)(descriptor + 0x02) = *(u16 *)(actor + 0x4e);
    *(s32 *)(descriptor + 0x04) = resource0;
    *(s32 *)(descriptor + 0x08) = resource1;
    *(s32 *)(descriptor + 0x0c) = resource2;
    descriptor[0x10] = presentationMode;
    descriptor[0x11] = presentationValue;
    descriptor[0x12] = ActorBounds_GetWidth(actor + 8);
    descriptor[0x13] = ActorBounds_GetHeight(actor + 8);

    Actor_GetCollisionCenter(&position, actor);
    func_020066a4(&transform, &position, actor + 0x18);
    func_02005058(&position);
    descriptor[0x14] = (u8)(transform.value.y >> 12);
    descriptor[0x15] = (u8)(transform.value.x >> 12);
    descriptor[0x16] = ActorBounds_GetWidth(actor + 4);
    descriptor[0x17] = ActorBounds_GetHeight(actor + 4);
    descriptor[0x18] = 0;
    descriptor[0x19] = 0;
    *(s16 *)(descriptor + 0x1a) = truncateSignedByte(*(s16 *)(actor + 0x68));
    *(s16 *)(descriptor + 0x1c) = truncateSignedByte(*(s16 *)(actor + 0x6a));
    *(s16 *)(descriptor + 0x1e) = truncateSignedByte(*(s16 *)(actor + 0x6c));
    *(s16 *)(descriptor + 0x20) = truncateSignedByte(*(s16 *)(actor + 0x6e));
    *(s16 *)(descriptor + 0x22) = (s16)(*(s32 *)(actor + 0x1c) >> 12);
    *(s16 *)(descriptor + 0x24) = (s16)(*(s32 *)(actor + 0x20) >> 12);
    *(s16 *)(descriptor + 0x26) = (s16)(*(s32 *)(actor + 0x24) >> 12);
    *(u32 *)(descriptor + 0x28) = *(u32 *)(actor + 0x14);
    *(s32 *)(descriptor + 0x2c) = descriptorValue;
    *(s32 *)(descriptor + 0x30) = 0;
    *(s32 *)(descriptor + 0x34) = 0;
    *(s32 *)(descriptor + 0x38) = 0;
    *(s16 *)(descriptor + 0x3c) =
        ((*(u32 *)(actor + 0x14) & 0x80) && presentation)
            ? *(u8 *)(presentation + 0x3a) : -1;
    *(s32 *)(descriptor + 0x40) = 0;
    *(s32 *)(descriptor + 0x44) = 0;
    *(s32 *)(descriptor + 0x48) = -1;
    *(s16 *)(descriptor + 0x4c) = -1;
    *(s16 *)(descriptor + 0x4e) = -1;
    *(s16 *)(descriptor + 0x50) = 0;
    *(s16 *)(descriptor + 0x52) = (s16)value;
    *(s32 *)(descriptor + 0x54) = -1;
    *(s32 *)(descriptor + 0x58) = 0;
    func_0202ecd0(func_020337d4(self->actor_84), descriptor);
    func_020127f8(&self->base, (u32)value);
    func_02005058(&transform);
}

/*
 * Pop seven parameters followed by mode.  Modes 0..7 respectively spawn an
 * actor snapshot, spawn one of two descriptor/effect forms, control the
 * runtime manager, emit one or two fx32-vector effects, select a collection
 * entry, remove an indexed entry, or run the two-vector descriptor effect.
 * Unsupported modes and an unavailable manager do nothing.  Return zero.
 */
s32 func_0201939c(GamePhaseActorScriptVm *self)
{
    s32 p0 = (s32)func_02012704(&self->base);
    s32 p1 = (s32)func_02012704(&self->base);
    s32 p2 = (s32)func_02012704(&self->base);
    s32 p3 = (s32)func_02012704(&self->base);
    s32 p4 = (s32)func_02012704(&self->base);
    s32 p5 = (s32)func_02012704(&self->base);
    s32 p6 = (s32)func_02012704(&self->base);
    s32 mode = (s32)func_02012704(&self->base);
    switch (mode) {
    case 0:
        spawnActorSnapshot(self, p6, p5, p4);
        break;
    case 1: {
        VecFx32Object position;
        func_0200500c(&position, p5 << 12, p4 << 12, p3 << 12);
        if (p6 >= 0xe4 && p6 <= 0xea) {
            static const s16 amounts[7] = {1, 5, 10, 20, 50, 100, 200};
            func_0204e3f4(300, amounts[p6 - 0xe4], &position);
        } else {
            u8 descriptor[0x24];
            func_02019890(descriptor, (u16)p6, 1);
            func_0204f7e4(&position, descriptor, 300);
        }
        func_02005058(&position);
        break;
    }
    case 2: {
        void *manager = *(void **)((u8 *)data_021052fc + 0x2ea4);
        if (func_020397d4(manager))
            func_02038ecc(manager, p6);
        break;
    }
    case 3: {
        VecFx32Object actorPosition;
        VecFx32Object offset;
        func_02005030(&actorPosition,
                      (const VecFx32Object *)((u8 *)self->actor_84 + 0x18));
        func_0200500c(&offset, p5 << 12, p4 << 12, p3 << 12);
        func_02050078(p6, &actorPosition, &offset);
        func_02005058(&offset);
        func_02005058(&actorPosition);
        break;
    }
    case 4: {
        s32 selection = (*(u32 *)((u8 *)self->actor_84 + 0x14) & 0x04000000)
                            ? data_02105710 : data_0210570c;
        ActorCollection_SpawnDescriptorsBySelector(
            func_020337d4(self->actor_84), (void *)selection, p6);
        break;
    }
    case 5:
        func_0202d568(func_020337d4(self->actor_84), p6);
        break;
    case 6: {
        VecFx32Object first;
        VecFx32Object second;
        func_0200500c(&first, p2 << 12, p1 << 12, p0 << 12);
        func_0200500c(&second, p5 << 12, p4 << 12, p3 << 12);
        func_02050078(p6, &first, &second);
        func_02005058(&second);
        func_02005058(&first);
        break;
    }
    case 7: {
        u8 descriptor[0x24];
        VecFx32Object first;
        VecFx32Object second;
        func_02019890(descriptor, (u16)p6, 1);
        func_0200500c(&first, p5 << 12, p4 << 12, p3 << 12);
        func_0200500c(&second, p2, p1, p0);
        func_0204f854(&first, &second, descriptor, 300);
        func_02005058(&second);
        func_02005058(&first);
        break;
    }
    }
    return 0;
}

/*
 * Initialize the recovered 0x24-byte effect descriptor's confirmed fields,
 * establish its self-linked nodes, call the external type initializer with
 * type/enabled, and return descriptor.
 */
void *func_02019890(void *descriptor, u16 type, s32 enabled)
{
    u8 *raw = (u8 *)descriptor;
    *(u16 *)(raw + 2) = 0;
    *(u16 *)(raw + 4) = 0;
    *(u16 *)(raw + 6) = 0;
    *(u32 *)(raw + 0x0c) = 0;
    *(u32 *)(raw + 0x10) = 0;
    *(void **)(raw + 0x14) = descriptor;
    *(u32 *)(raw + 0x18) = 1;
    *(void **)(raw + 0x1c) = descriptor;
    *(u32 *)(raw + 0x20) = 0;
    func_020627a0(descriptor, type, enabled);
    return descriptor;
}
