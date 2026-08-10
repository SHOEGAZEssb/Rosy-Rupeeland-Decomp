#include "tingle/types.h"

/* Select type-1 actor attachment resources, animations, flags, and scale. */
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Actor_GetCollection(void *actor);
extern void *ActorCollection_GetSpriteOwner(void *collection);
extern void func_020740c8(void *collectionData, void *attachment, u32 first,
                          u32 second, u32 third);
extern void func_02072b68(void *attachment, u32 animation);
extern s32 GameWork_TestFlag(void *work, u32 flag);
extern void ActorDerivedType1_ApplyResourceIndex(void *actor, u32 index);
#ifdef __cplusplus
}
#endif

/* Apply one resource descriptor directly to the primary attachment. */
static void applyDescriptor(u8 *actor, const u8 *resource)
{
    func_020740c8(ActorCollection_GetSpriteOwner(Actor_GetCollection(actor)),
                  *(void **)(actor + 0x54), *(u32 *)(resource + 4),
                  *(u32 *)(resource + 8), *(u32 *)(resource + 0x0c));
}

/*
 * Return immediately for actor state s16 +0xd6 equal to 15. If override
 * resource +0x274 exists, apply it and choose direction-based animation/flags
 * from +0xda/+0xd6, then set attachment halfword +0x36 to 0x300 when byte
 * +0x26b is nonzero or 0x100 otherwise. Without that override, map states
 * 0..17 plus substate +0xda and mode +0x250 to a resource index, animation,
 * flag-set/clear masks, and scale. GameWork flag 0x25d with resource +0x22c
 * overrides the selected indexed resource. Apply any nonnegative resource and
 * animation, OR/set then clear attachment flags at +0x24, and store scale at
 * +0x36. Returns no value; resource and animation helpers update presentation
 * and SDK-managed attachment state.
 */
void ActorDerivedType1_UpdateAttachmentPresentation(void *self)
{
    u8 *actor = (u8 *)self;
    u8 *attachment = *(u8 **)(actor + 0x54);
    s32 state = *(s16 *)(actor + 0xd6);
    s32 substate;
    s32 resourceIndex = -1;
    s32 animation = -1;
    u16 scale = 0x100;
    u16 setMask = 2;
    u16 clearMask = 1;
    u8 *resource;

    if (state == 15) return;
    resource = *(u8 **)(actor + 0x274);
    if (resource != 0) {
        applyDescriptor(actor, resource);
        if (*(s16 *)(actor + 0xda) == 7) {
            animation = actor[0xd4] + 0x10;
            *(u16 *)(attachment + 0x24) &= (u16)~2;
            *(u16 *)(attachment + 0x24) &= (u16)~1;
        } else {
            animation = actor[0xd4];
            if (state == 1 || state == 2) animation += 8;
            *(u16 *)(attachment + 0x24) |= 2;
            *(u16 *)(attachment + 0x24) &= (u16)~1;
        }
        func_02072b68(attachment, animation & 0xff);
        *(u16 *)(attachment + 0x36) = actor[0x26b] != 0 ? 0x300 : 0x100;
        return;
    }

    substate = *(s16 *)(actor + 0xda);
    switch (state) {
    case 1:
    case 2:
    case 5:
    case 6:
        switch (substate) {
        case 4:
        case 5: resourceIndex = 1; animation = actor[0xd4] + 6; break;
        case 6: resourceIndex = 8; animation = actor[0xd4]; break;
        case 2: resourceIndex = 6; animation = actor[0xd4]; break;
        case 3: resourceIndex = 0; animation = actor[0xd4] + 0x14; break;
        default:
            resourceIndex = 0;
            if (state == 1) {
                animation = actor[0xd4] + 8;
                setMask = 0;
                clearMask = 3;
                scale = 0;
            } else if (state == 2) {
                animation = actor[0xd4] + 8;
            } else {
                animation = actor[0xd4];
                scale = 0x120;
            }
            break;
        }
        break;
    case 3: resourceIndex = 2; animation = 4; break;
    case 4: resourceIndex = 2; animation = 0x1c; break;
    case 7:
        resourceIndex = 7; animation = actor[0xd4] + 0x10;
        setMask = 0; clearMask = 3;
        break;
    case 8:
    case 17:
        if (substate == 1) {
            setMask = 0;
            clearMask = 3;
            resourceIndex = 7;
            switch (*(s16 *)(actor + 0x250)) {
            case 2: animation = actor[0xd4] + 0x18; break;
            case 3: animation = 0x31; break;
            default: animation = actor[0xd4] + 0x20; break;
            }
        } else {
            resourceIndex = 7;
            switch (*(s16 *)(actor + 0x250)) {
            case 2: animation = actor[0xd4]; break;
            case 3: animation = 0x32; break;
            default: animation = actor[0xd4] + 8; break;
            }
        }
        break;
    case 9:
    case 10:
        if (substate == 3) {
            resourceIndex = 0; animation = actor[0xd4] + 0x14;
        } else {
            resourceIndex = 7; animation = actor[0xd4] + 0x28;
            setMask = 0; clearMask = 3;
        }
        break;
    case 11:
        if (substate == 3) {
            resourceIndex = 0; animation = actor[0xd4] + 0x14;
        } else {
            resourceIndex = 2; animation = actor[0xd4] + 0x14;
            setMask = 0; clearMask = 3;
        }
        break;
    case 12:
        if (GameWork_TestFlag(gGameWork, 0x25d) != 0) {
            resourceIndex = 0; animation = actor[0xd4] + 8;
        } else {
            resourceIndex = 5; animation = actor[0xd4] + 9;
        }
        break;
    case 13: resourceIndex = 0; animation = 0x11; break;
    case 14: resourceIndex = 6; animation = 0; break;
    case 16: resourceIndex = 6; animation = 0x2a; break;
    default: break;
    }

    resource = 0;
    if (GameWork_TestFlag(gGameWork, 0x25d) != 0)
        resource = *(u8 **)(actor + 0x22c);
    if (resource != 0)
        applyDescriptor(actor, resource);
    else if (resourceIndex >= 0)
        ActorDerivedType1_ApplyResourceIndex(actor, (u32)resourceIndex);
    if (animation >= 0) func_02072b68(attachment, (u32)animation & 0xff);
    *(u16 *)(attachment + 0x24) |= setMask;
    *(u16 *)(attachment + 0x24) &= (u16)~clearMask;
    *(u16 *)(attachment + 0x36) = scale;
}
