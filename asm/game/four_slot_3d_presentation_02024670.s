; Matching retail form; see src/game/four_slot_3d_presentation.c.
.text
.extern __destroy_arr
.extern func_0201e28c
.extern func_02020d9c

    .global func_02024670
    .type func_02024670, @function
func_02024670: ; 0x02024670
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, .L_0202469c
    add r0, r4, #0x1c
    mov r1, #0x4
    mov r2, #0x1c
    bl __destroy_arr
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202469c: .word func_02020d9c
    .size func_02024670, . - func_02024670
