.text
; Matching fallback for the portable implementation in src/overlays/ov048/overlay048_display_recovery.c.
.extern GXS_SetGraphicsMode
.extern GX_SetGraphicsMode
.extern gFx32CosSinTable
.extern TitleDisplay_ResetMainBgScroll
.extern TitleDisplay_SetMainBgPriorities
.extern TitleDisplay_SetSubBgPriorities
.extern func_020afd28
.extern func_020b0348
.extern func_020b1e5c
.extern func_020b44e8
.extern func_020b4554
.extern func_ov048_0220b9a0

.global func_ov048_0220b7b8
func_ov048_0220b7b8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    ldr r1, .L_0220b97c
    ldr r2, .L_0220b980
    ldrh r5, [r1, #0x0]
    mov r4, r0
    ldr r3, .L_0220b984
    and r0, r5, r2
    strh r0, [r1, #0x0]
    ldrh r5, [r1, #0x0]
    add r2, r3, #0x1c
    add r0, r4, #0x4
    and r3, r5, r3
    strh r3, [r1, #0x0]
    ldrh r3, [r1, #0x0]
    add r0, r0, #0x400
    bic r3, r3, #0x3000
    orr r3, r3, #0x10
    strh r3, [r1, #0x0]
    ldrh r3, [r1, #0x0]
    bic r3, r3, #0x3000
    orr r3, r3, #0x8
    strh r3, [r1, #0x0]
    ldrh r3, [r1, #0x0]
    and r2, r3, r2
    strh r2, [r1, #0x0]
    bl func_020b0348
    mov r0, #0x0
    bl func_ov048_0220b9a0
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl GX_SetGraphicsMode
    bl TitleDisplay_ResetMainBgScroll
    mov r0, #0x1
    mov r1, #0x0
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetMainBgPriorities
    ldr r1, .L_0220b988
    mov r2, #0x0
    mov r0, #0x5
    strh r2, [r1, #0x0]
    bl GXS_SetGraphicsMode
    ldr r0, .L_0220b98c
    ldr r5, .L_0220b990
    ldrsh r2, [r0, #0x2]
    ldrh r3, [r5, #0x0]
    ldrsh r1, [r0, #0x0]
    and r0, r3, #0x43
    orr r0, r0, #0x84
    orr r0, r0, #0x4000
    strh r0, [r5, #0x0]
    str r1, [sp, #0xc]
    rsb r1, r1, #0x0
    str r1, [sp, #0x10]
    str r2, [sp, #0x8]
    str r2, [sp, #0x14]
    mov r2, #0x0
    str r2, [sp, #0x0]
    add r0, r5, #0x14
    add r1, sp, #0x8
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_020afd28
    sub r2, r5, #0xc
    ldr r0, [r2, #0x0]
    mov r1, #0x0
    bic r0, r0, #0x60
    orr r0, r0, #0x20
    str r0, [r2, #0x0]
    ldr ip, .L_0220b994
    mov r0, r1
.L_0220b8dc:
    mov r2, r1, lsl #0x6
    and r3, r2, #0xff
    mov r5, r1, lsl #0x2
    mov r2, r0
    orr r3, r3, ip
    add r6, r4, r5, lsl #0x3
.L_0220b8f4:
    mov r7, r2, lsl #0x1d
    mov lr, r2, lsl #0x3
    add r5, r6, r2, lsl #0x3
    orr r7, r3, r7, lsr #0x7
    add lr, lr, r1, lsl #0x8
    add r2, r2, #0x1
    str r7, [r5, #0x4]
    orr lr, lr, #0xf000
    strh lr, [r5, #0x8]
    cmp r2, #0x4
    blt .L_0220b8f4
    add r1, r1, #0x1
    cmp r1, #0x3
    blt .L_0220b8dc
    add r0, r4, #0x4
    mov r1, #0x400
    bl func_020b4554
    bl func_020b44e8
    add r0, r4, #0x4
    mov r1, #0x0
    mov r2, #0x400
    bl func_020b1e5c
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetSubBgPriorities
    ldr r1, .L_0220b998
    mov r0, #0x2
    str r0, [r1, #0x0]
    ldr r0, .L_0220b99c
    str r0, [r1, #0x40]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220b97c: .word 0x4000060
.L_0220b980: .word 0xffffcffd
.L_0220b984: .word 0xcfdf
.L_0220b988: .word 0x4000050
.L_0220b98c: .word gFx32CosSinTable
.L_0220b990: .word 0x400100c
.L_0220b994: .word 0xc0000c00
.L_0220b998: .word 0x4000540
.L_0220b99c: .word 0xbfff0000
.size func_ov048_0220b7b8, . - func_ov048_0220b7b8
