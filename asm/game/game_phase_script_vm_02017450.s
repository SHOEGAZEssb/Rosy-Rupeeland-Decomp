; Matching retail form; see src/game/game_phase_script_vm_debug_hud_content_opcodes.c.
.text
.extern OS_Halt
.extern func_0200f6f4
.extern func_0200f73c
.extern func_0200f824
.extern func_02012704
.extern func_020337d4
.global func_02017450
func_02017450:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl func_02012704
    mov r4, r0
    mov r0, r7
    bl func_02012704
    mov r5, r0
    ldr r0, [r7, #0x84]
    bl func_020337d4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe84]
    cmp r0, #1
    beq L_02017490
    cmp r0, #2
    beq L_020174a8
    b L_020174c0
L_02017490:
    bl func_0200f824
    mov r2, r4
    mov r1, #0
    bl func_0200f73c
    mov r6, r0
    b L_020174c4
L_020174a8:
    bl func_0200f824
    mov r2, r4
    mov r1, #1
    bl func_0200f73c
    mov r6, r0
    b L_020174c4
L_020174c0:
    bl OS_Halt
L_020174c4:
    bl func_0200f824
    mov r1, r5
    mov r2, r6
    bl func_0200f6f4
    mov r0, #0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_02017450, . - func_02017450
