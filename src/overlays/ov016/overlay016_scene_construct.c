#include "tingle/types.h"

/* Overlay 16 main scene construction and mode-specific initial setup. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *data_020f4e14;
extern void *data_020f4e18;
extern void *data_021e9ac0;
extern u8 data_021e9e00[];
extern const u32 data_ov016_022013e8[];
extern const u32 data_ov016_02201410[];
extern const u32 data_ov016_02201540[];
extern void *gGameWork;

#ifdef __cplusplus
extern "C" {
#endif
extern void GameWork_ClearFlag(void *, s32);
extern void func_02064be0(void *, s32);
extern void func_02071ea4(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void *GraphicsSpriteGroup_CreateStateFromSource(void *, void *, s32);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void func_02091e28(void *);
extern void func_020926d8(void *);
extern void func_02092754(void *, s32);
extern void func_02092798(void *);
extern void func_02092814(void *, s32);
extern void func_020957bc(void *);
extern void func_020957f0(void *, void *, s32, s32, s32);
extern void func_02095820(void *, s32, s32);
extern void func_02095940(void *);
extern void func_ov016_021fe740(void *);
extern void func_ov016_021fe754(void *, u32, u32);
extern void func_ov016_021fedc4(void *);
extern void func_ov016_021ff094(void *);
extern void func_ov016_021ff17c(void *);
extern void func_ov016_021ff288(void *);
extern void func_ov016_021ff404(void *);
extern void func_ov016_021ff510(void *);
#ifdef __cplusplus
}
#endif

/*
 * Construct the main overlay scene from owner and mode. Initialize its inherited
 * base, install vtable 0x02201540, initialize embedded state/resources at +0x60,
 * +0x84, +0xC8, +0xD4, five 0xAC-byte actor records (+0xE8..+0x443), and the
 * value helper at +0x454. Clear all confirmed runtime pointers/counters, store
 * owner +0x54, mode +0x58, and five times mode+1 at +0x5C. Register resource IDs
 * 0x801B/0x801C/0x8010/0x8011/0x800B and 0x7005/0x7001, load triples 0x0D-0x0F
 * and 0x1C-0x1E, acquire child +0xE0, and run common setup helpers.
 * Modes 0/2 use the 0x02201410 transition pair; mode 1 creates and stops three
 * additional actor records at +0x240/+0x2EC/+0x398 and uses pair 0x022013E8.
 * Finally clear game flag 0x3A6, set state bit 10 at +0x20, and return state.
 * Numerous SDK graphics/actor resources change; no direct MMIO occurs.
 */
extern "C" void *func_ov016_021fe77c(void *state, s32 owner, s32 mode)
{
    void *sprite;

    func_02091e28(state);
    FIELD(const u32 *, state, 0) = data_ov016_02201540;
    func_02092798((u8 *)state + 0x60);
    func_020926d8((u8 *)state + 0x84);
    func_02071ea4((u8 *)state + 0xc8);
    func_02071ea4((u8 *)state + 0xd4);
    func_020957bc((u8 *)state + 0xe8);
    func_020957bc((u8 *)state + 0x194);
    func_020957bc((u8 *)state + 0x240);
    func_020957bc((u8 *)state + 0x2ec);
    func_020957bc((u8 *)state + 0x398);
    func_ov016_021fe740((u8 *)state + 0x454);

    FIELD(s32, state, 0x54) = owner;
    FIELD(s32, state, 0x58) = mode;
    FIELD(s32, state, 0x5c) = (mode + 1) * 5;
    FIELD(u32, state, 0x444) = 0;
    FIELD(u32, state, 0x460) = 0;
    FIELD(u32, state, 0x464) = 0;
    FIELD(u32, state, 0xe4) = 0;
    FIELD(u32, state, 0x468) = 0;
    FIELD(u32, state, 0x46c) = 0;
    FIELD(u32, state, 0x44c) = 0;
    FIELD(u32, state, 0x450) = 0;
    FIELD(u32, state, 0x470) = 0;
    FIELD(u32, state, 0x47c) = 0;
    FIELD(u32, state, 0x478) = 0;
    FIELD(u32, state, 0x480) = 0;
    FIELD(u32, state, 0x484) = 1;

    func_02064be0(data_021e9ac0, 0);
    func_02092754((u8 *)state + 0x84, 0x801b);
    func_02092754((u8 *)state + 0x84, 0x801c);
    func_02092754((u8 *)state + 0x84, 0x8010);
    func_02092754((u8 *)state + 0x84, 0x8011);
    func_02092754((u8 *)state + 0x84, 0x800b);
    func_02092814((u8 *)state + 0x60, 0x7005);
    func_02092814((u8 *)state + 0x60, 0x7001);
    func_02071ee0((u8 *)state + 0xc8, data_020f4e18, 0xd, 0xe, 0xf);
    func_02071ee0((u8 *)state + 0xd4, data_020f4e18, 0x1c, 0x1d, 0x1e);
    FIELD(void *, state, 0xe0) =
        GraphicsSpriteGroupOwner_CreateGroup(data_020f4e14);
    func_ov016_021ff288(state);
    func_ov016_021fedc4(state);

    if (mode == 0 || mode == 2) {
        func_ov016_021ff094(state);
        func_ov016_021ff404(state);
        func_ov016_021fe754((u8 *)state + 0x454,
                            data_ov016_02201410[0], data_ov016_02201410[1]);
    } else if (mode == 1) {
        func_ov016_021ff17c(state);
        func_ov016_021ff510(state);

        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xe0), (u8 *)state + 0xd4, 1);
        func_020957f0((u8 *)state + 0x240, sprite, 0, 1, 0x100);
        func_02095820((u8 *)state + 0x240, 0x14, 0x10);
        if (FIELD(s32, data_021e9e00, 4) == 0) {
            func_02095940((u8 *)state + 0x240);
        }

        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xe0), (u8 *)state + 0xd4, 1);
        func_020957f0((u8 *)state + 0x2ec, sprite, 5, 1, 0);
        func_02095820((u8 *)state + 0x2ec, 0x14, 0x3b);
        func_02095940((u8 *)state + 0x2ec);

        sprite = GraphicsSpriteGroup_CreateStateFromSource(FIELD(void *, state, 0xe0), (u8 *)state + 0xd4, 1);
        func_020957f0((u8 *)state + 0x398, sprite, 4, 1, 0);
        func_02095820((u8 *)state + 0x398, 0x14, 0x25);
        func_02095940((u8 *)state + 0x398);
        func_ov016_021fe754((u8 *)state + 0x454,
                            data_ov016_022013e8[0], data_ov016_022013e8[1]);
    }

    GameWork_ClearFlag(gGameWork, 0x3a6);
    FIELD(u32, state, 0x20) |= 0x400;
    return state;
}
