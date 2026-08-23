#include "tingle/types.h"

/*
 * Overlay 41 capture-frame updates. These recovered routines arm the capture
 * callback, copy scrolling tile strips into graphics resources, and prepare
 * the next display-bank configuration each frame.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" {
void func_020b4f54(void);
void func_020b4f68(void);
s32 func_020befec(s32, s32);
void func_020b1784(void *, s32, s32);
void func_020b1ac4(void *, s32, s32);
void func_020b1b94(void *, s32, s32);
void GraphicsBgMapResource_UploadToMainBg(void *, s32, s32);
void func_ov041_021fdd04(s32, s32, s32, s32, s32);
void func_ov041_021fdd38(s32, s32, s32, s32);
void func_ov041_021fe110(void *);
void func_ov041_021fe31c(void *);
void func_ov041_021fe8b8(void *);
extern const u8 data_ov041_02205870[];
extern const u8 data_ov041_02205890[];
extern s32 data_ov041_022059e0;
}

/*
 * Enter a critical capture update, set the capture trigger register and the
 * owner pending flag, then leave the critical section. No value is returned.
 */
extern "C" void func_ov041_021fe56c(void *owner)
{
    func_020b4f54();
    *(volatile u32 *)0x04000540 = 1;
    FIELD(s32, owner, 0x1f0) = 1;
    func_020b4f68();
}

static const u8 *select_order(void *owner)
{
    return FIELD(s32, owner, 0x1f4) == 2
        ? data_ov041_02205870 : data_ov041_02205890;
}

/*
 * Copy two 0x80-byte horizontal strips for logical row. Source selection is
 * driven by mode, capture-bank parity, scroll position and the row-order table.
 */
extern "C" void func_ov041_021fe6e4(void *owner, s32 row)
{
    const u8 *order = select_order(owner);
    s32 adjust = FIELD(s32, owner, 0x1ec) == 0 ? 12 : 0;
    s32 position = row + FIELD(s32, owner, 0x178) - adjust;
    s32 quotient = func_020befec(position, 6);
    s32 index = func_020befec(quotient, FIELD(s32, owner, 0x174));
    s32 sourceOffset = ((u32)position << 28) >> 21;
    s32 slotOffset = order[index] * 12;
    s32 column = func_020befec(position, 6);
    void *resource = FIELD(void *, owner, 0xf8 + slotOffset);
    u8 *destination = (u8 *)FIELD(void *, resource, 0x24) + column * 0x80;
    func_020b1ac4(destination, sourceOffset, 0x80);
    func_020b1ac4(destination + 0x800, sourceOffset + 0x800, 0x80);
}

/*
 * Copy one 0x80-byte vertical strip for logical row. It uses the same inferred
 * row-order relationship as func_ov041_021fe6e4 and writes through the graphics
 * transfer helper.
 */
extern "C" void func_ov041_021fe794(void *owner, s32 row)
{
    const u8 *order = select_order(owner);
    s32 adjust = FIELD(s32, owner, 0x1ec) == 0 ? 12 : 0;
    s32 position = row + (FIELD(s32, owner, 0x178) >> 2) - adjust;
    s32 value = position + 0x20;
    s32 quotient = func_020befec(value, 6);
    s32 index = func_020befec(quotient, FIELD(s32, owner, 0x174));
    s32 column = func_020befec(value, 6);
    void *resource = FIELD(void *, owner, 0x98 + order[index] * 12);
    u8 *destination = (u8 *)FIELD(void *, resource, 0x24) + column * 0x80;
    func_020b1b94(destination, ((u32)value << 28) >> 21, 0x80);
}

/*
 * Refresh all thirteen scrolling rows. In early scene states it also switches
 * BG1 to the active capture bank and enables the corresponding resource.
 */
extern "C" void func_ov041_021fe824(void *owner)
{
    for (s32 row = 0; row < 13; ++row) {
        func_ov041_021fe6e4(owner, row);
        func_ov041_021fe794(owner, row);
    }
    if (FIELD(s32, owner, 0x184) < 3) {
        s32 bank = FIELD(s32, owner, 0x1ec) != 0 ? 2 : 0;
        func_ov041_021fdd04(0, 0, 0x1c, bank, 0);
        s32 resourceIndex = FIELD(s32, owner, 0x180) +
                            (FIELD(s32, owner, 0x1ec) != 0);
        GraphicsBgMapResource_UploadToMainBg(FIELD(void *, owner, 0x50 + resourceIndex * 12), 1, 0);
    }
}

/*
 * Service an armed capture frame: clear palettes, update scroll resources,
 * select the next display layout, toggle bank parity, and acknowledge the
 * capture IRQ flag. Register polling synchronizes with the display hardware.
 */
extern "C" void func_ov041_021fe594(void *owner)
{
    if (FIELD(s32, owner, 0x1f0) != 0) {
        *(volatile u16 *)0x05000000 = 0;
        *(volatile u16 *)0x05000400 = 0;
        if (FIELD(s32, owner, 0x1f8) == 0) {
            FIELD(s32, owner, 0x178) = FIELD(s32, owner, 0x194) >> 16;
            func_ov041_021fe824(owner);
            if (FIELD(s32, owner, 0x1f4) == 0 ||
                FIELD(s32, owner, 0x1f4) == 2) {
                ++data_ov041_022059e0;
                func_ov041_021fdd38(1, 0, 0x1e, 0);
                s32 index = func_020befec(func_020befec(data_ov041_022059e0, 5), 3);
                void *resource = FIELD(void *, owner, 0x168 + index * 4);
                func_020b1784((u8 *)resource + 0x1024, 0x1000, 0x1000);
            }
            func_ov041_021fe8b8(owner);
        }
        if (FIELD(s32, owner, 0x1ec) != 0)
            func_ov041_021fe31c(owner);
        else
            func_ov041_021fe110(owner);
        FIELD(s32, owner, 0x1f0) = 0;
        FIELD(s32, owner, 0x1ec) = FIELD(s32, owner, 0x1ec) == 0;
    }
    *(volatile u32 *)0x027e3ff8 |= 1;
}
