#include "tingle/game_work.h"
#include "tingle/types.h"

/*
 * Present an indexed area-information panel through an existing UI context.
 * The object owns one resource triplet and one sprite-group owner; it selects
 * localized table entries and conditionally adds flag- and save-dependent
 * detail rows. Table record meanings that are not yet confirmed retain their
 * address/stride descriptions below.
 */
typedef struct AreaInfoPanelPresentation {
    u8 base_00[0x24];
    u8 resources_24[0x0c];
    void *uiContext_30;
    u8 *spriteOwner_34;
    u8 *primarySprite_38;
} AreaInfoPanelPresentation;

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020c3a1c[];
extern const u16 data_020c3a28[];
extern const s32 data_020c37e4;
extern const u8 data_020d780c[];
extern const u16 data_020d7828[];
extern const u16 data_020d782c[];
extern const s16 data_020d7a48[];
extern u8 data_021f3ecc[];
extern u8 gSystemState[];
extern u8 *data_021052fc;
extern void *data_020f4e18;
extern void func_02092798(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern u8 *func_020742cc(void *);
extern void func_0207419c(void *);
extern void func_02074110(void *);
extern u8 *func_02073ffc(void *, void *, s32);
extern void func_02073e48(void *, s32, s32, s32, s32, s32, s32);
extern void func_02072b68(void *, s32);
extern void func_020755bc(void *);
extern void func_02075598(void *, const void *);
extern const u16 *func_02079f3c(void *, u16);
extern void func_02076148(void *, const u16 *, s32, s32, s32, s32, s32);
extern void func_02075e48(void *, s32, s32, s32, s32);
extern s32 func_02092960(void *, s32, s32, s32, s32, s32, s32, s32, s32);
extern s32 func_020befec(s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Construct the 0x24-byte panel base for IDs 0x7005 and 0x7007, load resource
 * IDs 0x3326..0x3328, create/configure two sprites, retain the primary sprite,
 * and leave the owner hidden. The supplied UI context is not owned.
 */
AreaInfoPanelPresentation *func_02027fe8(AreaInfoPanelPresentation *self,
                                         void *uiContext)
{
    u8 *secondary;
    func_02092798(self);
    func_02071ea4(self->resources_24);
    self->uiContext_30 = uiContext;
    self->spriteOwner_34 = func_020742cc(uiContext);
    func_02092814(self, 0x7005);
    func_02092814(self, 0x7007);
    func_02071ee0(self->resources_24, data_020f4e18,
                  0x3326, 0x3327, 0x3328);
    self->primarySprite_38 =
        func_02073ffc(self->spriteOwner_34, self->resources_24, 1);
    func_02073e48(self->primarySprite_38, 0, 0x1e, 0xa2, 1, 0, 0);
    secondary = func_02073ffc(self->spriteOwner_34, self->resources_24, 1);
    func_02073e48(secondary, 1, 5, 0xbd, 1, 0, 0);
    func_02074110(self->spriteOwner_34);
    return self;
}

/* Destroy the sprite owner, resource triplet, and panel base; return self. */
AreaInfoPanelPresentation *func_020280d8(AreaInfoPanelPresentation *self)
{
    func_0207419c(self->spriteOwner_34);
    func_02071eb8(self->resources_24);
    func_020927b8(self);
    return self;
}

/*
 * Show and populate the panel for an index. This selects its sprite frame and
 * inherited text slots, draws two localized table strings, then optionally
 * draws either a fixed flag-dependent notice or the percentage of matching
 * 0x24-byte records whose GameWork byte at 0x5e94 is set.
 */
void func_02028100(AreaInfoPanelPresentation *self, s32 index)
{
    const u16 *text;
    s32 stride34 = index * 0x34;
    s32 matching = 0;
    s32 available = 0;
    s32 i;

    *(u32 *)(self->spriteOwner_34 + 0x20) = 1;
    func_020755bc(self->uiContext_30);
    *(u16 *)(self->primarySprite_38 + 0x24) &= (u16)~4;
    func_02072b68(self->primarySprite_38, data_020c3a1c[index]);

    func_02075598(self->uiContext_30, *(void **)(self->base_00 + 0));
    text = func_02079f3c(data_021f3ecc, data_020c3a28[index]);
    func_02076148(self->uiContext_30, text + 1, 6,
                  gSystemState[0x5f] ? 0x9b : 0x9d, 13, 4, 0);

    func_02075598(self->uiContext_30, *(void **)(self->base_00 + 4));
    text = func_02079f3c(data_021f3ecc,
                        *(const u16 *)(data_020d780c + stride34));
    func_02076148(self->uiContext_30, text + 1, 5, 0xa7, 13, 6, -1);

    if (!GameWork_TestFlag(gGameWork, 0x765) ||
        GameWork_TestFlag(gGameWork, data_020d782c[stride34 / 2]))
        return;
    if (GameWork_TestFlag(gGameWork, data_020d7828[stride34 / 2])) {
        func_02075e48(self->uiContext_30, 0xd3, 0xee, 0xac, 13);
        return;
    }

    for (i = 0; i < *(s32 *)data_021052fc; i++) {
        if (index == *(const s16 *)((const u8 *)data_020d7a48 + i * 0x24)) {
            matching++;
            if (i == 0 || *((u8 *)gGameWork + 0x5e94 + i))
                available++;
        }
    }
    if (matching != 0) {
        s32 percent = func_020befec(available * 100, matching);
        if (percent > 0) {
            s32 width = func_02092960(self->uiContext_30, percent, 100,
                                     0xca, 0xac, 13, 12, 0, 0);
            func_02075e48(self->uiContext_30, 5, width + 0xca, 0xac, 13);
        }
    }
}

/* Clear the UI context and hide the panel's sprite owner. */
void func_0202836c(AreaInfoPanelPresentation *self)
{
    func_020755bc(self->uiContext_30);
    func_02074110(self->spriteOwner_34);
}
