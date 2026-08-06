; Matching retail form; see src/game/overlay_worker_presentation.c.
.text
.extern Heap_Free
.extern data_020d6304
.extern data_021055cc
.extern func_02006280
.extern func_020062f8
.extern func_0201e28c
.extern func_ov047_0220ba64

.global func_02020188
    .type func_02020188, @function
func_02020188: ; 0x02020188
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_020201f4
    mov r4, r0
    ldr r0, .L_020201f8
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    sub r1, r1, #0x1
    str r1, [r0, #0x0]
    ldr r5, [r4, #0xc]
    cmp r5, #0x0
    beq .L_020201c4
    mov r0, r5
    bl func_ov047_0220ba64
    mov r0, r5
    bl Heap_Free
.L_020201c4:
    ldr r0, .L_020201f8
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_020201dc
    add r0, r4, #0x10
    bl func_020062f8
.L_020201dc:
    add r0, r4, #0x10
    bl func_02006280
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_020201f4: .word data_020d6304
.L_020201f8: .word data_021055cc
    .size func_02020188, .-func_02020188
