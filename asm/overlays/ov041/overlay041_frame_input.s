.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_frame_input.c. */
.extern TouchPanelManager_GetPoint
.extern func_020befec
.extern func_ov041_021fd000
.extern func_ov041_021febd4
.extern func_ov041_021ff868
.extern func_ov041_02200a38
.extern func_ov041_022013cc
.extern func_ov041_0220159c
.extern func_ov041_02202c34
.extern func_ov070_022103d8
.extern gTouchPanelManager
.extern genrand_int32

    .global func_ov041_021fed00
func_ov041_021fed00: ; 0x021fed00
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    ldr r1, .L_021feec0
    mov r4, r0
    ldr r1, [r1, #0x0]
    ldr r0, [r1, #0x4]
    cmp r0, #0x1
    cmpne r0, #0x2
    movne r0, #0x0
    strne r0, [r4, #0x1c8]
    strne r0, [r4, #0x1c4]
    bne .L_021fed6c
    add r0, sp, #0xc
    bl TouchPanelManager_GetPoint
    add r0, sp, #0x0
    bl func_ov041_021fd000
    ldr r1, [sp, #0x10]
    ldr r0, [r4, #0x190]
    ldr r2, [sp, #0x14]
    add r0, r0, r1, lsl #0xc
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x194]
    add r1, sp, #0x0
    add r2, r0, r2, lsl #0xc
    mov r0, r4
    str r2, [sp, #0x8]
    bl func_ov041_021febd4
.L_021fed6c:
    ldr r0, [r4, #0x1f8]
    cmp r0, #0x0
    bne .L_021feeb8
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x0
    ldreq r0, [r4, #0x184]
    cmpeq r0, #0x0
    bne .L_021fedf4
    ldr r5, [r4, #0x180]
    cmp r5, #0x0
    bne .L_021fedc4
    ldr r1, [r4, #0x174]
    mov r0, #0xc0
    mul r0, r1, r0
    mov r1, #0x3
    bl func_020befec
    ldr r1, [r4, #0x8]
    ldr r1, [r1, #0xd8]
    cmp r0, r1, asr #0xc
    movgt r0, #0x2
    strgt r0, [r4, #0x184]
    bgt .L_021fedf4
.L_021fedc4:
    cmp r5, #0x2
    bne .L_021fedf4
    ldr r1, [r4, #0x174]
    mov r0, #0x60
    mul r0, r1, r0
    mov r1, #0x3
    bl func_020befec
    ldr r1, [r4, #0x8]
    ldr r1, [r1, #0xd8]
    cmp r0, r1, asr #0xc
    movgt r0, #0x2
    strgt r0, [r4, #0x184]
.L_021fedf4:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_021fee84
    bl func_ov041_0220159c
    cmp r0, #0x0
    bne .L_021fee84
    ldr r0, [r4, #0x1cc]
    cmp r0, #0x1
    bne .L_021fee54
    ldr r0, [r4, #0xc]
    mov r1, #0x1
    mov r2, #0x32000
    mov r3, #0xb4000
    bl func_ov041_022013cc
    ldr r1, .L_021feec4
    mov r0, #0x4e000
    str r1, [r4, #0x190]
    rsb r0, r0, #0x0
    str r0, [r4, #0x1a0]
    ldr r0, [r4, #0x194]
    add r0, r0, #0xb4000
    str r0, [r4, #0x194]
    str r0, [r4, #0x1a4]
    b .L_021fee84
.L_021fee54:
    bl genrand_int32
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1e
    sub r1, r0, #0x1
    mov r0, #0x5a
    mul r0, r1, r0
    add r1, r0, #0x80
    ldr r0, [r4, #0xc]
    mov r2, r1, lsl #0xc
    mov r1, #0x3
    mov r3, #0xc0000
    bl func_ov041_022013cc
.L_021fee84:
    ldr r0, [r4, #0x10]
    bl func_ov041_021ff868
    ldr r0, [r4, #0x1f4]
    cmp r0, #0x1
    beq .L_021feea0
    ldr r0, [r4, #0x14]
    bl func_ov041_02200a38
.L_021feea0:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_021feeb0
    bl func_ov041_02202c34
.L_021feeb0:
    ldr r0, [r4, #0x8]
    bl func_ov070_022103d8
.L_021feeb8:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_021feec0: .word gTouchPanelManager
.L_021feec4: .word 0xfffc647e
    .size func_ov041_021fed00, . - func_ov041_021fed00

