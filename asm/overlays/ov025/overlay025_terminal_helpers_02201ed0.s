.text

/* Exact fallback; see src/overlays/ov025/overlay025_terminal_helpers.c. */
.extern func_ov025_02200178
.extern gSoundContext
.extern OS_Halt
.extern Sound_Reset


    .global func_ov025_02201ed0
func_ov025_02201ed0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02201ef0
    cmp r0, #0x1
    beq L_02201f04
    b L_02201f14
L_02201ef0:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_02201f14
L_02201f04:
    ldr r0, L_02201f24
    ldr r0, [r0, #0x0]
    bl Sound_Reset
    bl OS_Halt
L_02201f14:
    mov r0, r4
    bl func_ov025_02200178
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02201f24: .word gSoundContext
.size func_ov025_02201ed0, .-func_ov025_02201ed0

