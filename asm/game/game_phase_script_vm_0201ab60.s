; Matching retail form; see src/game/game_phase_script_vm_sound_five_operand_opcode.c.
.text
.extern func_02012704
.extern func_020593ac
.extern func_0205943c
.extern gSoundContext
.global func_0201ab60
func_0201ab60: ; 0x0201ab60
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r8, r0
    bl func_02012704
    mov r5, r0
    mov r0, r8
    bl func_02012704
    mov r7, r0
    mov r0, r8
    bl func_02012704
    mov r4, r0
    mov r0, r8
    bl func_02012704
    mov r6, r0
    mov r0, r8
    bl func_02012704
    cmp r0, #0x1e
    beq L_0201abb4
    cmp r0, #0x1f
    beq L_0201abe0
    b L_0201ac08
L_0201abb4:
    str r7, [sp, #0x0]
    mov r0, r6, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, L_0201ac14
    str r5, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593ac
    b L_0201ac08
L_0201abe0:
    str r7, [sp, #0x0]
    mov r0, r6, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, L_0201ac14
    str r5, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_0205943c
L_0201ac08:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_0201ac14: .word gSoundContext
.size func_0201ab60, . - func_0201ab60
