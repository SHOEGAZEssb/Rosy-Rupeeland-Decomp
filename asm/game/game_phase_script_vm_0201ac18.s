; Matching retail form; see src/game/game_phase_script_vm_sound_high_arity_opcodes.c.
.text
.extern func_02012704
.extern func_02059550
.extern gSoundContext
.global func_0201ac18
func_0201ac18: ; 0x0201ac18
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r9, r0
    bl func_02012704
    mov r8, r0
    mov r0, r9
    bl func_02012704
    mov r7, r0
    mov r0, r9
    bl func_02012704
    mov r6, r0
    mov r0, r9
    bl func_02012704
    mov r5, r0
    mov r0, r9
    bl func_02012704
    mov r4, r0
    mov r0, r9
    bl func_02012704
    cmp r0, #0x20
    bne L_0201ac8c
    ldr r0, L_0201ac98
    stmia sp, {r7, r8}
    mov r1, r4, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r2, r5
    mov r3, r6
    mov r1, r1, lsr #0x10
    bl func_02059550
L_0201ac8c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_0201ac98: .word gSoundContext
.size func_0201ac18, . - func_0201ac18
