; Matching retail form; see src/game/game_phase_script_vm_actor_bit_query_opcodes.c.
.text
.extern OS_Halt
.extern data_021052fc
.extern func_02007f0c
.extern func_02012704
.extern func_020127f8
.extern func_02030ad4
.extern func_020337d4

    .global func_02013b74
func_02013b74: ; 0x02013b74
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    ldr r1, L_02013c78
    mov r4, r0
    ldr r1, [r1, #0x0]
    add r0, r1, #0x2000
    ldr r0, [r0, #0xfb8]
    ldr r1, [r1, #0x24]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xeac]
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    cmp r1, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r6, #0x84]
    bl func_020337d4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x1
    bne L_02013bec
    ldr r0, L_02013c78
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r1, r4
    bl func_02030ad4
    mov r5, r0
    b L_02013c28
L_02013bec:
    ldr r0, [r6, #0x84]
    bl func_020337d4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #0x2
    bne L_02013c24
    ldr r0, L_02013c78
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r1, r4
    bl func_02030ad4
    mov r5, r0
    b L_02013c28
L_02013c24:
    bl OS_Halt
L_02013c28:
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    bne L_02013c60
    ldr r0, L_02013c78
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    mov r0, r6
    ldrb r1, [r1, #0x169]
    and r1, r1, #0x1
    bl func_020127f8
    b L_02013c70
L_02013c60:
    ldrb r1, [r5, #0x169]
    mov r0, r6
    and r1, r1, #0x1
    bl func_020127f8
L_02013c70:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02013c78: .word data_021052fc
    .size func_02013b74, . - func_02013b74

