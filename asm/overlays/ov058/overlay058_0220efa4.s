.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern GameWork_TestFlag
.extern data_020f4e14
.extern func_020740a4
.extern GraphicsSpriteRenderer_SetTextGridPosition
.extern func_020befec
.extern func_ov058_0220e598
.extern func_ov058_0220e63c
.extern func_ov058_0220e664
.extern func_ov058_0220e68c
.extern func_ov058_0220e6b0
.extern func_ov058_0220ed64
.extern func_ov058_0220eef0
.extern gDebugFont
.extern gGameWork

.global func_ov058_0220efa4
func_ov058_0220efa4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0220f10c
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0220f110
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220f084
    ldr r0, .L_0220f10c
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_0220f084
    ldr r0, [r4, #0x80]
    bl func_ov058_0220e63c
    ldr r0, [r4, #0x80]
    bl func_ov058_0220e6b0
    ldr r0, [r4, #0x80]
    bl func_ov058_0220e664
    ldr r0, [r4, #0x80]
    bl func_ov058_0220e68c
    ldr r2, [r4, #0x4c]
    mov r1, #0xc
    mov r0, r2, asr #0x2
    add r0, r2, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    bl func_020befec
    ldr r1, [r4, #0x4c]
    mov r5, r0
    add r1, r1, #0x1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    str r1, [r4, #0x4c]
    mov r0, r0, asr #0x3
    mov r1, #0xc
    bl func_020befec
    cmp r5, r0
    beq .L_0220f064
    add r2, r0, #0x1
    mov r0, #0xc
    mul r1, r2, r0
    b .L_0220f054
.L_0220f050:
    sub r1, r1, #0x40
.L_0220f054:
    cmp r1, #0x40
    bge .L_0220f050
    mov r0, r4
    bl func_ov058_0220eef0
.L_0220f064:
    ldr r0, [r4, #0xac]
    cmp r0, #0x0
    beq .L_0220f084
    subs r0, r0, #0x1
    str r0, [r4, #0xac]
    bne .L_0220f084
    mov r0, r4
    bl func_ov058_0220ed64
.L_0220f084:
    ldr r0, [r4, #0x14]
    bl func_ov058_0220e598
    ldr r0, [r4, #0x48]
    ldr r2, [r4, #0x4c]
    ldr r1, [r4, #0xc]
    rsb r0, r0, #0x0
    str r0, [r1, #0x18]
    rsb r0, r2, #0x60
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x48]
    ldr r2, [r4, #0x4c]
    ldr r1, [r4, #0x10]
    rsb r0, r0, #0x0
    str r0, [r1, #0x18]
    rsb r0, r2, #0x120
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0xc]
    bl func_020740a4
    ldr r0, [r4, #0x10]
    bl func_020740a4
    ldr r0, .L_0220f114
    ldr r1, [r4, #0x48]
    ldr r0, [r0, #0x0]
    rsb r1, r1, #0x0
    mov r2, #0x0
    bl GraphicsSpriteRenderer_SetTextGridPosition
    ldr r0, .L_0220f118
    ldr r1, [r4, #0x48]
    ldr r0, [r0, #0x0]
    rsb r1, r1, #0x0
    mov r2, #0x0
    bl GraphicsSpriteRenderer_SetTextGridPosition
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_0220f10c: .word gGameWork
.L_0220f110: .word 0x3d3
.L_0220f114: .word data_020f4e14
.L_0220f118: .word gDebugFont
.size func_ov058_0220efa4, . - func_ov058_0220efa4
