; Matching retail form; see src/game/game_phase_script_vm_optional_object_query_opcode.c.
.text
.extern func_02012704
.extern func_020127f8
.extern ActorDerivedType1_GetSingletonObject
.extern func_ov088_0221b218
.extern func_ov088_0221b380
.global func_0201a304
func_0201a304:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl func_02012704
    mov r5, r0
    mov r6, #0x0
    bl ActorDerivedType1_GetSingletonObject
    cmp r5, #0x7
    addls pc, pc, r5, lsl #0x2
    b L_0201a3d0
L_0201a328: ; jump table
    b L_0201a348 ; case 0
    b L_0201a374 ; case 1
    b L_0201a380 ; case 2
    b L_0201a394 ; case 3
    b L_0201a3a4 ; case 4
    b L_0201a3b0 ; case 5
    b L_0201a3bc ; case 6
    b L_0201a3c8 ; case 7
L_0201a348:
    cmp r0, #0x0
    beq L_0201a3d0
    add r0, r0, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x20
    movne r0, #0x1
    moveq r0, r6
    cmp r0, #0x0
    moveq r6, #0x1
    movne r6, #0x0
    b L_0201a3d0
L_0201a374:
    bl func_ov088_0221b218
    mov r6, r0
    b L_0201a3d0
L_0201a380:
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r6, #0x1
    b L_0201a3d0
L_0201a394:
    ldr r0, [r0, #0x24c]
    cmp r0, #0x0
    movne r6, #0x1
    b L_0201a3d0
L_0201a3a4:
    ldr r0, [r0, #0x1c]
    mov r6, r0, asr #0xc
    b L_0201a3d0
L_0201a3b0:
    ldr r0, [r0, #0x20]
    mov r6, r0, asr #0xc
    b L_0201a3d0
L_0201a3bc:
    add r0, r0, #0x200
    ldrsh r6, [r0, #0x1c]
    b L_0201a3d0
L_0201a3c8:
    bl func_ov088_0221b380
    mov r6, r0
L_0201a3d0:
    mov r0, r4
    mov r1, r6
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_0201a304, . - func_0201a304
