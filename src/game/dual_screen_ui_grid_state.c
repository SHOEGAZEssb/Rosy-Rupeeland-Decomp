#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Manage the embedded sprite grid used by the dual-screen UI presentations.
 * The state owns four descriptors, twenty grid sprites and four auxiliary
 * sprites through a debug-font sprite owner.  It follows a runtime object,
 * animates a target count, manages progress/sound sprites, and applies a damped
 * spring angle to two auxiliary sprites.
 */

typedef struct GridMotion {
    s32 position00;
    s32 velocity04;
    s32 acceleration08;
    s32 smoothing0c;
} GridMotion;

typedef struct GridResourceDescriptor {
    void **vtable00;
    s32 resource04;
    s32 palette08;
    s32 animation0c;
} GridResourceDescriptor;

typedef struct DualScreenUiGridState {
    u8 *spriteOwner00;
    GridResourceDescriptor *descriptor04;
    GridResourceDescriptor *descriptor08;
    GridResourceDescriptor *runtimeDescriptor0c;
    GridResourceDescriptor *descriptor10;
    u8 *gridSprites14[20];
    u8 *auxiliary64;
    u8 *auxiliary68;
    u8 *runtimeSprite6c;
    u8 *progressSprite70;
    s16 runtimeId74;
    s16 animationCounter76;
    s16 target78;
    s16 targetDelay7a;
    GridMotion motion7c;
    u8 flags8c;
    u8 soundCount8d;
    s16 visibleCount8e;
    u8 cachedFrames90[20];
} DualScreenUiGridState;

typedef void *(*ObjectDestructor)(void *);
typedef s32 (*RuntimePredicate)(void *);

#ifdef __cplusplus
extern "C" {
#endif
extern const char data_020d6b58[];
extern const u8 data_020c3704[];
extern u8 *data_021052fc;
extern u8 gActorRuntimeCollection[];
extern void *gDebugFont;
extern void *gSoundContext;
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void GraphicsSpriteGroupOwner_DestroyGroup(void *, void *);
extern void GraphicsSpriteGroup_Clear(void *);
extern void GraphicsSpriteGroup_ReleaseState(void *, void *);
extern void GraphicsSpriteGroup_AdvanceAnimations(void *);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void *AnimationResource_Init(void *, s32, s32, s32);
extern u8 *GraphicsSpriteState_Create(void *, void *, s32, s32, s32, s32, s32);
extern void GraphicsSpriteState_SetAnimationIndex(void *, s32);
extern s32 func_020befec(s32, s32);
extern s32 Type7Actor_GetStateCode(void *);
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(void *);
extern s32 ActorRuntimeCollection_GetBusyState(void *);
extern s32 func_020adc90(s32, s32);
extern void Sound_Play(void *, s32, s32);
extern void func_02025cd0(void *, s32);
#ifdef __cplusplus
}
#endif

void func_02026514(DualScreenUiGridState *self);
void func_02026588(DualScreenUiGridState *self, s32 alternateMode);
s32 func_020269a4(u8 *runtime);
void func_02026e44(DualScreenUiGridState *self);
void func_02026ed4(DualScreenUiGridState *self);

static void destroy_object(void *object)
{
    if (object)
        ((ObjectDestructor)(*(void ***)object)[1])(object);
}

/* Store four recovered motion words from registers and the fifth stack value. */
void func_020264b0(GridMotion *self, s32 position, s32 scale,
                   s32 velocity, s32 damping)
{
    self->position00 = position;
    self->velocity04 = scale;
    self->acceleration08 = velocity;
    self->smoothing0c = damping;
}

/*
 * Initialize an empty grid: runtimeId=-1, counters zero, motion
 * (0,0,0,0x1800), flags/sound count zero, and no sprite owner. Return self.
 */
DualScreenUiGridState *func_020264c4(DualScreenUiGridState *self)
{
    self->runtimeId74 = -1;
    self->animationCounter76 = 0;
    func_020264b0(&self->motion7c, 0, 0, 0, 0x1800);
    self->flags8c = 0;
    self->soundCount8d = 0;
    self->spriteOwner00 = 0;
    return self;
}

/*
 * Disable the embedded state through func_02025cd0. If an owner exists, clear
 * its sprites, destroy all four descriptors, release the debug-font owner, and
 * null it. Finally restore runtimeId74 to -1.
 */
void func_02026514(DualScreenUiGridState *self)
{
    s32 index;
    func_02025cd0(self, 0);
    if (self->spriteOwner00) {
        GraphicsSpriteGroup_Clear(self->spriteOwner00);
        for (index = 0; index < 4; index++)
            destroy_object(((void **)&self->descriptor04)[index]);
        GraphicsSpriteGroupOwner_DestroyGroup(gDebugFont, self->spriteOwner00);
        self->spriteOwner00 = 0;
    }
    self->runtimeId74 = -1;
}

