.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern gFx32CosSinTable
.extern GraphicsSpriteState_SetAnimationIndex
.extern Presentation_InterpolateSmoothStep
.extern PresentationScalar_SetImmediate
.extern Presentation_AdvanceTransitions
.extern func_020befec
.extern func_ov094_02217bc8
.extern func_ov094_02217be0

.global func_ov094_02217a10
func_ov094_02217a10:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0xa4]
    cmp r1, #0x0
    beq .L_02217a38
    cmp r1, #0x1
    beq .L_02217b50
    cmp r1, #0x2
    beq .L_02217b98
    b .L_02217bb4
.L_02217a38:
    bl Presentation_AdvanceTransitions
    ldr r0, [r4, #0xac]
    add r3, r0, #0x1
    str r3, [r4, #0xac]
    ldr r2, [r4, #0xb0]
    cmp r3, r2
    ble .L_02217a94
    ldr r1, [r4, #0xa8]
    mov r0, #0x0
    rsb r1, r1, #0x1
    str r1, [r4, #0xa8]
    str r0, [r4, #0xac]
    ldr r2, [r4, #0xb4]
    ldr r1, [r4, #0xa8]
    ldr r0, [r4, #0x9c]
    add r1, r2, r1
    and r5, r1, #0xff
    mov r1, r5
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xa0]
    mov r1, r5
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_02217b20
.L_02217a94:
    ldr r0, [r4, #0xb8]
    cmp r0, #0x0
    ldr r0, [r4, #0xa8]
    beq .L_02217abc
    cmp r0, #0x0
    mov r0, #0x10000
    rsbne r0, r0, #0x0
    movne r1, #0x10000
    subeq r1, r0, #0x20000
    b .L_02217ad0
.L_02217abc:
    cmp r0, #0x0
    mov r0, #0x10000
    subne r1, r0, #0x20000
    rsbeq r0, r0, #0x0
    moveq r1, #0x10000
.L_02217ad0:
    bl Presentation_InterpolateSmoothStep
    mov r1, r0
    add r0, r4, #0x3c
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0xac]
    ldr r1, [r4, #0xb0]
    mov r0, r0, lsl #0x10
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, .L_02217bc4
    mov r1, r1, lsl #0x1
    ldrsh r1, [r0, r1]
    add r0, r4, #0x4c
    rsb r1, r1, #0x0
    mov r1, r1, lsl #0x2
    bl PresentationScalar_SetImmediate
.L_02217b20:
    mov r0, r4
    bl func_ov094_02217bc8
    cmp r0, #0x0
    beq .L_02217bb4
    mov r0, #0x1e
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xa4]
    add r0, r0, #0x1
    str r0, [r4, #0xa4]
    b .L_02217bb4
.L_02217b50:
    bl Presentation_AdvanceTransitions
    cmp r0, #0x0
    beq .L_02217bb4
    ldr r1, [r4, #0xb4]
    ldr r0, [r4, #0xa8]
    add r1, r1, #0x9
    sub r0, r1, r0
    and r5, r0, #0xff
    ldr r0, [r4, #0x9c]
    mov r1, r5
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xa0]
    mov r1, r5
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xa4]
    add r0, r0, #0x1
    str r0, [r4, #0xa4]
    b .L_02217bb4
.L_02217b98:
    ldr r0, [r4, #0x9c]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_02217bb4:
    mov r0, r4
    bl func_ov094_02217be0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02217bc4: .word gFx32CosSinTable
.size func_ov094_02217a10, . - func_ov094_02217a10
