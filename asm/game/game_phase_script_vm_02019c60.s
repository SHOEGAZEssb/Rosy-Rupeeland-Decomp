; Matching retail form; see src/game/game_phase_script_vm_runtime_manager_query_opcode.c.
.text
.extern data_021052fc
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern ActorDerivedType1_IsIdleEligible
.extern gSceneManager
.extern SceneManager_GetCurrent
.global func_02019c60
func_02019c60:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    ldr r1, L_02019dcc
    cmp r0, #0x5
    ldr r1, [r1, #0x0]
    mov r4, #0x0
    add r1, r1, #0x2000
    ldr r5, [r1, #0xea4]
    addls pc, pc, r0, lsl #0x2
    b L_02019db8
L_02019c8c: ; jump table
    b L_02019ca4 ; case 0
    b L_02019cb4 ; case 1
    b L_02019ce0 ; case 2
    b L_02019d98 ; case 3
    b L_02019da4 ; case 4
    b L_02019db0 ; case 5
L_02019ca4:
    ldr r0, [r5, #0x230]
    tst r0, #0x800
    movne r4, #0x1
    b L_02019db8
L_02019cb4:
    ldr r0, L_02019dd0
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x2
    beq L_02019db8
    mov r0, r5
    bl ActorDerivedType1_IsIdleEligible
    cmp r0, #0x0
    movne r4, #0x1
    b L_02019db8
L_02019ce0:
    ldr r0, L_02019dd0
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x2
    beq L_02019db8
    ldr ip, [r5, #0xd0]
    mov r2, r4
    mov r1, r2
    mov r3, r2
    tst ip, #0x100
    bne L_02019d38
    tst ip, #0x10000
    bne L_02019d24
    ldr r0, [r5, #0x230]
    tst r0, #0x980000
    beq L_02019d2c
L_02019d24:
    mov r0, #0x1
    b L_02019d30
L_02019d2c:
    mov r0, r2
L_02019d30:
    cmp r0, #0x0
    moveq r3, #0x1
L_02019d38:
    cmp r3, #0x0
    beq L_02019d4c
    ldr r0, [r5, #0x270]
    cmp r0, #0x0
    moveq r1, #0x1
L_02019d4c:
    cmp r1, #0x0
    beq L_02019d8c
    tst ip, #0x10
    ldreq r1, [r5, #0x24]
    ldreq r0, [r5, #0x1dc]
    cmpeq r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq L_02019d8c
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    bne L_02019d8c
    tst ip, #0x4000
    moveq r2, #0x1
L_02019d8c:
    cmp r2, #0x0
    movne r4, #0x1
    b L_02019db8
L_02019d98:
    add r0, r5, #0x200
    ldrsh r4, [r0, #0x94]
    b L_02019db8
L_02019da4:
    add r0, r5, #0x200
    ldrsh r4, [r0, #0x96]
    b L_02019db8
L_02019db0:
    add r0, r5, #0x200
    ldrsh r4, [r0, #0x98]
L_02019db8:
    mov r0, r6
    mov r1, r4
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02019dcc: .word data_021052fc
L_02019dd0: .word gSceneManager
.size func_02019c60, . - func_02019c60
