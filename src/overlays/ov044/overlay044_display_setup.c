#include "tingle/types.h"

/*
 * Overlay 44 display setup. This recovered helper configures both Nintendo DS
 * display engines' background control registers and synchronizes the main and
 * debug font rendering state used by the scene.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern "C" u32 data_020f4e14;
extern "C" void *gDebugFont;
extern "C" void func_020925a4(s32 value);
extern "C" void func_020925f8(void);
extern "C" void func_02092638(s32 a, s32 b, s32 c, s32 d);
extern "C" void func_020925dc(s32 value);
extern "C" void func_02092618(void);
extern "C" void func_02092688(s32 a, s32 b, s32 c, s32 d);
extern "C" void *func_020755e0(void *font);

static void configure_bg_controls(volatile u16 *registers)
{
    registers[0] = (registers[0] & 0x43) | 0x3800;
    registers[2] = (registers[2] & 0x43) | 0x1c00;
    registers[3] = (registers[3] & 0x43) | 0x1e10;
}

/*
 * Configure main/sub background layers and return no value. Confirmed hardware
 * effects include clearing display-capture bit 15 at 0x04000304 and writing
 * BG control registers at 0x04000008 and 0x04001008. The helper stores layer
 * IDs 0x1D/+0x4C and 0x1C/+0x48, then copies recovered font metrics and color
 * 0x4210 between the main scene font and debug font state.
 */
extern "C" void func_ov044_0220c19c(void *object)
{
    volatile u16 *capture = (volatile u16 *)0x04000304;
    *capture &= ~0x8000;
    func_020925a4(0);
    configure_bg_controls((volatile u16 *)0x04000008);
    func_020925f8();
    func_02092638(0, 1, 2, 3);
    FIELD(s32, object, 0x4c) = 0x1d;
    func_020925dc(0);
    configure_bg_controls((volatile u16 *)0x04001008);
    func_02092618();
    func_02092688(0, 1, 2, 3);
    FIELD(s32, object, 0x48) = 0x1c;
    func_020925f8();

    void *mainState = func_020755e0((void *)data_020f4e14);
    void *debugState = func_020755e0(gDebugFont);
    u16 firstMetric = FIELD(u16, mainState, 0xe);
    FIELD(u16, debugState, 6) = firstMetric;
    FIELD(u16, mainState, 6) = firstMetric;
    u16 secondMetric = FIELD(u16, mainState, 0x1e);
    FIELD(u16, debugState, 8) = secondMetric;
    FIELD(u16, mainState, 8) = secondMetric;
    FIELD(u16, debugState, 0xa) = 0x4210;
    FIELD(u16, mainState, 0xa) = FIELD(u16, debugState, 0xa);
    FIELD(u16, debugState, 0xc) = secondMetric;
    FIELD(u16, mainState, 0xc) = secondMetric;
}
