.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern GX_DisableBankForLCDC
.extern GX_SetGraphicsMode
.extern data_021052fc
.extern GamePhaseState_UpdateRenderHelpers
.extern func_0200fc64
.extern func_0201218c
.extern func_0201de4c
.extern func_ov074_02211a0c

.global func_ov074_02210a3c
func_ov074_02210a3c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_02210b70
.L_02210a54:
    b .L_02210a70
    b .L_02210a88
    b .L_02210aa8
    b .L_02210ac8
    b .L_02210ac8
    b .L_02210af8
    b .L_02210b44
.L_02210a70:
    ldr r0, .L_02210b8c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2d8
    add r0, r0, #0x2c00
    bl func_0200fc64
    b .L_02210b70
.L_02210a88:
    ldr r0, .L_02210b8c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2d8
    add r0, r0, #0x2c00
    bl func_0200fc64
    add r0, r4, #0x38
    bl func_ov074_02211a0c
    b .L_02210b70
.L_02210aa8:
    ldr r0, .L_02210b8c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    cmp r0, #0x0
    beq .L_02210b70
    bl func_0201218c
    b .L_02210b70
.L_02210ac8:
    ldr r0, .L_02210b8c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
    ldr r0, .L_02210b8c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    cmp r0, #0x0
    beq .L_02210b70
    bl func_0201218c
    b .L_02210b70
.L_02210af8:
    ldr r0, [r4, #0x140]
    tst r0, #0x1
    beq .L_02210b24
    bic r0, r0, #0x1
    orr r0, r0, #0x2
    str r0, [r4, #0x140]
    bl GX_DisableBankForLCDC
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl GX_SetGraphicsMode
.L_02210b24:
    ldr r0, .L_02210b8c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    cmp r0, #0x0
    beq .L_02210b70
    bl func_0201218c
    b .L_02210b70
.L_02210b44:
    ldr r0, .L_02210b8c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
    ldr r0, .L_02210b8c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    cmp r0, #0x0
    beq .L_02210b70
    bl func_0201218c
.L_02210b70:
    ldr r0, .L_02210b8c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201de4c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02210b8c: .word data_021052fc
.size func_ov074_02210a3c, . - func_ov074_02210a3c