/*
 * Rebuild the grid for the runtime object at root offset 0x2ea8. Retain its ID
 * halfword 0x4e. With an existing owner, release only runtimeSprite6c and its
 * runtime descriptor. Otherwise acquire the debug-font owner, allocate fixed
 * descriptors 0x32b2..0x32b4 and (0x32b5,0x32b3,0x32b6), create twenty mode-2
 * grid sprites in a 4x5 layout beginning at (207,106), create auxiliaries at
 * (216,49)/(216,50), allocate descriptor 0x1664..0x1666 and progress sprite at
 * (216,89). Always rebuild runtimeDescriptor0c from runtime subobject 0x29c
 * halfwords 0x1a/1c/1e and runtimeSprite6c at (216,49).
 *
 * Set target from (progress+99)/100 in alternate mode or zero otherwise,
 * visibleCount from runtime offset 0x200 divided by 300, expose that many grid
 * sprites, hide the rest, reset cached frames to 0xff, and either initialize
 * spring scale 0x6000 plus runtime activation checks or assign clamped groups
 * of three initial frames in alternate mode.
 */
void func_02026588(DualScreenUiGridState *self, s32 alternateMode)
{
    u8 *runtime = *(u8 **)(data_021052fc + 0x2ea8);
    s32 index;
    self->runtimeId74 = *(u16 *)(runtime + 0x4e);
    if (self->spriteOwner00) {
        GraphicsSpriteGroup_ReleaseState(self->spriteOwner00, self->runtimeSprite6c);
        destroy_object(self->runtimeDescriptor0c);
    } else {
        self->spriteOwner00 = (u8 *)GraphicsSpriteGroupOwner_CreateGroup(gDebugFont);
        self->descriptor04 = (GridResourceDescriptor *)Heap_Alloc(
            0x10, data_020d6b58, 4, &gHeapContext);
        if (self->descriptor04)
            AnimationResource_Init(self->descriptor04, 0x32b2, 0x32b3, 0x32b4);
        self->descriptor08 = (GridResourceDescriptor *)Heap_Alloc(
            0x10, data_020d6b58, 4, &gHeapContext);
        if (self->descriptor08)
            AnimationResource_Init(self->descriptor08, 0x32b5, 0x32b3, 0x32b6);
        for (index = 0; index < 20; index++) {
            self->gridSprites14[index] = GraphicsSpriteState_Create(
                self->spriteOwner00, self->descriptor08, 2, 0, 0, 0, 2);
            *(u16 *)(self->gridSprites14[index] + 0x2c) =
                (u16)(207 + (index & 3) * 12);
            *(u16 *)(self->gridSprites14[index] + 0x2e) =
                (u16)(106 + (index / 4) * 15);
        }
        self->auxiliary64 = GraphicsSpriteState_Create(
            self->spriteOwner00, self->descriptor04, 1, 0, 0, 2, 0);
        *(u16 *)(self->auxiliary64 + 0x2c) = 216;
        *(u16 *)(self->auxiliary64 + 0x2e) = 49;
        self->auxiliary68 = GraphicsSpriteState_Create(
            self->spriteOwner00, self->descriptor04, 0, 0, 0x40, 2, 0);
        *(u16 *)(self->auxiliary68 + 0x2c) = 216;
        *(u16 *)(self->auxiliary68 + 0x2e) = 50;
        self->descriptor10 = (GridResourceDescriptor *)Heap_Alloc(
            0x10, data_020d6b58, 4, &gHeapContext);
        if (self->descriptor10)
            AnimationResource_Init(self->descriptor10, 0x1664, 0x1665, 0x1666);
        self->progressSprite70 = GraphicsSpriteState_Create(
            self->spriteOwner00, self->descriptor10, 1, 0, 0, 0, 2);
        *(u16 *)(self->progressSprite70 + 0x2c) = 216;
        *(u16 *)(self->progressSprite70 + 0x2e) = 89;
        self->soundCount8d = 0;
    }

    self->runtimeDescriptor0c = (GridResourceDescriptor *)Heap_Alloc(
        0x10, data_020d6b58, 4, &gHeapContext);
    if (self->runtimeDescriptor0c) {
        u8 *record = *(u8 **)(runtime + 0x29c);
        AnimationResource_Init(self->runtimeDescriptor0c,
                      *(u16 *)(record + 0x1a), *(u16 *)(record + 0x1c),
                      *(u16 *)(record + 0x1e));
    }
    self->runtimeSprite6c = GraphicsSpriteState_Create(
        self->spriteOwner00, self->runtimeDescriptor0c, 0, 0, 0x20, 0, 2);
    *(u16 *)(self->runtimeSprite6c + 0x2c) = 216;
    *(u16 *)(self->runtimeSprite6c + 0x2e) = 49;
    self->target78 = alternateMode
        ? (s16)func_020befec(*(s32 *)(runtime + 0x1fc) + 99, 100) : 0;
    self->targetDelay7a = 1;
    self->animationCounter76 = 0;
    self->visibleCount8e =
        (s16)func_020befec(*(s32 *)(runtime + 0x200), 300);
    for (index = 0; index < 20; index++) {
        if (index < self->visibleCount8e)
            *(u16 *)(self->gridSprites14[index] + 0x24) &= (u16)~4;
        else
            *(u16 *)(self->gridSprites14[index] + 0x24) |= 4;
        self->cachedFrames90[index] = 0xff;
    }
    if (!alternateMode) {
        self->motion7c.velocity04 = 0x6000;
        self->motion7c.position00 = 0;
        self->motion7c.acceleration08 = 0;
        func_02026e44(self);
        if (func_020269a4(runtime)) {
            self->flags8c &= (u8)~1;
            *(u32 *)(self->spriteOwner00 + 0x20) = 1;
        }
    } else {
        s32 remaining = self->target78;
        for (index = 0; index < 20; index++, remaining -= 3) {
            s32 frame = remaining > 3 ? 3 : (remaining < 0 ? 0 : remaining);
            GraphicsSpriteState_SetAnimationIndex(self->gridSprites14[index],
                          data_020c3704[frame]);
            *(u16 *)(self->gridSprites14[index] + 0x24) &= (u16)~1;
            self->cachedFrames90[index] = (u8)frame;
        }
    }
}

