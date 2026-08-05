; Matching retail form; see src/game/game_phase_script_vm_runtime_scene_prepare_opcode.c.
.text
.extern data_021052fc
.extern func_02008b50
.extern func_02008bb8
.extern func_0200eb0c
.extern func_020122a0
.extern func_02026174
.global func_0201a090
func_0201a090:
    stmdb sp!, {r4, lr}
    ldr r0, L_0201a12c
    ldr r1, [r0, #0x0]
    add r0, r1, #0x3000
    ldr r4, [r0, #0xe8]
    add r0, r1, #0x24
    bl func_0200eb0c
    mov r1, r0
    mov r0, r4
    bl func_02026174
    ldr r0, L_0201a12c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x1f
    add r0, r0, #0x3000
    ldr r0, [r0, #0xe8]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xc]
    blx r3
    ldr r0, L_0201a12c
    ldr r0, [r0, #0x0]
    bl func_02008b50
    ldr r0, L_0201a12c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200eb0c
    mov r1, r0
    ldr r0, L_0201a12c
    mov r2, #0x1
    ldr r0, [r0, #0x0]
    bl func_02008bb8
    ldr r0, L_0201a12c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl func_020122a0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201a12c: .word data_021052fc
.size func_0201a090, . - func_0201a090
