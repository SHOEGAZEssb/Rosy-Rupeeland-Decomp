; Matching retail form; see src/game/game_phase_script_vm_actor_runtime_display_opcodes.c.
.text
.extern data_020f4dc8
.extern DisplayBrightness_StartTransition
.extern DisplayBrightnessPair_GetScreen
.extern func_02012704
.global func_0201856c
func_0201856c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl func_02012704
    mov r4, r0
    mov r0, r7
    bl func_02012704
    mov r5, r0
    mov r0, r7
    bl func_02012704
    mov r6, r0
    mov r0, r7
    bl func_02012704
    mov r7, r0
    tst r7, #0x1
    beq L_020185c4
    ldr r0, L_020185f0
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl DisplayBrightness_StartTransition
L_020185c4:
    tst r7, #0x2
    beq L_020185e8
    ldr r0, L_020185f0
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl DisplayBrightness_StartTransition
L_020185e8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_020185f0: .word data_020f4dc8
.size func_0201856c, . - func_0201856c
