; Matching retail form; see src/overlays/ov000/overlay000_grid_update.c.
.text
.extern data_020c9670
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_02094574
.extern func_020958d8
.global func_ov000_021fc164
func_ov000_021fc164: ; 0x021fc164
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x24
    bl func_020958d8
    add r0, r4, #0xd0
    bl func_020958d8
    add r0, r4, #0x17c
    bl func_020958d8
    ldr r0, [r4, #0x8]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0xc]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x26c]
    bl func_02094574
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x2ac]
    cmp r0, #0x0
    subgt r0, r0, #0x1
    strgt r0, [r4, #0x2ac]
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x2a8]
    mov r2, #0x800
    add r0, r0, #0x200
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r3, r1, #0x1
    ldr r1, L_021fc24c
    mov r3, r3, lsl #0x1
    ldrsh ip, [r1, r3]
    ldr r1, L_021fc250
    mov r3, #0x0
    umull r5, lr, ip, r1
    mla lr, ip, r3, lr
    mov r3, ip, asr #0x1f
    mla lr, r3, r1, lr
    adds r5, r5, #0x800
    adc r1, lr, #0x0
    mov r3, r5, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    mov r1, r3, asr #0x3
    add r1, r3, r1, lsr #0x1c
    sub r3, r2, #0x900
    cmp r3, r1, asr #0x4
    mov r1, r1, asr #0x4
    str r0, [r4, #0x2a8]
    movgt r1, r3
    bgt L_021fc238
    cmp r1, #0x100
    movgt r1, #0x100
L_021fc238:
    ldr r0, [r4, #0x1c]
    cmp r1, #0x0
    moveq r1, #0x10
    strh r1, [r0, #0x32]
    ldmia sp!, {r3, r4, r5, pc}
L_021fc24c: .word data_020c9670
L_021fc250: .word 0x1052
.size func_ov000_021fc164, . - func_ov000_021fc164

