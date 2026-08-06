; Matching retail form; see src/game/dual_screen_ui_indexed_icon_presentation.c.
.text
.extern Heap_Free
.extern data_020d6b20
.extern func_02005708
.extern func_02005cc8
.extern func_02025bdc

    .global func_02026308
    .type func_02026308, @function
func_02026308: ; 0x02026308
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0202634c
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0xd0]
    cmp r4, #0x0
    beq .L_02026334
    mov r0, r4
    bl func_02005708
    mov r0, r4
    bl Heap_Free
.L_02026334:
    add r0, r5, #0xc8
    bl func_02005cc8
    mov r0, r5
    bl func_02025bdc
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0202634c: .word data_020d6b20
    .size func_02026308, . - func_02026308
