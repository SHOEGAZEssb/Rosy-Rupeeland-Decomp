.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_effect_object_lifecycle.c. */
.extern Heap_Free
.extern __destroy_arr
.extern data_ov041_022059b8
.extern func_02005058
.extern func_02099fb0
.extern func_ov041_021fce00

    .global func_ov041_022012f4
func_ov041_022012f4: ; 0x022012f4
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02201358
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x958]
    cmp r4, #0x0
    beq .L_02201334
    ldr r3, .L_0220135c
    add r0, r4, #0x13c
    mov r1, #0x3c
    mov r2, #0x10
    bl __destroy_arr
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    bl Heap_Free
.L_02201334:
    ldr r3, .L_02201360
    add r0, r5, #0x68
    mov r1, #0x5b
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r5
    bl func_02099fb0
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02201358: .word data_ov041_022059b8
.L_0220135c: .word func_02005058
.L_02201360: .word func_ov041_021fce00
    .size func_ov041_022012f4, . - func_ov041_022012f4

