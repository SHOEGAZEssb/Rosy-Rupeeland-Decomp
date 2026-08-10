.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern data_021052fc
.extern func_02007f0c
.extern func_0200807c
.extern func_020080d0
.extern func_02028388
.extern ActorCollection_GetSpriteOwner
.extern ActorCollection_SetActorScale
.extern func_0203bae4
.extern func_02072b68
.extern func_020adc90
.extern func_ov059_02210f34

.global func_ov059_02210dfc
func_ov059_02210dfc:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r2, .L_02210f20
    mov r5, r0
    ldr r0, [r2, #0x0]
    mov r4, r1
    bl func_020080d0
    ldr r0, [r5, #0x8]
    add r0, r0, r4, lsl #0x1
    ldrsh r0, [r0, #0x8]
    sub r0, r0, #0x1
    bl func_02028388
    ldr r2, .L_02210f20
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, #0x0
    bl func_0200807c
    ldr r0, .L_02210f20
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r6, r0
    ldr r1, .L_02210f24
    mov r0, #0x1000
    bl func_020adc90
    mov r1, r0
    mov r0, r6
    bl ActorCollection_SetActorScale
    mov r0, r6
    bl ActorCollection_GetSpriteOwner
    mov r1, #0x8
    str r1, [r0, #0x18]
    mov r1, #0x0
    str r1, [r0, #0x1c]
    mov r0, r5
    bl func_ov059_02210f34
    ldr r0, .L_02210f20
    ldr r1, [r5, #0x8]
    ldr r3, [r0, #0x0]
    add r1, r1, r4, lsl #0x1
    ldrsh r2, [r1, #0x8]
    add r1, r3, #0x3000
    add r0, r3, #0x2000
    ldr r1, [r1, #0xbc]
    ldr r0, [r0, #0xfb8]
    ldr r1, [r1, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xebc]
    cmp r1, r2
    mov r4, #0x2
    beq .L_02210eec
    ldr r1, .L_02210f28
    str r4, [sp, #0x0]
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0203bae4
    mov r1, #0x0
    mov r4, r0
    bl func_02072b68
    b .L_02210f0c
.L_02210eec:
    ldr r1, .L_02210f2c
    ldr r2, .L_02210f30
    add r3, r1, #0x1
    str r4, [sp, #0x0]
    bl func_0203bae4
    mov r1, #0x1d
    mov r4, r0
    bl func_02072b68
.L_02210f0c:
    ldrh r0, [r4, #0x24]
    orr r0, r0, #0x2
    strh r0, [r4, #0x24]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02210f20: .word data_021052fc
.L_02210f24: .word 0x3333
.L_02210f28: .word 0x30d3
.L_02210f2c: .word 0x138a
.L_02210f30: .word 0x1078
.size func_ov059_02210dfc, . - func_ov059_02210dfc
