#include "tingle/graphics_3d_resource_owner.h"

/*
 * Construction and NDS VRAM-bank selection for a 0x624-byte 3D graphics
 * resource owner. The object embeds independent 0x20000-unit texture and
 * 0x4000-unit palette region allocators; paired texture-bank modes enlarge the
 * first allocator's initial range to 0x40000 units.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020aef3c(u32 bankSelection);
extern void func_020aee48(u32 bankSelection);

#ifdef __cplusplus
}
#endif

/*
 * Construct both embedded allocators, retain both bank modes, and clear the
 * three intervening words. textureBankMode values 0..6 map to retail bank masks
 * 1,2,4,8,3,6,12; modes 4..6 also expand the initial texture range to 0x40000.
 * paletteBankMode values 0..2 map to 0,0x20,0x40. Values outside either range
 * stop further bank configuration but still return the initialized owner. The
 * two external calls are inferred NDS texture/texture-palette VRAM-bank
 * selectors; they are the only hardware/SDK effects.
 */
#ifndef MATCHING
Graphics3DResourceOwner *Graphics3DResourceOwner_Init(
    Graphics3DResourceOwner *owner, u32 textureBankMode, u32 paletteBankMode)
{
    func_0207671c(&owner->textureRegions);
    func_02076948(&owner->paletteRegions);
    owner->textureBankMode = textureBankMode;
    owner->paletteBankMode = paletteBankMode;
    owner->managerCount = 0;
    owner->managerTail = 0;
    owner->managerHead = 0;

    switch (owner->textureBankMode) {
    case 0:
        func_020aef3c(1);
        break;
    case 1:
        func_020aef3c(2);
        break;
    case 2:
        func_020aef3c(4);
        break;
    case 3:
        func_020aef3c(8);
        break;
    case 4:
        func_020aef3c(3);
        owner->textureRegions.regions[0].size = 0x40000;
        break;
    case 5:
        func_020aef3c(6);
        owner->textureRegions.regions[0].size = 0x40000;
        break;
    case 6:
        func_020aef3c(0x0c);
        owner->textureRegions.regions[0].size = 0x40000;
        break;
    default:
        return owner;
    }

    switch (owner->paletteBankMode) {
    case 0:
        func_020aee48(0);
        break;
    case 1:
        func_020aee48(0x20);
        break;
    case 2:
        func_020aee48(0x40);
        break;
    default:
        return owner;
    }
    return owner;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm Graphics3DResourceOwner *Graphics3DResourceOwner_Init(
    Graphics3DResourceOwner *owner, u32 textureBankMode, u32 paletteBankMode)
{
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    add r0, r4, #0x14
    mov r6, r1
    mov r5, r2
    bl func_0207671c
    add r0, r4, #0x31c
    bl func_02076948
    str r6, [r4]
    mov r0, #0
    str r5, [r4, #4]
    str r0, [r4, #0x10]
    str r0, [r4, #0xc]
    str r0, [r4, #8]
    ldr r0, [r4]
    cmp r0, #6
    addls pc, pc, r0, lsl #2
    b graphics_3d_owner_return
    b graphics_3d_owner_mode_0
    b graphics_3d_owner_mode_1
    b graphics_3d_owner_mode_2
    b graphics_3d_owner_mode_3
    b graphics_3d_owner_mode_4
    b graphics_3d_owner_mode_5
    b graphics_3d_owner_mode_6
graphics_3d_owner_mode_0:
    mov r0, #1
    bl func_020aef3c
    b graphics_3d_owner_palette_mode
graphics_3d_owner_mode_1:
    mov r0, #2
    bl func_020aef3c
    b graphics_3d_owner_palette_mode
graphics_3d_owner_mode_2:
    mov r0, #4
    bl func_020aef3c
    b graphics_3d_owner_palette_mode
graphics_3d_owner_mode_3:
    mov r0, #8
    bl func_020aef3c
    b graphics_3d_owner_palette_mode
graphics_3d_owner_mode_4:
    mov r0, #3
    bl func_020aef3c
    mov r0, #0x40000
    str r0, [r4, #0x24]
    b graphics_3d_owner_palette_mode
graphics_3d_owner_mode_5:
    mov r0, #6
    bl func_020aef3c
    mov r0, #0x40000
    str r0, [r4, #0x24]
    b graphics_3d_owner_palette_mode
graphics_3d_owner_mode_6:
    mov r0, #0xc
    bl func_020aef3c
    mov r0, #0x40000
    str r0, [r4, #0x24]
    b graphics_3d_owner_palette_mode
graphics_3d_owner_return:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
graphics_3d_owner_palette_mode:
    ldr r0, [r4, #4]
    cmp r0, #0
    beq graphics_3d_owner_palette_0
    cmp r0, #1
    beq graphics_3d_owner_palette_1
    cmp r0, #2
    beq graphics_3d_owner_palette_2
    b graphics_3d_owner_return_after_palette
graphics_3d_owner_palette_0:
    mov r0, #0
    bl func_020aee48
    b graphics_3d_owner_finish
graphics_3d_owner_palette_1:
    mov r0, #0x20
    bl func_020aee48
    b graphics_3d_owner_finish
graphics_3d_owner_palette_2:
    mov r0, #0x40
    bl func_020aee48
    b graphics_3d_owner_finish
graphics_3d_owner_return_after_palette:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
graphics_3d_owner_finish:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
}
#endif
