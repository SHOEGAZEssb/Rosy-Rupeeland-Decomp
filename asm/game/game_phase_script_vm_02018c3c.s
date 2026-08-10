; Matching retail form; see src/game/game_phase_script_vm_runtime_entity_control_opcodes.c.
.text
.extern data_020e1964
.extern data_020ea9b0
.extern data_020ea9de
.extern data_021052fc
.extern func_0200500c
.extern func_02005058
.extern func_02012704
.extern func_020127f8
.extern Type7Actor_SetMotionTargetWithTimer
.extern Type7Actor_ResetMotionAndCooldown
.extern Type7Actor_ClearTarget
.extern Type7Actor_DisableTargeting
.extern Type7Actor_SetFlag40StateEnabled
.extern Type7Actor_SetActorEnabled
.extern Type7Actor_ConfigureAttachmentController
.extern Type7Actor_StartAnimation19Interaction
.extern Type7Actor_SpawnFromRecord
.global func_02018c3c
func_02018c3c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r9, r0
    bl func_02012704
    mov r6, r0
    mov r0, r9
    bl func_02012704
    mov r5, r0
    mov r0, r9
    bl func_02012704
    mov r4, r0
    mov r0, r9
    bl func_02012704
    mov r7, r0
    mov r0, r9
    bl func_02012704
    ldr r1, L_02018f00
    cmp r0, #0xf
    ldr r2, [r1, #0x0]
    add r1, r2, #0x2000
    ldr r8, [r1, #0xea8]
    addls pc, pc, r0, lsl #0x2
    b L_02018ef4
L_02018c98: ; jump table
    b L_02018cd8 ; case 0
    b L_02018cfc ; case 1
    b L_02018ef4 ; case 2
    b L_02018d10 ; case 3
    b L_02018d28 ; case 4
    b L_02018d50 ; case 5
    b L_02018d88 ; case 6
    b L_02018da0 ; case 7
    b L_02018db8 ; case 8
    b L_02018ddc ; case 9
    b L_02018e2c ; case 10
    b L_02018e4c ; case 11
    b L_02018e6c ; case 12
    b L_02018e7c ; case 13
    b L_02018ec0 ; case 14
    b L_02018ecc ; case 15
L_02018cd8:
    str r6, [sp, #0x0]
    add r0, r2, #0x3000
    ldr r1, [r0, #0xbc]
    mov r0, r7
    ldr r1, [r1, #0x0]
    mov r2, r4
    mov r3, r5
    bl Type7Actor_SpawnFromRecord
    b L_02018ef4
L_02018cfc:
    cmp r8, #0x0
    beq L_02018ef4
    mov r0, r8
    bl Type7Actor_ClearTarget
    b L_02018ef4
L_02018d10:
    cmp r8, #0x0
    beq L_02018ef4
    mov r0, r8
    mov r1, r7
    bl Type7Actor_SetFlag40StateEnabled
    b L_02018ef4
L_02018d28:
    cmp r8, #0x0
    beq L_02018ef4
    cmp r4, #0x0
    movne r2, #0x1
    mov r1, r7, lsl #0x10
    moveq r2, #0x0
    mov r0, r8
    mov r1, r1, lsr #0x10
    bl Type7Actor_StartAnimation19Interaction
    b L_02018ef4
L_02018d50:
    cmp r8, #0x0
    beq L_02018ef4
    add r0, sp, #0x4
    mov r1, r7, lsl #0xc
    mov r2, r4, lsl #0xc
    mov r3, r5, lsl #0xc
    bl func_0200500c
    add r1, sp, #0x4
    mov r0, r8
    mov r2, #0xb4
    bl Type7Actor_SetMotionTargetWithTimer
    add r0, sp, #0x4
    bl func_02005058
    b L_02018ef4
L_02018d88:
    cmp r8, #0x0
    beq L_02018ef4
    mov r0, r8
    mov r1, r7
    bl Type7Actor_SetActorEnabled
    b L_02018ef4
L_02018da0:
    cmp r8, #0x0
    beq L_02018ef4
    mov r0, r8
    mov r1, r7
    bl Type7Actor_ConfigureAttachmentController
    b L_02018ef4
L_02018db8:
    cmp r8, #0x0
    beq L_02018ef4
    ldr r0, [r8, #0x268]
    cmp r7, #0x0
    bicne r0, r0, #0x4000
    strne r0, [r8, #0x268]
    orreq r0, r0, #0x4000
    streq r0, [r8, #0x268]
    b L_02018ef4
L_02018ddc:
    mov r0, r9
    mvn r1, #0x0
    bl func_020127f8
    mov r4, #0x0
    ldr r2, L_02018f04
    mov r0, #0x68
    b L_02018e20
L_02018df8:
    mul r3, r4, r0
    ldrsh r1, [r2, r3]
    cmp r7, r1
    bne L_02018e1c
    ldr r1, L_02018f08
    mov r0, r9
    ldrsh r1, [r1, r3]
    bl func_020127f8
    b L_02018ef4
L_02018e1c:
    add r4, r4, #0x1
L_02018e20:
    cmp r4, #0x24
    blt L_02018df8
    b L_02018ef4
L_02018e2c:
    cmp r8, #0x0
    bne L_02018ef4
    ldr r0, L_02018f0c
    mvn r1, #0x0
    ldr r2, [r0, #0x0]
    cmp r2, r1
    strne r1, [r0, #0x0]
    b L_02018ef4
L_02018e4c:
    cmp r8, #0x0
    ldreq r0, L_02018f0c
    mvneq r1, #0x0
    streq r1, [r0, #0x0]
    beq L_02018ef4
    mov r0, r8
    bl Type7Actor_DisableTargeting
    b L_02018ef4
L_02018e6c:
    cmp r8, #0x0
    addne r0, r8, #0x200
    strneh r7, [r0, #0xa6]
    b L_02018ef4
L_02018e7c:
    cmp r8, #0x0
    beq L_02018ef4
    cmp r7, #0x0
    ldr r0, [r8, #0x14]
    beq L_02018ea8
    orr r0, r0, #0x400
    str r0, [r8, #0x14]
    ldr r0, [r8, #0xd0]
    orr r0, r0, #0x4
    str r0, [r8, #0xd0]
    b L_02018ef4
L_02018ea8:
    bic r0, r0, #0x400
    str r0, [r8, #0x14]
    ldr r0, [r8, #0xd0]
    bic r0, r0, #0x4
    str r0, [r8, #0xd0]
    b L_02018ef4
L_02018ec0:
    cmp r8, #0x0
    strne r7, [r8, #0x1fc]
    b L_02018ef4
L_02018ecc:
    cmp r8, #0x0
    beq L_02018ef4
    ldr r0, [r8, #0x268]
    tst r0, #0x10
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_02018ef4
    mov r0, r8
    bl Type7Actor_ResetMotionAndCooldown
L_02018ef4:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_02018f00: .word data_021052fc
L_02018f04: .word data_020ea9b0
L_02018f08: .word data_020ea9de
L_02018f0c: .word data_020e1964
.size func_02018c3c, . - func_02018c3c