/* Set velocity04, clear position00/acceleration08, and preserve smoothing0c. */
void func_02026990(GridMotion *self, s32 scale)
{
    self->velocity04 = scale;
    self->position00 = 0;
    self->acceleration08 = 0;
}

/*
 * Return one only when runtime subobject 0x29c flag bit 5 and runtime flag
 * 0x268 bit 4 are both set and Type7Actor_GetStateCode(runtime) does not return 5.
 */
s32 func_020269a4(u8 *runtime)
{
    u8 *record = *(u8 **)(runtime + 0x29c);
    if ((*(u16 *)(record + 0x38) & 0x20) == 0) return 0;
    if ((*(u32 *)(runtime + 0x268) & 0x10) == 0) return 0;
    return Type7Actor_GetStateCode(runtime) != 5;
}

static s32 rounded_fx_mul(s32 first, s32 second)
{
    return (s32)(((s64)first * second + 0x800) >> 12);
}

/*
 * Skip while flags8c bit 0 is set. Synchronize allocation against the runtime
 * pointer/ID/predicate, rebuilding or tearing down as needed. For active valid
 * runtime state, converge target78 toward (progress+99)/100 with a one-frame
 * delay, refresh completed grid animations, drive the runtime/progress sprites
 * and sound 0x71, integrate the recovered damped spring, publish its angle to
 * runtimeSprite6c/auxiliary68, mirror a runtime virtual predicate into flags8c
 * bit 1, and update the sprite owner. Invalid state hides the owner through
 * GraphicsSpriteGroup_ReleaseIndexedEntries before the final update.
 */
