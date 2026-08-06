; Matching retail form; see src/game/four_slot_3d_presentation.c.
.text
.extern Heap_Free
.extern __destroy_arr
.extern func_0201e28c
.extern func_02020d9c

    .global func_020246a0
    .type func_020246a0, @function
func_020246a0: ; 0x020246a0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, .L_020246d4
    add r0, r4, #0x1c
    mov r1, #0x4
    mov r2, #0x1c
    bl __destroy_arr
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020246d4: .word func_02020d9c
    .size func_020246a0, . - func_020246a0
