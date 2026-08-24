; Matching retail form; see src/game/game_phase_script_vm_packed_runtime_update_opcode.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseScriptVm_Pop
.extern DualLayerTileRenderer_SetPackedTileValue
.global func_02016c7c
func_02016c7c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #8
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    ldr r0, L_02016d5c
    mov r1, r7
    ldr r0, [r0]
    mov r2, r6
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r3, [r0]
    ldr r3, [r3, #0x2c]
    blx r3
    str r0, [sp]
    str r0, [sp, #4]
    cmp r4, #0
    beq L_02016d08
    cmp r4, #1
    beq L_02016d1c
    cmp r4, #2
    biceq r1, r0, #0x3c00
    moveq r0, r5, lsl #28
    orreq r0, r1, r0, lsr #18
    streq r0, [sp, #4]
    b L_02016d2c
L_02016d08:
    bic r1, r0, #0x1f
    and r0, r5, #0x1f
    orr r0, r1, r0
    str r0, [sp, #4]
    b L_02016d2c
L_02016d1c:
    bic r1, r0, #0x3e0
    mov r0, r5, lsl #27
    orr r0, r1, r0, lsr #22
    str r0, [sp, #4]
L_02016d2c:
    ldr r0, L_02016d5c
    add r1, sp, #4
    ldr r0, [r0]
    ldr r3, [r1]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r1, r7
    mov r2, r6
    bl DualLayerTileRenderer_SetPackedTileValue
    mov r0, #0
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_02016d5c: .word gGamePhaseRuntime
    .size func_02016c7c, . - func_02016c7c
