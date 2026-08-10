; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text
.extern data_021052fc
.extern data_02105310
.extern func_02007f0c
.extern func_0200b04c
.extern func_02012704
.extern func_02030ad4
.extern Actor_SetActive
.extern func_020337d4

    .global func_02012afc
func_02012afc: ; 0x02012afc
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    mov r4, r0
    mov r0, r6
    bl func_02012704
    mov r5, r0
    ldr r0, [r6, #0x84]
    bl func_020337d4
    mov r1, r5
    bl func_02030ad4
    mov r5, r0
    ldrb r1, [r5, #0x4d]
    cmp r1, #0x1
    bne L_02012b74
    ldr r0, L_02012c0c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r5, [r0, #0xe7c]
    mov r1, r4
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
    mov r0, r5
    mov r1, #0x1
    bl Actor_SetActive
    b L_02012c04
L_02012b74:
    ldr r1, [r6, #0x84]
    cmp r5, r1
    bne L_02012b94
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x70]
    blx r2
    b L_02012c04
L_02012b94:
    cmp r4, #0x0
    beq L_02012be8
    ldr r0, L_02012c10
    bl func_0200b04c
    cmp r0, #0x0
    beq L_02012bd4
    ldr r0, L_02012c10
    ldr r0, [r0, #0x4]
    cmp r0, r5
    bne L_02012bd4
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x70]
    blx r2
    b L_02012be8
L_02012bd4:
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x74]
    blx r2
L_02012be8:
    ldr r0, L_02012c10
    bl func_0200b04c
    cmp r0, #0x0
    beq L_02012c04
    mov r0, r5
    mov r1, #0x1
    bl Actor_SetActive
L_02012c04:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_02012c0c: .word data_021052fc
L_02012c10: .word data_02105310
    .size func_02012afc, . - func_02012afc
