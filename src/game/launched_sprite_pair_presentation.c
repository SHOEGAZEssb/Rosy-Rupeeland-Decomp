#include "tingle/heap.h"
#include "tingle/types.h"

/*
 * Present one mandatory sprite and an optional vertically offset companion.
 * After an initial delay and flag-controlled transition, the pair changes
 * resources, waits for an animation, then follows an accelerating, horizontally
 * oscillating trajectory until it leaves the visible area.
 */

typedef struct PresentationVector {
    u32 field00;
    s32 x04;
    s32 y08;
    s32 z0c;
} PresentationVector;

typedef struct LaunchedSpritePairPresentation {
    void **vtable00;
    u32 field04;
    const PresentationVector *anchor08;
    PresentationVector position0c;
    PresentationVector velocity1c;
    s32 acceleration2c;
    u32 angle30;
    s32 frame34;
    s32 state38;
    u8 resource3c[0x0c];
    void *primaryOwner48;
    void *secondaryOwner4c;
    u8 *primarySprite50;
    u8 *secondarySprite54;
} LaunchedSpritePairPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern void *data_020d68e4;
extern u8 data_021f3d68[];
extern void *data_020f4e18;
extern u8 *data_021052fc;
extern void *gGameWork;
extern const s16 data_020c9670[];
extern void func_0201e250(void *);
extern void func_0201e28c(void *);
extern void func_02004fe0(PresentationVector *);
extern void func_0200500c(PresentationVector *, s32, s32, s32);
extern void func_02005030(PresentationVector *, const PresentationVector *);
extern void func_02005058(PresentationVector *);
extern void func_020050a4(PresentationVector *, const PresentationVector *);
extern void func_02071ea4(void *resource);
extern void func_02071eb8(void *resource);
extern void func_02071ee0(void *resource, void *owner, s32, s32, s32);
extern void func_02071f38(void *resource);
extern void *func_020337d4(void *actor);
extern void *func_02033810(void *actor, s32 index);
extern void *func_02030acc(void *resource);
extern u8 *func_02079a7c(void *table, s32 index);
extern u8 *func_02073ffc(void *owner, void *resource, s32 mode);
extern void func_02072b68(void *sprite, s32 frame);
extern void func_02074038(void *owner, void *sprite);
extern s32 func_02002e38(void);
extern s32 func_02091a70(s32, s32, s32, s32);
extern s32 GameWork_TestFlag(void *, u16);
extern void GameWork_SetFlag(void *, u16);
extern void GameWork_ClearFlag(void *, u16);
extern u32 genrand_int32(void);
#ifdef __cplusplus
}
#endif

/*
 * Initialize base, copy actor position from actor offset 0x18, initialize
 * velocity and the 12-byte resource helper, and acquire the primary sprite
 * owner through func_020337d4/func_02030acc.  Configure resources 0x300a..0x300c,
 * create the primary mode-2 sprite at frame zero, and set sprite flag bit 1.
 *
 * A secondary owner/sprite is created from actor subobject 2 when runtime object
 * offset 0x30bc has mode bits 18..19 equal to 3 or its word at offset zero is
 * 2..4; its initial frame comes from byte 0x0d of the indexed data_021f3d68
 * record.  Add the two stack-provided integer offsets to position x/z, publish
 * initial screen coordinates relative to anchor, zero motion/state, set flag
 * 0x385, clear flag 0x3e0, and return self.
 */
LaunchedSpritePairPresentation *func_02024b04(
    LaunchedSpritePairPresentation *self, const PresentationVector *anchor,
    void *actor, s32 recordIndex, s32 xOffset, s32 zOffset)
{
    u8 *record;
    u8 *runtimeObject;
    s32 screenX;
    s32 screenY;
    s32 mode;
    s32 kind;

    func_0201e250(self);
    self->vtable00 = (void **)data_020d68e4;
    self->anchor08 = anchor;
    func_02005030(&self->position0c,
                  (const PresentationVector *)((u8 *)actor + 0x18));
    func_02004fe0(&self->velocity1c);
    func_02071ea4(self->resource3c);
    self->primaryOwner48 = func_02030acc(func_020337d4(actor));
    record = func_02079a7c(data_021f3d68, recordIndex);
    func_02071ee0(self->resource3c, data_020f4e18, 0x300a, 0x300b, 0x300c);
    self->primarySprite50 =
        func_02073ffc(self->primaryOwner48, self->resource3c, 2);
    func_02072b68(self->primarySprite50, 0);
    *(u16 *)(self->primarySprite50 + 0x24) |= 2;

    runtimeObject = *(u8 **)(data_021052fc + 0x30bc);
    kind = *(s32 *)(runtimeObject + 0x00);
    mode = (*(u32 *)(runtimeObject + 0x40) >> 18) & 3;
    if (mode == 3 || (u32)(kind - 2) <= 2) {
        self->secondaryOwner4c = func_02030acc(func_02033810(actor, 2));
        self->secondarySprite54 =
            func_02073ffc(self->secondaryOwner4c, self->resource3c, 2);
        func_02072b68(self->secondarySprite54, record[0x0d]);
    } else {
        self->secondaryOwner4c = 0;
        self->secondarySprite54 = 0;
    }

    self->position0c.x04 += xOffset << 12;
    self->position0c.z0c += zOffset << 12;
    screenX = (self->position0c.x04 - anchor->x04) / 0x1000;
    screenY = ((self->position0c.y08 - anchor->y08) -
               (self->position0c.z0c - anchor->z0c)) / 0x1000;
    *(u16 *)(self->primarySprite50 + 0x2c) = (u16)screenX;
    *(u16 *)(self->primarySprite50 + 0x2e) = (u16)screenY;
    if (self->secondaryOwner4c != 0) {
        *(u16 *)(self->secondarySprite54 + 0x2c) = (u16)screenX;
        *(u16 *)(self->secondarySprite54 + 0x2e) =
            (u16)(screenY + 0xc0 + func_02002e38());
    }
    self->acceleration2c = 0;
    self->angle30 = 0;
    self->frame34 = 0;
    self->state38 = 0;
    GameWork_SetFlag(gGameWork, 0x385);
    GameWork_ClearFlag(gGameWork, 0x3e0);
    return self;
}

