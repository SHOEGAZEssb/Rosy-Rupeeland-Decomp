; Matching retail form; see src/game/game_phase_region_table_lifecycle.c.
.text
.extern data_020d5630
.extern func_02003e20
.extern func_02011518
.extern func_0201151c
.extern func_02011520
.extern func_020c09cc
.extern gHeapContext

    .global func_0201166c
func_0201166c: ; 0x0201166c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r2, [r5, #0x0]
    mov r4, r1
    cmp r2, #0x0
    beq L_0201168c
    bl func_02011520
L_0201168c:
    mov r0, r4, lsl #0x3
    ldr r1, L_020116d8
    ldr r3, L_020116dc
    add r0, r0, #0x8
    mov r2, #0x4
    bl func_02003e20
    cmp r0, #0x0
    beq L_020116cc
    ldr r1, L_020116e0
    mov r2, #0x8
    ldr ip, L_020116e4
    str r1, [sp, #0x0]
    mov r1, r4
    mov r3, r2
    str ip, [sp, #0x4]
    bl func_020c09cc
L_020116cc:
    stmia r5, {r0, r4}
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
L_020116d8: .word data_020d5630
L_020116dc: .word gHeapContext
L_020116e0: .word func_02011518
L_020116e4: .word func_0201151c
    .size func_0201166c, . - func_0201166c

