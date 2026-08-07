.text

/* Exact fallback; see src/overlays/ov022/overlay022_ui_runtime.c. */
.extern func_02095940
.extern func_02095988
.extern GameWork_TestFlag
.extern gGameWork


    .global func_ov022_021fef48
func_ov022_021fef48:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x2b4]
    cmp r0, #0x0
    add r0, r4, #0x154
    beq L_021fef6c
    mov r1, #0x0
    bl func_02095988
    b L_021fef74
L_021fef6c:
    mov r1, #0x1
    bl func_02095988
L_021fef74:
    ldr r0, L_021fefd8
    ldr r1, L_021fefdc
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fefcc
    ldr r0, [r4, #0x2b0]
    cmp r0, #0x0
    beq L_021fefa4
    add r0, r4, #0x200
    bl func_02095940
    ldmia sp!, {r4, pc}
L_021fefa4:
    ldr r0, [r4, #0x2b8]
    cmp r0, #0x0
    add r0, r4, #0x200
    beq L_021fefc0
    mov r1, #0x2
    bl func_02095988
    ldmia sp!, {r4, pc}
L_021fefc0:
    mov r1, #0x3
    bl func_02095988
    ldmia sp!, {r4, pc}
L_021fefcc:
    add r0, r4, #0x200
    bl func_02095940
    ldmia sp!, {r4, pc}
L_021fefd8: .word gGameWork
L_021fefdc: .word 0x3cb
.size func_ov022_021fef48, .-func_ov022_021fef48

