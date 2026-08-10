.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_ov085_02214378
.extern data_ov085_02214380
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov085_02213bd0

.global func_ov085_02213d5c
func_ov085_02213d5c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x4
    strh r1, [r4, #0xd6]
    ldr r1, [r4, #0x22c]
    cmp r1, #0x32
    bne .L_02213dbc
    ldr r1, [r4, #0x250]
    cmp r1, #0x1
    bne .L_02213d98
    ldr r1, .L_02213df0
    mov r3, #0x3c
    ldmia r1, {r1, r2}
    bl func_ov085_02213bd0
    b .L_02213de8
.L_02213d98:
    ldr r0, [r4, #0x54]
    mov r1, #0x1a
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    b .L_02213de8
.L_02213dbc:
    ble .L_02213de8
    ldr r1, [r4, #0x250]
    cmp r1, #0x0
    bne .L_02213de8
    ldr r1, [r4, #0x10]
    tst r1, #0x2000
    beq .L_02213de8
    ldr r1, .L_02213df4
    mov r3, #0x3c
    ldmia r1, {r1, r2}
    bl func_ov085_02213bd0
.L_02213de8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02213df0: .word data_ov085_02214380
.L_02213df4: .word data_ov085_02214378
.size func_ov085_02213d5c, . - func_ov085_02213d5c
