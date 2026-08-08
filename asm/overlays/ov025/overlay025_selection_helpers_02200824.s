.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern func_02091b98
.extern func_02091c7c
.extern func_ov025_0220088c
.extern GameWork_SetFlag
.extern gGameWork


    .global func_ov025_02200824
func_ov025_02200824:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x1c4
    mov r4, r1
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, r5, #0x5e0
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_02200878
    ldr r0, L_02200884
    ldr r1, L_02200888
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r1, r4
    add r0, r5, #0x5e0
    bl func_02091b98
L_02200878:
    mov r0, r5
    bl func_ov025_0220088c
    ldmia sp!, {r3, r4, r5, pc}
L_02200884: .word gGameWork
L_02200888: .word 0x3d3
.size func_ov025_02200824, .-func_ov025_02200824

