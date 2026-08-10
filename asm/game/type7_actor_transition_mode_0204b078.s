; Matching retail form; see src/game/type7_actor_transition_mode.c.
.extern data_021052fc
.extern AttachmentController_SetEnabled
.extern ActorDerivedType1_SetSpecialModeEnabled
.extern func_02047d40
.extern func_0204ced8
.extern func_0204cf28
.text
    .global func_0204b078
func_0204b078: ; 0x0204b078
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    ldr r1, [r4, #0x268]
    beq .L_0204b0d0
    bic r1, r1, #0x400
    str r1, [r4, #0x268]
    bl func_02047d40
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
    ldr r1, [r4, #0xa8]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x2000000
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.L_0204b0d0:
    orr r1, r1, #0x400
    bic r1, r1, #0x3000
    str r1, [r4, #0x268]
    add r0, r4, #0x2a8
    mov r1, #0x0
    bl AttachmentController_SetEnabled
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0xa8]
    cmp r1, #0x0
    beq .L_0204b128
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2000000
    str r0, [r4, #0x14]
.L_0204b128:
    ldr r0, .L_0204b144
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_SetSpecialModeEnabled
    ldmia sp!, {r4, pc}
.L_0204b144: .word data_021052fc
.size func_0204b078, . - func_0204b078

    .global func_0204b148
func_0204b148: ; 0x0204b148
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mvn r1, #0x1
    mov r5, r0
    cmp r4, r1
    bne .L_0204b17c
    ldr r1, [r5, #0x268]
    add r0, r5, #0x2a8
    bic r2, r1, #0x3000
    mov r1, #0x0
    str r2, [r5, #0x268]
    bl AttachmentController_SetEnabled
    ldmia sp!, {r3, r4, r5, pc}
.L_0204b17c:
    add r0, r1, #0x1
    cmp r4, r0
    ldr r1, [r5, #0x268]
    bne .L_0204b1a4
    orr r2, r1, #0x3000
    add r0, r5, #0x2a8
    mov r1, #0x0
    str r2, [r5, #0x268]
    bl AttachmentController_SetEnabled
    ldmia sp!, {r3, r4, r5, pc}
.L_0204b1a4:
    orr r1, r1, #0x1000
    add r0, r5, #0x200
    str r1, [r5, #0x268]
    ldrsh r0, [r0, #0xb6]
    cmp r0, #0x0
    beq .L_0204b1c4
    add r0, r5, #0x2a8
    bl func_0204cf28
.L_0204b1c4:
    add r0, r5, #0x2a8
    and r1, r4, #0xff
    bl func_0204ced8
    add r0, r5, #0x2a8
    mov r1, #0x1
    bl AttachmentController_SetEnabled
    ldmia sp!, {r3, r4, r5, pc}
.size func_0204b148, . - func_0204b148

