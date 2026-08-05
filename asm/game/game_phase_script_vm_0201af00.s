; Matching retail form; see src/game/game_phase_script_vm_runtime_scene_mode_opcode.c.
.text
.extern func_02012704
.extern func_020088b8
.extern func_02007f0c
.extern func_0202d68c
.extern data_021052fc
.global func_0201af00
func_0201af00: ; 0x0201af00
    stmdb sp!, {r3, lr}
    bl func_02012704
    cmp r0, #0x0
    beq L_0201af28
    ldr r0, L_0201af84
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl func_020088b8
    b L_0201af7c
L_0201af28:
    ldr r0, L_0201af84
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl func_020088b8
    ldr r0, L_0201af84
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r1, #0x1
    bl func_0202d68c
    ldr r0, L_0201af84
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xebc]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
L_0201af7c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0201af84: .word data_021052fc
.size func_0201af00, . - func_0201af00
