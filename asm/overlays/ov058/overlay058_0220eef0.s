.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern GameWork_SetFlag
.extern data_ov058_0220fd0c
.extern func_ov058_0220f228
.extern gGameWork

.global func_ov058_0220eef0
func_ov058_0220eef0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xa8]
    mov r4, r1
    ldrh r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0220ef28
    ldr r0, .L_0220ef98
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_0220ef9c
    ldr r0, [r0, #0x0]
    str r0, [r5, #0xa8]
.L_0220ef28:
    ldr r1, [r5, #0xa8]
    ldr r0, .L_0220efa0
    ldrh r1, [r1, #0x0]
    mov r2, #0x2
    cmp r1, r0
    beq .L_0220ef4c
    add r0, r0, #0xc
    cmp r1, r0
    b .L_0220ef50
.L_0220ef4c:
    mov r2, #0x3
.L_0220ef50:
    ldr r1, [r5, #0x54]
    mov r0, r5
    add r1, r5, r1, lsl #0x2
    str r2, [r1, #0x58]
    ldr r1, [r5, #0x54]
    add r1, r5, r1, lsl #0x2
    str r4, [r1, #0x6c]
    ldr r1, [r5, #0x54]
    add r2, r1, #0x1
    str r2, [r5, #0x54]
    bl func_ov058_0220f228
    ldr r0, [r5, #0x54]
    cmp r0, #0x5
    movge r0, #0x0
    strge r0, [r5, #0x54]
    mov r0, #0x20
    str r0, [r5, #0xac]
    ldmia sp!, {r3, r4, r5, pc}
.L_0220ef98: .word gGameWork
.L_0220ef9c: .word data_ov058_0220fd0c
.L_0220efa0: .word 0xee04
.size func_ov058_0220eef0, . - func_ov058_0220eef0
