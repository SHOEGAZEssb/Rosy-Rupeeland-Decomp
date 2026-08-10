.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern data_021052fc
.extern func_02005030
.extern func_02005058
.extern ActorMotionAreaFollower_GetPosition
.extern func_ov073_02210338
.extern func_ov073_022106d0

.global func_ov073_02210a08
func_ov073_02210a08:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r1, [r4, #0x10]
    add r0, sp, #0x0
    add r1, r1, #0x18
    bl func_02005030
    ldr r0, [sp, #0xc]
    add r1, sp, #0x0
    add r0, r0, #0x28000
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x8]
    bl func_ov073_02210338
    ldr r0, [sp, #0xc]
    add r1, sp, #0x0
    add r0, r0, #0x10000
    str r0, [sp, #0xc]
    ldr r0, [r4, #0xc]
    bl func_ov073_02210338
    ldrsh r0, [r4, #0x1a]
    cmp r0, #0x0
    beq .L_02210a6c
    cmp r0, #0x1
    beq .L_02210aa4
    b .L_02210ac8
.L_02210a6c:
    ldrsh r0, [r4, #0x18]
    sub r0, r0, #0x1
    strh r0, [r4, #0x18]
    ldrsh r0, [r4, #0x18]
    cmp r0, #0x0
    bgt .L_02210ac8
    mov r0, #0x1
    strh r0, [r4, #0x1a]
    ldr r0, [r4, #0x8]
    mov r1, #0x0
    str r1, [r0, #0x34]
    ldr r0, [r4, #0xc]
    str r1, [r0, #0x34]
    b .L_02210ac8
.L_02210aa4:
    ldr r1, [r4, #0x8]
    ldr r0, .L_02210b30
    ldr r1, [r1, #0x38]
    cmp r1, r0
    bge .L_02210ac8
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x1
    b .L_02210b28
.L_02210ac8:
    ldr r1, [r4, #0x10]
    ldr r0, .L_02210b34
    ldr r1, [r1, #0x54]
    ldr r0, [r0, #0x0]
    ldrh r5, [r1, #0x28]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    ldr r0, [r4, #0x8]
    mov r2, r5
    bl func_ov073_022106d0
    ldr r0, .L_02210b34
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    ldr r0, [r4, #0xc]
    mov r2, r5
    bl func_ov073_022106d0
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x0
.L_02210b28:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02210b30: .word 0x4cd
.L_02210b34: .word data_021052fc
.size func_ov073_02210a08, . - func_ov073_02210a08
