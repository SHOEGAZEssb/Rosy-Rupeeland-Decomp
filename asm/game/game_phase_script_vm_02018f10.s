; Matching retail form; see src/game/game_phase_script_vm_runtime_entity_query_opcode.c.
.text
.extern data_020e1964
.extern data_021052fc
.extern func_02012704
.extern func_020127f8
.extern ActorCollection_FindActorByDescriptorValue
.extern Actor_GetCollection
.extern func_0204aff4
.extern func_0204c51c
.extern func_0204c59c
.global func_02018f10
func_02018f10:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    bl func_02012704
    mov r6, r0
    mov r0, r4
    bl func_02012704
    mov r5, r0
    mov r0, r4
    bl func_02012704
    mov r7, r0
    cmp r7, #0xf
    mov r1, #0x0
    addls pc, pc, r7, lsl #0x2
    b L_020190ec
L_02018f48: ; jump table
    b L_02018f88 ; case 0
    b L_02018fa4 ; case 1
    b L_02018fb0 ; case 2
    b L_02018fcc ; case 3
    b L_02018ff0 ; case 4
    b L_02019010 ; case 5
    b L_02019024 ; case 6
    b L_02019024 ; case 7
    b L_02019024 ; case 8
    b L_020190a8 ; case 9
    b L_020190b8 ; case 10
    b L_020190b8 ; case 11
    b L_020190b8 ; case 12
    b L_020190b8 ; case 13
    b L_020190c8 ; case 14
    b L_020190d8 ; case 15
L_02018f88:
    ldr r0, L_020190fc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    movne r1, #0x1
    b L_020190ec
L_02018fa4:
    ldr r0, L_02019100
    ldr r1, [r0, #0x0]
    b L_020190ec
L_02018fb0:
    ldr r0, L_020190fc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    ldrne r1, [r0, #0x1fc]
    b L_020190ec
L_02018fcc:
    ldr r0, L_020190fc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq L_020190ec
    bl func_0204aff4
    mov r1, r0
    b L_020190ec
L_02018ff0:
    ldr r0, L_020190fc
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    ldrne r0, [r0, #0x29c]
    ldrneh r1, [r0, #0x36]
    b L_020190ec
L_02019010:
    mov r0, r5
    bl func_0204c51c
    add r0, r0, r6, lsl #0x1
    ldrh r1, [r0, #0x56]
    b L_020190ec
L_02019024:
    mov r0, r5
    bl func_0204c51c
    cmp r6, #0x4
    mov r1, #0x0
    addls pc, pc, r6, lsl #0x2
    b L_02019074
L_0201903c: ; jump table
    b L_02019050 ; case 0
    b L_02019058 ; case 1
    b L_02019060 ; case 2
    b L_02019068 ; case 3
    b L_02019070 ; case 4
L_02019050:
    add r1, r0, #0x2
    b L_02019074
L_02019058:
    add r1, r0, #0x8
    b L_02019074
L_02019060:
    add r1, r0, #0xe
    b L_02019074
L_02019068:
    add r1, r0, #0x14
    b L_02019074
L_02019070:
    add r1, r0, #0x1a
L_02019074:
    cmp r7, #0x6
    beq L_02019090
    cmp r7, #0x7
    beq L_02019098
    cmp r7, #0x8
    moveq r8, #0x2
    b L_0201909c
L_02019090:
    mov r8, #0x0
    b L_0201909c
L_02019098:
    mov r8, #0x1
L_0201909c:
    mov r0, r8, lsl #0x1
    ldrh r1, [r1, r0]
    b L_020190ec
L_020190a8:
    mov r0, r5
    bl func_0204c51c
    ldr r1, [r0, #0x60]
    b L_020190ec
L_020190b8:
    mov r1, r5
    bl func_0204c59c
    mov r1, r0
    b L_020190ec
L_020190c8:
    mov r0, r5
    bl func_0204c51c
    ldr r1, [r0, #0x64]
    b L_020190ec
L_020190d8:
    ldr r0, [r4, #0x84]
    bl Actor_GetCollection
    mov r1, r5
    bl ActorCollection_FindActorByDescriptorValue
    ldr r1, [r0, #0x1fc]
L_020190ec:
    mov r0, r4
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_020190fc: .word data_021052fc
L_02019100: .word data_020e1964
.size func_02018f10, . - func_02018f10
