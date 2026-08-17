    .text
/* Exact fallback; see src/overlays/ov021/overlay021_dialog_runtime.c. */
    .extern data_021f5128
    .extern data_021f5ed0
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern RecordMode_GetMessage
    .extern func_02092e9c
    .extern func_02093360
    .extern func_020939d8
    .extern func_ov045_0220c028
    .extern func_ov045_0220c128
    .extern func_ov045_0220d2f8
    .extern gDebugFont

.global func_ov021_021ff0e0
func_ov021_021ff0e0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r2, L_021ff1c4
    mov r5, r0
    ldr r3, [r2, #0x0]
    ldr r2, [r5, #0x54]
    ldr r0, [r5, #0x388]
    mov r4, r1
    ldr r6, [r3, r2, lsl #0x2]
    bl func_020939d8
    ldr r3, [r5, #0x388]
    mov r0, #0xd
    str r0, [r3, #0xd0]
    mov r2, #0x0
    mov r0, r6
    mov r1, r4
    str r2, [r3, #0xd4]
    bl RecordMode_GetMessage
    mov r1, r0
    ldr r0, [r5, #0x388]
    mov r2, #0x4
    bl func_02092e9c
    ldr r0, [r5, #0x388]
    ldr r1, L_021ff1c8
    bl func_02093360
    mov r1, r0, lsl #0x16
    movs r1, r1, asr #0x1f
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    beq L_021ff184
    cmp r4, #0xa
    bne L_021ff170
    ldr r0, [r5, #0x38c]
    mov r1, #0x3
    bl func_ov045_0220c128
    b L_021ff1a0
L_021ff170:
    ldr r1, [r5, #0x388]
    ldr r0, [r5, #0x38c]
    ldr r1, [r1, #0xe8]
    bl func_ov045_0220c128
    b L_021ff1a0
L_021ff184:
    cmp r4, #0xa
    ldr r0, [r5, #0x38c]
    bne L_021ff19c
    mov r1, #0x3
    bl func_ov045_0220c128
    b L_021ff1a0
L_021ff19c:
    bl func_ov045_0220c028
L_021ff1a0:
    ldr r0, L_021ff1cc
    ldr r1, [r5, #0x58]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    bl func_ov045_0220d2f8
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
L_021ff1c4: .word data_021f5128
L_021ff1c8: .word data_021f5ed0
L_021ff1cc: .word gDebugFont
    .size func_ov021_021ff0e0, . - func_ov021_021ff0e0

