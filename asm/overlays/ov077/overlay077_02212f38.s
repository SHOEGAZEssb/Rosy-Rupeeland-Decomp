.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern gFx32CosSinTable
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorExtendedType2_UpdateFrame
.extern ActorExtendedType2_GetDescriptorValue2C
.extern func_020ae024
.extern func_ov077_022130b8
.extern func_ov090_0221be40

.global func_ov077_02212f38
func_ov077_02212f38:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022130ac
    mov r0, r4
    bl ActorExtendedType2_UpdateFrame
    ldrb r0, [r4, #0x2a0]
    ldr r1, .L_022130b4
    add r0, r0, #0x3
    strb r0, [r4, #0x2a0]
    ldrb r0, [r4, #0x2a1]
    add r0, r0, #0x1
    strb r0, [r4, #0x2a1]
    ldrb r0, [r4, #0x2a0]
    mov r0, r0, lsl #0x8
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r1, r0]
    mov r0, r0, lsl #0x3
    str r0, [r4, #0x2a8]
    ldrb r0, [r4, #0x2a1]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r1, r0]
    mov r0, r0, lsl #0x3
    str r0, [r4, #0x2ac]
    ldr r1, [r4, #0x29c]
    cmp r1, #0x0
    beq .L_02213000
    add r0, r4, #0x22c
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    ldr r0, [r4, #0x29c]
    ldr r2, [r4, #0x234]
    ldrsh r1, [r0, #0x6e]
    ldrsh r0, [r0, #0x6a]
    sub r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    sub r0, r2, r0, lsl #0xc
    str r0, [r4, #0x234]
.L_02213000:
    ldr r1, [r4, #0x238]
    add r0, sp, #0x18
    add r1, r1, #0x20000
    str r1, [r4, #0x24]
    mov r2, #0x0
    add r1, r4, #0x22c
    str r2, [r4, #0x44]
    bl VecFx32Object_InitCopy
    add r0, sp, #0x8
    add r1, r4, #0x18
    add r2, r4, #0x2a4
    bl func_ov077_022130b8
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue2C
    cmp r0, #0x0
    beq .L_0221304c
    cmp r0, #0x1
    beq .L_02213054
    b .L_02213074
.L_0221304c:
    mov r0, #0x0
    b .L_02213078
.L_02213054:
    ldr r3, [r4, #0x230]
    ldr r0, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    ldr r1, [r4, #0x234]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_020ae024
    b .L_02213078
.L_02213074:
    mov r0, #0x0
.L_02213078:
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r1, [r4, #0x54]
    ldr r0, [r4, #0x298]
    ldrb r3, [r1, #0x3a]
    add r1, sp, #0x8
    add r2, sp, #0x18
    bl func_ov090_0221be40
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
.L_022130ac:
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
.L_022130b4: .word gFx32CosSinTable
.size func_ov077_02212f38, . - func_ov077_02212f38
