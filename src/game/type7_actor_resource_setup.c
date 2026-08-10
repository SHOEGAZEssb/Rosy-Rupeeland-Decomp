#include "tingle/types.h"

/* Recovered descriptor-driven resource setup for the type-seven actor. */
extern void *data_020f4e18[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071ee0(void *output, void *context, u32 first, u32 second,
                          u32 third);
extern void *Actor_GetCollection(void *actor);
extern void *ActorCollection_GetSpriteOwner(void *value);
extern void *func_02073fc4(void *context, void *first, void *second, void *third,
                          u32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Inputs are actor and descriptor. Call func_02071ee0 for actor fields
 * +0x1f0/+0x1f4/+0x1f8 using data_020f4e18[0] and descriptor words +4/+8/+0xc,
 * then set bit 0x01000000 at +0x28 in the object stored at actor +0x1f0.
 * Transform Actor_GetCollection(actor) through ActorCollection_GetSpriteOwner and pass that result,
 * the three actor fields, and descriptor byte +0x10 to func_02073fc4; store its
 * result at actor +0x54. Invoke actor vtable +0x14. When actor +0x14 bit 0x80
 * is set, copy the low byte of signed descriptor halfword +0x3c to created
 * object byte +0x3a. Returns no meaningful value; resource, virtual, and actor
 * state may change and the helper calls may affect rendering resources.
 */
void Type7Actor_SetupResources(void *self, const void *descriptor)
{
    u8 *actor = (u8 *)self;
    const u8 *record = (const u8 *)descriptor;
    void *context;
    void *resource;
    func_02071ee0(actor + 0x1f0, data_020f4e18[0],
                  *(const u32 *)(record + 4), *(const u32 *)(record + 8),
                  *(const u32 *)(record + 0x0c));
    *(u32 *)((u8 *)*(void **)(actor + 0x1f0) + 0x28) |= 0x01000000;
    context = ActorCollection_GetSpriteOwner(Actor_GetCollection(actor));
    resource = func_02073fc4(context, *(void **)(actor + 0x1f0),
                             *(void **)(actor + 0x1f4),
                             *(void **)(actor + 0x1f8), record[0x10]);
    *(void **)(actor + 0x54) = resource;
    (*(void (**)(void *))(*(u8 **)actor + 0x14))(actor);
    if ((*(u32 *)(actor + 0x14) & 0x80) != 0)
        *((u8 *)resource + 0x3a) = (u8)*(const s16 *)(record + 0x3c);
}