/*
 * Set flag 0x3e0, release the primary sprite and optional secondary sprite
 * through their respective owners, destroy resource/velocity/position state,
 * tear down the common base, and return self.
 */
LaunchedSpritePairPresentation *func_02024d3c(
    LaunchedSpritePairPresentation *self)
{
    self->vtable00 = (void **)data_020d68e4;
    GameWork_SetFlag(gGameWork, 0x3e0);
    func_02074038(self->primaryOwner48, self->primarySprite50);
    if (self->secondaryOwner4c != 0) {
        func_02074038(self->secondaryOwner4c, self->secondarySprite54);
    }
    func_02071eb8(self->resource3c);
    func_02005058(&self->velocity1c);
    func_02005058(&self->position0c);
    func_0201e28c(self);
    return self;
}

/* Perform func_02024d3c teardown, free self, and return its old address. */
LaunchedSpritePairPresentation *func_02024dac(
    LaunchedSpritePairPresentation *self)
{
    func_02024d3c(self);
    Heap_Free(self);
    return self;
}

/*
 * Advance a four-state sequence.  State zero waits 31 updates. State one waits
 * for flag 0x385 to clear, shifts position.z by -0x8000, rebuilds resources as
 * 0x115a..0x115c, recreates both existing sprites at frame one, and advances.
 * State two waits for the primary animation-complete flag, returns sprites to
 * frame zero with flag bit 1 set/bit 0 clear, seeds angle30 randomly, and
 * advances. State three adds 0x52 acceleration per frame to velocity.z, applies
 * a sine/easing horizontal velocity, advances angle by 0x400 and frame count.
 *
 * Every update projects position+velocity relative to anchor into sprite x/y;
 * the optional secondary adds 0xc0 and func_02002e38. Return one after 240
 * launched frames or when the primary passes its secondary-dependent lower
 * boundary; without a secondary the limits are 120 frames and y < -32.
 */
s32 func_02024e24(LaunchedSpritePairPresentation *self)
{
    s32 screenX;
    s32 screenY;
    switch (self->state38) {
    case 0:
        self->angle30++;
        if ((s32)self->angle30 > 30) self->state38++;
        break;
    case 1:
        if (!GameWork_TestFlag(gGameWork, 0x385)) {
            self->position0c.z0c -= 0x8000;
            func_02074038(self->primaryOwner48, self->primarySprite50);
            if (self->secondaryOwner4c != 0)
                func_02074038(self->secondaryOwner4c, self->secondarySprite54);
            func_02071f38(self->resource3c);
            func_02071ee0(self->resource3c, data_020f4e18,
                          0x115a, 0x115b, 0x115c);
            self->primarySprite50 =
                func_02073ffc(self->primaryOwner48, self->resource3c, 2);
            func_02072b68(self->primarySprite50, 1);
            if (self->secondarySprite54 != 0) {
                self->secondarySprite54 =
                    func_02073ffc(self->secondaryOwner4c, self->resource3c, 2);
                func_02072b68(self->secondarySprite54, 1);
            }
            self->state38++;
        }
        break;
    case 2:
        if ((*(u16 *)(self->primarySprite50 + 0x24) & 1) != 0) {
            func_02072b68(self->primarySprite50, 0);
            *(u16 *)(self->primarySprite50 + 0x24) =
                (u16)((*(u16 *)(self->primarySprite50 + 0x24) | 2) & ~1);
            if (self->secondarySprite54 != 0) {
                func_02072b68(self->secondarySprite54, 0);
                *(u16 *)(self->secondarySprite54 + 0x24) =
                    (u16)((*(u16 *)(self->secondarySprite54 + 0x24) | 2) & ~1);
            }
            self->angle30 = genrand_int32();
            self->state38++;
        }
        break;
    case 3: {
        s32 sine;
        self->acceleration2c += 0x52;
        self->velocity1c.z0c += self->acceleration2c;
        sine = data_020c9670[((self->angle30 & 0xffff) >> 4) * 2];
        self->velocity1c.x04 =
            sine * func_02091a70(0, 0x10, 0x78, self->frame34);
        self->angle30 += 0x400;
        self->frame34++;
        break;
    }
    }

    screenX = ((self->position0c.x04 + self->velocity1c.x04) -
               self->anchor08->x04) / 0x1000;
    screenY = (((self->position0c.y08 + self->velocity1c.y08) -
                self->anchor08->y08) -
               ((self->position0c.z0c + self->velocity1c.z0c) -
                self->anchor08->z0c)) / 0x1000;
    *(u16 *)(self->primarySprite50 + 0x2c) = (u16)screenX;
    *(u16 *)(self->primarySprite50 + 0x2e) = (u16)screenY;
    if (self->secondarySprite54 != 0) {
        *(u16 *)(self->secondarySprite54 + 0x2c) = (u16)screenX;
        *(u16 *)(self->secondarySprite54 + 0x2e) =
            (u16)(screenY + 0xc0 + func_02002e38());
        return self->frame34 >= 0xf0 ||
               *(s16 *)(self->primarySprite50 + 0x2e) <
                   -0xe0 - func_02002e38();
    }
    return self->frame34 >= 0x78 ||
           *(s16 *)(self->primarySprite50 + 0x2e) < -0x20;
}
