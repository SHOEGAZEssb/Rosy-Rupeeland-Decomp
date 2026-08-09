.text
; Matching fallback for the portable implementation in src/overlays/ov053/overlay053_recovery.c.
.extern GameWork_TestFlag
.extern data_ov053_0220dcb0
.extern data_ov053_0220dd10
.extern data_ov053_0220dd7c
.extern data_ov053_0220dd80
.extern data_ov053_0220dd82
.extern func_02005580
.extern func_020055d0
.extern func_0200567c
.extern func_0201e250
.extern func_02072b68
.extern func_02073ffc
.extern func_020742cc
.extern func_ov053_0220d600
.extern func_ov053_0220da60
.extern gDebugFont
.extern gGameWork

.global func_ov053_0220d624
func_ov053_0220d624:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r10, r0
    mov r4, r1
    bl func_0201e250
    ldr r1, .L_0220d7dc
    add r0, r10, #0x24
    str r1, [r10, #0x0]
    bl func_ov053_0220d600
    strh r4, [r10, #0x34]
    mov r1, #0x0
    strh r1, [r10, #0x36]
    mov r0, r10
    strh r1, [r10, #0x38]
    bl func_ov053_0220da60
    ldr r0, .L_0220d7e0
    ldr r0, [r0, #0x0]
    bl func_020742cc
    ldr r1, .L_0220d7e4
    str r0, [r10, #0x8]
    add r0, sp, #0x0
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_02005580
    add r0, r10, #0x24
    add r1, sp, #0x0
    bl func_0200567c
    add r0, sp, #0x0
    bl func_020055d0
    mov r9, #0x0
    ldr r6, .L_0220d7e8
    ldr r7, .L_0220d7ec
    ldr r4, .L_0220d7f0
    mov r11, r9
    mov r5, #0x1
    mov r8, #0x2
.L_0220d6b4:
    ldr r0, [r10, #0x8]
    mov r2, r8
    add r1, r10, #0x28
    bl func_02073ffc
    add r1, r10, r9, lsl #0x2
    str r0, [r1, #0xc]
    mov r0, r9, lsl #0x1
    ldrh r1, [r7, r0]
    ldr r0, [r4, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    add r0, r10, r9, lsl #0x2
    beq .L_0220d6fc
    add r1, r9, #0x1
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl func_02072b68
    b .L_0220d708
.L_0220d6fc:
    ldr r0, [r0, #0xc]
    mov r1, r11
    bl func_02072b68
.L_0220d708:
    add r0, r10, r9, lsl #0x2
    ldr r3, [r0, #0xc]
    add r1, r6, r9, lsl #0x3
    ldrh r2, [r3, #0x24]
    add r9, r9, #0x1
    cmp r9, #0x5
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    ldrsh r3, [r1, #0x6]
    ldrsh r1, [r1, #0x4]
    ldr r2, [r0, #0xc]
    strh r1, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    ldr r0, [r0, #0xc]
    strh r5, [r0, #0x28]
    blt .L_0220d6b4
    ldr r0, [r10, #0x8]
    add r1, r10, #0x28
    mov r2, #0x2
    bl func_02073ffc
    str r0, [r10, #0x20]
    ldrh r1, [r10, #0x34]
    add r1, r1, #0x6
    and r1, r1, #0xff
    bl func_02072b68
    ldrh r2, [r10, #0x34]
    ldr r1, .L_0220d7f4
    ldr r0, .L_0220d7f8
    mov r3, r2, lsl #0x3
    ldrsh r2, [r1, r3]
    ldrsh r0, [r0, r3]
    ldr r1, [r10, #0x20]
    mov r5, #0x0
    strh r0, [r1, #0x2c]
    strh r2, [r1, #0x2e]
    ldr r4, [r10, #0x20]
    mov r3, #0x20
    ldrh r0, [r4, #0x24]
    mov r2, #0x64
    mov r1, #0x5
    orr r0, r0, #0x6
    strh r0, [r4, #0x24]
    ldr r4, [r10, #0x20]
    mov r0, r10
    strh r5, [r4, #0x28]
    ldr r4, [r10, #0x20]
    strh r3, [r4, #0x32]
    strh r3, [r4, #0x34]
    strh r5, [r10, #0x3e]
    strh r2, [r10, #0x36]
    strh r1, [r10, #0x3a]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220d7dc: .word data_ov053_0220dd10
.L_0220d7e0: .word gDebugFont
.L_0220d7e4: .word 0x2189
.L_0220d7e8: .word data_ov053_0220dd7c
.L_0220d7ec: .word data_ov053_0220dcb0
.L_0220d7f0: .word gGameWork
.L_0220d7f4: .word data_ov053_0220dd82
.L_0220d7f8: .word data_ov053_0220dd80
.size func_ov053_0220d624, . - func_ov053_0220d624