void func_020269f8(DualScreenUiGridState *self)
{
    u8 *runtime;
    s32 active;
    s32 progressFrame = 0;
    s32 desiredTarget;
    if (self->flags8c & 1) return;
    runtime = *(u8 **)(data_021052fc + 0x2ea8);
    active = self->spriteOwner00 && *(u32 *)(self->spriteOwner00 + 0x20);
    if (active) {
        if (!runtime) func_02026514(self);
        else if (self->runtimeId74 != *(u16 *)(runtime + 0x4e)) {
            if (func_020269a4(runtime)) func_02026588(self, 1);
            else func_02026514(self);
        }
    } else if (runtime && func_020269a4(runtime)) {
        func_02026588(self, 1);
    }
    if (!self->spriteOwner00) return;
    if (!runtime || (self->flags8c & 1) || !func_020269a4(runtime)) {
        GraphicsSpriteGroup_ReleaseIndexedEntries(self->spriteOwner00);
        GraphicsSpriteGroup_AdvanceAnimations(self->spriteOwner00);
        return;
    }

    *(u32 *)(self->spriteOwner00 + 0x20) = 1;
    desiredTarget = func_020befec(*(s32 *)(runtime + 0x1fc) + 99, 100);
    if (self->targetDelay7a > 0) self->targetDelay7a--;
    else if (self->target78 != desiredTarget) {
        self->targetDelay7a = 1;
        self->target78 += self->target78 > desiredTarget ? -1 : 1;
        func_02026e44(self);
    }
    func_02026ed4(self);
    if (((RuntimePredicate)(*(void ***)runtime)[42])(runtime) &&
        !(self->flags8c & 2))
        func_02026990(&self->motion7c, 0x6000);

    if (*(s32 *)(runtime + 0x1fc) <= 300) {
        *(u16 *)(self->progressSprite70 + 0x24) &= (u16)~4;
        progressFrame = func_020befec(*(s32 *)(runtime + 0x1fc) * 90, 300);
        if (self->runtimeSprite6c[0x38] != 1) {
            GraphicsSpriteState_SetAnimationIndex(self->runtimeSprite6c, 1);
            *(u16 *)(self->runtimeSprite6c + 0x24) &= (u16)~1;
            GraphicsSpriteState_SetAnimationIndex(self->progressSprite70, 0);
            *(u16 *)(self->progressSprite70 + 0x24) &= (u16)~1;
            if (self->soundCount8d < 4) {
                if (self->soundCount8d != 0 &&
                    !ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) &&
                    !ActorRuntimeCollection_GetBusyState(gActorRuntimeCollection))
                    Sound_Play(gSoundContext, 0, 0x71);
                self->soundCount8d++;
            }
        } else if ((*(u16 *)(self->runtimeSprite6c + 0x24) & 1) != 0) {
            if (++self->animationCounter76 > progressFrame) {
                self->animationCounter76 = 0;
                *(u16 *)(self->runtimeSprite6c + 0x24) &= (u16)~1;
                GraphicsSpriteState_SetAnimationIndex(self->runtimeSprite6c, 0);
                *(u16 *)(self->progressSprite70 + 0x24) &= (u16)~1;
                GraphicsSpriteState_SetAnimationIndex(self->progressSprite70, 0);
            }
        }
    } else {
        *(u16 *)(self->progressSprite70 + 0x24) |= 4;
        self->soundCount8d = 0;
        if (self->runtimeSprite6c[0x38] != 0) {
            GraphicsSpriteState_SetAnimationIndex(self->runtimeSprite6c, 0);
            *(u16 *)(self->runtimeSprite6c + 0x24) &= (u16)~1;
        }
    }

    self->motion7c.position00 +=
        rounded_fx_mul(self->motion7c.velocity04, 0x1800);
    self->motion7c.velocity04 +=
        rounded_fx_mul(self->motion7c.acceleration08, 0x1800);
    self->motion7c.acceleration08 = func_020adc90(
        rounded_fx_mul(self->motion7c.velocity04, (s32)0xfffffccd) +
        rounded_fx_mul(self->motion7c.position00, (s32)0xfffffccd >> 2),
        self->motion7c.smoothing0c);
    *(u16 *)(self->runtimeSprite6c + 0x30) =
        (u16)(self->motion7c.position00 / 8);
    *(u16 *)(self->auxiliary68 + 0x30) =
        *(u16 *)(self->runtimeSprite6c + 0x30);
    if (((RuntimePredicate)(*(void ***)runtime)[42])(runtime))
        self->flags8c |= 2;
    else
        self->flags8c &= (u8)~2;
    GraphicsSpriteGroup_AdvanceAnimations(self->spriteOwner00);
}

/* Return field 0xd0 bit 7 from the supplied larger UI-derived object. */
s32 func_02026e38(const u8 *self)
{
    return *(const u32 *)(self + 0xd0) & 0x80;
}

/*
 * Redistribute target78 across twenty groups of three. Clamp each desired
 * cached state to 0..3; when it changes, use the transition frame at table
 * index state+4, otherwise the steady frame at index state. Update sprites only
 * when their current byte-0x38 frame differs, and clear completion bit 0.
 */
void func_02026e44(DualScreenUiGridState *self)
{
    s32 remaining = self->target78;
    s32 index;
    for (index = 0; index < 20; index++, remaining -= 3) {
        s32 state = remaining > 3 ? 3 : (remaining < 0 ? 0 : remaining);
        s32 tableIndex = state;
        if (self->cachedFrames90[index] != state) {
            self->cachedFrames90[index] = (u8)state;
            tableIndex += 4;
        }
        if (self->gridSprites14[index][0x38] != data_020c3704[tableIndex]) {
            GraphicsSpriteState_SetAnimationIndex(self->gridSprites14[index],
                          data_020c3704[tableIndex]);
            *(u16 *)(self->gridSprites14[index] + 0x24) &= (u16)~1;
        }
    }
}

/*
 * For each grid sprite whose completion bit 0 is set, select the steady frame
 * indexed by cachedFrames90 and clear the completion bit.
 */
void func_02026ed4(DualScreenUiGridState *self)
{
    s32 index;
    for (index = 0; index < 20; index++) {
        if (*(u16 *)(self->gridSprites14[index] + 0x24) & 1) {
            GraphicsSpriteState_SetAnimationIndex(self->gridSprites14[index],
                          data_020c3704[self->cachedFrames90[index]]);
            *(u16 *)(self->gridSprites14[index] + 0x24) &= (u16)~1;
        }
    }
}
