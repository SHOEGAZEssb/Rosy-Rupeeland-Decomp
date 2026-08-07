    .text
/* Exact fallback; see src/overlays/ov021/overlay021_dialog_runtime.c. */
    .extern data_021f5ed0
    .extern func_02075598
    .extern func_02092e9c
    .extern func_02093360
    .extern func_020939d8
    .extern func_ov045_0220c028
    .extern func_ov045_0220c128
    .extern func_ov045_0220d2f8
    .extern gDebugFont

.global func_ov021_021ff1d0
func_ov021_021ff1d0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x388]
    mov r5, r1
    bl func_020939d8
    ldr r1, [r4, #0x388]
    mov r0, #0xd
    str r0, [r1, #0xd0]
    mov r0, #0x0
    str r0, [r1, #0xd4]
    ldr r0, [r4, #0x388]
    mov r1, r5
    mov r2, #0x4
    bl func_02092e9c
    ldr r0, [r4, #0x388]
    ldr r1, L_021ff26c
    bl func_02093360
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    beq L_021ff240
    ldr r1, [r4, #0x388]
    ldr r0, [r4, #0x38c]
    ldr r1, [r1, #0xe8]
    bl func_ov045_0220c128
    b L_021ff248
L_021ff240:
    ldr r0, [r4, #0x38c]
    bl func_ov045_0220c028
L_021ff248:
    ldr r0, L_021ff270
    ldr r1, [r4, #0x58]
    ldr r0, [r0, #0x0]
    bl func_02075598
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl func_ov045_0220d2f8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
L_021ff26c: .word data_021f5ed0
L_021ff270: .word gDebugFont
    .size func_ov021_021ff1d0, . - func_ov021_021ff1d0

