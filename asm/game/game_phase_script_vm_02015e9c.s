; Matching retail form; see src/game/game_phase_script_vm_actor_activation_opcodes.c.
.text
.extern func_02012704
.extern func_02030ad4
.extern func_02032cac
.extern func_020337d4
.global func_02015e9c
func_02015e9c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    mov r5, r0
    mov r0, r6
    bl func_02012704
    mov r4, r0
    ldr r0, [r6, #0x84]
    bl func_020337d4
    mov r1, r4
    bl func_02030ad4
    movs r4, r0
    beq L_02015f08
    cmp r5, #0
    beq L_02015ee4
    mov r1, #1
    bl func_02032cac
    b L_02015f08
L_02015ee4:
    mov r1, #0
    bl func_02032cac
    ldrb r0, [r4, #0x4d]
    cmp r0, #1
    moveq r0, #1
    movne r0, #0
    cmp r0, #0
    movne r0, #0
    strneh r0, [r4, #0xd6]
L_02015f08:
    mov r0, #0
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02015e9c, . - func_02015e9c
