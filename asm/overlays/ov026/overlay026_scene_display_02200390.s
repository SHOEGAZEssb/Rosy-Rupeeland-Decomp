.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_display.c. */
.extern data_ov026_02204300
.extern data_ov026_02204302
.extern TitlePalette_SetMainBackdrop
.extern func_020add34
.extern func_020b0300
.extern func_020b0374
.extern func_ov048_0220b7b8


    .global func_ov026_02200390
func_ov026_02200390:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    add r0, r4, #0x370
    bl func_ov048_0220b7b8
    mov ip, #0x11
    mov r0, #0x1
    mov r1, #0x0
    mov r2, #0x2
    mov r3, #0x6000
    str ip, [r4, #0x48]
    bl func_020b0374
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r1, [r4, #0x58]
    ldr r0, L_0220045c
    mov r1, r1, lsl #0x3
    ldrh r0, [r0, r1]
    ldr r2, L_02200460
    mov r1, #0x1f
    mov r3, #0x3f
    bl func_020b0300
    ldr r0, [r4, #0x58]
    ldr r3, L_02200464
    mov r2, r0, lsl #0x3
    ldr r0, L_02200468
    mov r1, #0x1000
    ldrh ip, [r0, r2]
    mov r2, #0x1
    add r0, r4, #0x100
    str ip, [r3, #0x0]
    strh r2, [r0, #0x8e]
    str r1, [r4, #0x180]
    sub r0, r1, #0x3000
    str r0, [r4, #0x184]
    mov r1, #0x0
    add r0, r4, #0x180
    str r1, [r4, #0x188]
    mov r1, r0
    bl func_020add34
    mov r2, #0x1
    add r1, r4, #0x100
    strh r2, [r1, #0x8e]
    rsb r0, r2, #0x8000
    strh r0, [r1, #0x8c]
    mov r1, #0x2
    str r1, [r4, #0x1c0]
    str r2, [r4, #0x254]
    bl TitlePalette_SetMainBackdrop
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_0220045c: .word data_ov026_02204300
L_02200460: .word 0x7fff
L_02200464: .word 0x4000358
L_02200468: .word data_ov026_02204302
.size func_ov026_02200390, .-func_ov026_02200390

