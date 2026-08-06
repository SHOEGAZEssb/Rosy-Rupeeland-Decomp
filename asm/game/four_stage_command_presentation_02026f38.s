; Matching retail form; see src/game/four_stage_command_presentation.c.
.text
.extern data_020d6bf8
.extern func_0201e250

    .global func_02026f38
    .type func_02026f38, @function
func_02026f38: ; 0x02026f38
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r4, r1
    mov r7, r2
    mov r6, r3
    bl func_0201e250
    ldr r0, .L_02026f88
    ldr r1, [sp, #0x18]
    str r0, [r5, #0x0]
    str r7, [r5, #0x8]
    str r6, [r5, #0xc]
    ldr r0, [sp, #0x1c]
    str r1, [r5, #0x10]
    str r0, [r5, #0x14]
    mov r0, #0x0
    str r0, [r5, #0x18]
    str r0, [r5, #0x1c]
    mov r0, r5
    str r4, [r5, #0x20]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02026f88: .word data_020d6bf8
    .size func_02026f38, . - func_02026f38
