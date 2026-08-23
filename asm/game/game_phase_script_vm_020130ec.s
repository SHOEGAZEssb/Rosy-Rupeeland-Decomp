; Matching retail form; see src/game/game_phase_script_vm_movement_opcode.c.
.text
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Stepper_InitTransition
.extern VecFx32Stepper_Assign
.extern VecFx32Stepper_Destroy
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern Actor_UpdateAttachmentDirectionFromVector
.extern func_020adc40
.extern func_020befec

    .global GamePhaseActorScriptVm_StartMovement
GamePhaseActorScriptVm_StartMovement: ; 0x020130ec
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x50
    mov r9, r0
    bl GamePhaseScriptVm_Pop
    mov r11, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    str r0, [sp, #0x8]
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r5, r0, lsl #0xc
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r6, r0, lsl #0xc
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r7, r0, lsl #0xc
    add r0, sp, #0x40
    bl VecFx32Object_Init
    mov r8, #0x0
    ldr r0, [r9, #0x84]
    str r8, [sp, #0x0]
    ldrb r1, [r0, #0xe6]
    mov r10, r8
    cmp r1, #0x1
    bne L_02013204
    cmp r4, #0x7
    addls pc, pc, r4, lsl #0x2
    b L_020131b0
L_0201316c: ; jump table
    b L_0201318c ; case 0
    b L_0201319c ; case 1
    b L_0201318c ; case 2
    b L_0201319c ; case 3
    b L_0201318c ; case 4
    b L_0201319c ; case 5
    b L_0201318c ; case 6
    b L_0201319c ; case 7
L_0201318c:
    mov r1, r7
    mov r2, r6
    bl Actor_UpdateAttachmentDirectionFromVector
    b L_020131b0
L_0201319c:
    ldr r1, [r0, #0x1c]
    ldr r2, [r0, #0x20]
    sub r1, r7, r1
    sub r2, r6, r2
    bl Actor_UpdateAttachmentDirectionFromVector
L_020131b0:
    ldr r0, [r9, #0x84]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r9, #0x84]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x20
    strh r0, [r1, #0x24]
    ldr r0, [r9, #0x84]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r0, [r9, #0x84]
    ldr r1, [r0, #0x54]
    ldrsh r0, [r1, #0x36]
    cmp r0, #0x0
    moveq r0, #0x100
    streqh r0, [r1, #0x36]
L_02013204:
    cmp r4, #0x7
    addls pc, pc, r4, lsl #0x2
    b L_020132b8
L_02013210: ; jump table
    b L_02013230 ; case 0
    b L_0201327c ; case 1
    b L_02013230 ; case 2
    b L_0201327c ; case 3
    b L_02013230 ; case 4
    b L_0201327c ; case 5
    b L_02013230 ; case 6
    b L_0201327c ; case 7
L_02013230:
    ldr r0, [r9, #0x84]
    cmp r11, #0x0
    ldr r0, [r0, #0x1c]
    str r7, [sp, #0x0]
    add r0, r0, r7
    str r0, [sp, #0x44]
    ldr r0, [r9, #0x84]
    mov r8, r6
    ldr r0, [r0, #0x20]
    mov r10, r5
    add r0, r0, r6
    str r0, [sp, #0x48]
    ldr r0, [r9, #0x84]
    ldrne r0, [r0, #0x24]
    addne r0, r0, r5
    strne r0, [sp, #0x4c]
    ldreq r0, [r0, #0x24]
    streq r0, [sp, #0x4c]
    b L_020132b8
L_0201327c:
    ldr r1, [r9, #0x84]
    cmp r11, #0x0
    ldr r0, [r1, #0x1c]
    ldr r2, [r1, #0x20]
    ldr r1, [r1, #0x24]
    sub r0, r7, r0
    str r7, [sp, #0x44]
    str r6, [sp, #0x48]
    strne r5, [sp, #0x4c]
    str r0, [sp, #0x0]
    ldreq r0, [r9, #0x84]
    sub r8, r6, r2
    ldreq r0, [r0, #0x24]
    sub r10, r5, r1
    streq r0, [sp, #0x4c]
L_020132b8:
    cmp r4, #0x7
    addls pc, pc, r4, lsl #0x2
    b L_02013354
L_020132c4: ; jump table
    b L_020132e4 ; case 0
    b L_020132e4 ; case 1
    b L_020132e4 ; case 2
    b L_020132e4 ; case 3
    b L_020132f0 ; case 4
    b L_020132f0 ; case 5
    b L_020132f0 ; case 6
    b L_020132f0 ; case 7
L_020132e4:
    ldr r0, [sp, #0x8]
    str r0, [sp, #0x4]
    b L_02013354
L_020132f0:
    smull r0, r2, r10, r10
    adds r3, r0, #0x800
    ldr r0, [sp, #0x0]
    smull r1, r4, r0, r0
    adc r0, r2, #0x0
    adds r5, r1, #0x800
    mov r1, r3, lsr #0xc
    smull r3, r2, r8, r8
    adc r4, r4, #0x0
    adds r3, r3, #0x800
    mov r5, r5, lsr #0xc
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r5, r5, r4, lsl #0x14
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r5, r3
    add r0, r1, r0
    bl func_020adc40
    ldr r1, [sp, #0x8]
    bl func_020befec
    str r0, [sp, #0x4]
    cmp r0, #0x0
    movle r0, #0x1
    strle r0, [sp, #0x4]
L_02013354:
    ldr r3, [r9, #0x84]
    add r0, sp, #0xc
    ldr r2, [r3, #0x10]
    add r1, sp, #0x40
    orr r2, r2, #0x40
    str r2, [r3, #0x10]
    ldr r2, [r9, #0x84]
    ldr r3, [sp, #0x4]
    add r2, r2, #0x18
    bl VecFx32Stepper_InitTransition
    ldr r0, [r9, #0x84]
    add r1, sp, #0xc
    add r0, r0, #0x198
    bl VecFx32Stepper_Assign
    add r0, sp, #0xc
    bl VecFx32Stepper_Destroy
    ldr r3, [r9, #0x84]
    ldr r1, [sp, #0x4]
    ldr r2, [r3, #0x10]
    mov r0, r9
    bic r2, r2, #0x1
    str r2, [r3, #0x10]
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    ldr r1, [r9, #0x84]
    ldrsh r0, [r1, #0xe4]
    cmp r0, #0x1
    bne L_020133d4
    ldr r1, [r1, #0x54]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x20
    strneh r0, [r1, #0x24]
L_020133d4:
    add r0, sp, #0x40
    bl VecFx32Object_Destroy
    mov r0, #0x0
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size GamePhaseActorScriptVm_StartMovement, . - GamePhaseActorScriptVm_StartMovement
