; Matching retail form; see src/game/game_phase_script_vm_actor_bit_query_opcodes.c.
.text
.extern data_021052fc
.extern func_02007f0c
.extern func_02012704
.extern func_020127f8
.extern ActorCollection_FindActorByDescriptorValue
.extern func_020337d4

    .global func_02013ac8
func_02013ac8: ; 0x02013ac8
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_02012704
    movs r5, r0
    ldr r0, [r4, #0x84]
    bne L_02013b4c
    bl func_020337d4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x1
    bne L_02013b20
    ldr r0, L_02013b70
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    mov r0, r4
    ldrb r1, [r1, #0x169]
    and r1, r1, #0x1
    bl func_020127f8
    b L_02013b68
L_02013b20:
    ldr r1, L_02013b70
    mov r0, r4
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xfb8]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xebc]
    ldrb r1, [r1, #0x169]
    and r1, r1, #0x1
    bl func_020127f8
    b L_02013b68
L_02013b4c:
    bl func_020337d4
    mov r1, r5
    bl ActorCollection_FindActorByDescriptorValue
    ldrb r1, [r0, #0x169]
    mov r0, r4
    and r1, r1, #0x1
    bl func_020127f8
L_02013b68:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02013b70: .word data_021052fc
    .size func_02013ac8, . - func_02013ac8

