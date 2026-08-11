.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_presentation_update.c.
.extern data_020c9670
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern VecFx32Object_Subtract
.extern func_ov090_0221b3d0
.extern func_ov090_0221baec
.extern func_ov090_0221bc0c
.extern func_ov090_0221c138
.extern func_ov090_0221c170
.extern func_ov090_0221c350

.global func_ov090_0221be40
func_ov090_0221be40:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x44
    mov r9, r0
    add r0, sp, #0x34
    str r1, [sp, #0x0]
    str r2, [sp, #0x4]
    str r3, [sp, #0x8]
    ldr r8, [sp, #0x6c]
    bl VecFx32Object_Init
    ldrh r0, [sp, #0x68]
    mov r5, #0x0
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    mov r1, r0, lsl #0x1
    ldr r0, .L_0221c134
    mov r2, r2, lsl #0x1
    ldrsh r1, [r0, r1]
    ldrsh r0, [r0, r2]
    rsb r7, r1, #0x0
    str r0, [sp, #0xc]
    mov r0, r0, asr #0x1f
    str r0, [sp, #0x10]
    mov r6, r7, asr #0x1f
    b .L_0221c0c0
.L_0221bea4:
    ldrh r1, [r9, #0xa]
    cmp r5, #0x0
    mul r2, r1, r5
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x2
    ldr r1, .L_0221c134
    ldrsh r4, [r1, r2]
    bne .L_0221bf3c
    ldr r2, [r9, #0x4]
    ldr r1, [sp, #0x0]
    ldr r2, [r2, r5, lsl #0x2]
    add r0, sp, #0x24
    add r2, r2, #0x8
    bl func_ov090_0221c138
    add r0, sp, #0x34
    add r1, sp, #0x24
    bl VecFx32Object_Assign
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    mov r0, r9
    add r1, sp, #0x34
    bl func_ov090_0221c350
    cmp r0, #0x0
    beq .L_0221c020
    ldr r0, [r9, #0x4]
    add r1, sp, #0x34
    ldr r0, [r0, r5, lsl #0x2]
    add r0, r0, #0x8
    bl VecFx32Object_Add
    cmp r8, #0x0
    beq .L_0221c020
    ldr r0, [r9, #0x4]
    ldr r1, [sp, #0x0]
    ldr r0, [r0, r5, lsl #0x2]
    bl func_ov090_0221baec
    b .L_0221c020
.L_0221bf3c:
    cmp r5, r0
    bge .L_0221c020
    ldr r2, [r9, #0x4]
    add r0, sp, #0x14
    add r1, r2, r5, lsl #0x2
    ldr r1, [r1, #-0x4]
    ldr r2, [r2, r5, lsl #0x2]
    add r1, r1, #0x8
    add r2, r2, #0x8
    bl func_ov090_0221c138
    add r0, sp, #0x34
    add r1, sp, #0x14
    bl VecFx32Object_Assign
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    ldrh r3, [r9, #0xa]
    sub r1, r5, #0x1
    ldr r2, [sp, #0x3c]
    mul r1, r3, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r3, r1, lsl #0x2
    ldr r1, .L_0221c134
    mov r0, r9
    ldrsh r3, [r1, r3]
    add r1, sp, #0x34
    sub r3, r3, r4
    add r3, r3, r3, lsl #0x1
    add r3, r3, r3, lsr #0x1f
    sub r2, r2, r3, asr #0x1
    str r2, [sp, #0x3c]
    bl func_ov090_0221c350
    cmp r0, #0x0
    beq .L_0221c020
    add r0, sp, #0x34
    mov r1, #0x800
    bl func_ov090_0221b3d0
    ldr r0, [r9, #0x4]
    add r1, sp, #0x34
    ldr r0, [r0, r5, lsl #0x2]
    add r0, r0, #0x8
    bl VecFx32Object_Add
    ldr r0, [r9, #0x4]
    add r1, sp, #0x34
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #-0x4]
    add r0, r0, #0x8
    bl VecFx32Object_Subtract
    cmp r8, #0x0
    beq .L_0221c020
    ldr r1, [r9, #0x4]
    ldr r0, [r1, r5, lsl #0x2]
    add r1, r1, r5, lsl #0x2
    ldr r1, [r1, #-0x4]
    add r1, r1, #0x8
    bl func_ov090_0221baec
.L_0221c020:
    ldr r0, [r9, #0x4]
    ldr r2, [sp, #0xc]
    ldr ip, [r0, r5, lsl #0x2]
    umull r3, r0, r2, r4
    ldr r10, [sp, #0xc]
    mov lr, r4, asr #0x1f
    mla r0, r10, lr, r0
    adds r2, r3, #0x800
    ldr r10, [sp, #0x10]
    mov r2, r2, lsr #0xc
    mla r0, r10, r4, r0
    adc r0, r0, #0x0
    ldr r3, [ip, #0xc]
    orr r2, r2, r0, lsl #0x14
    add r0, r3, r2
    umull r10, r3, r7, r4
    mla r3, r7, lr, r3
    mla r3, r6, r4, r3
    ldr r1, [sp, #0x8]
    adds r4, r10, #0x800
    str r0, [ip, #0xc]
    ldr r0, [r9, #0x4]
    adc r2, r3, #0x0
    mov r3, r4, lsr #0xc
    ldr r0, [r0, r5, lsl #0x2]
    orr r3, r3, r2, lsl #0x14
    ldr r2, [r0, #0x10]
    add r2, r2, r3
    str r2, [r0, #0x10]
    ldr r0, [r9, #0x4]
    ldr r0, [r0, r5, lsl #0x2]
    ldr r0, [r0, #0x4]
    bl func_ov090_0221c170
    cmp r8, #0x0
    beq .L_0221c0bc
    ldr r0, [r9, #0x4]
    ldr r1, [r9, #0x14]
    ldr r0, [r0, r5, lsl #0x2]
    bl func_ov090_0221bc0c
.L_0221c0bc:
    add r5, r5, #0x1
.L_0221c0c0:
    ldrsh r0, [r9, #0x8]
    cmp r5, r0
    blt .L_0221bea4
    ldr r1, [r9, #0x4]
    sub r0, r0, #0x1
    ldr r0, [r1, r0, lsl #0x2]
    ldr r1, [sp, #0x4]
    add r0, r0, #0x8
    bl VecFx32Object_Assign
    cmp r8, #0x0
    beq .L_0221c124
    ldrsh r1, [r9, #0x8]
    ldr r3, [r9, #0x4]
    sub r0, r1, #0x2
    sub r2, r1, #0x1
    ldr r1, [r3, r0, lsl #0x2]
    ldr r0, [r3, r2, lsl #0x2]
    add r1, r1, #0x8
    bl func_ov090_0221baec
    ldrsh r0, [r9, #0x8]
    ldr r2, [r9, #0x4]
    ldr r1, [r9, #0x14]
    sub r0, r0, #0x1
    ldr r0, [r2, r0, lsl #0x2]
    bl func_ov090_0221bc0c
.L_0221c124:
    add r0, sp, #0x34
    bl VecFx32Object_Destroy
    add sp, sp, #0x44
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0221c134: .word data_020c9670
.size func_ov090_0221be40, . - func_ov090_0221be40
