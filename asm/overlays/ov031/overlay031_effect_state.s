.text

/* Exact fallback; see src/overlays/ov031/overlay031_effect_runtime.c for documented portable C. */
.extern data_ov031_021fe604
.extern data_ov031_021fe66c
.extern func_02094cf0
.extern func_ov031_021fd69c
.extern func_ov031_021fd798


    .global func_ov031_021fd7fc
func_ov031_021fd7fc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov031_021fd798
    ldr r0, [r4, #0x68]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_021fd90c
L_021fd818: ; jump table
    b L_021fd82c ; case 0
    b L_021fd84c ; case 1
    b L_021fd89c ; case 2
    b L_021fd8e0 ; case 3
    b L_021fd904 ; case 4
L_021fd82c:
    ldr r1, [r4, #0x70]
    mov r0, #0x1e
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x68]
    add r0, r0, #0x1
    str r0, [r4, #0x68]
L_021fd84c:
    ldr r0, [r4, #0x70]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq L_021fd90c
    ldr r0, [r4, #0x6c]
    mov r2, #0x0
    cmp r0, #0x0
    ldr r0, [r4, #0x70]
    bne L_021fd884
    ldr r1, L_021fd914
    bl func_02094cf0
    b L_021fd88c
L_021fd884:
    ldr r1, L_021fd918
    bl func_02094cf0
L_021fd88c:
    ldr r0, [r4, #0x68]
    add r0, r0, #0x1
    str r0, [r4, #0x68]
    b L_021fd90c
L_021fd89c:
    mov r0, r4
    bl func_ov031_021fd69c
    ldr r0, [r4, #0x70]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq L_021fd90c
    ldr r1, [r4, #0x70]
    mov r0, #0x3c
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0x68]
    add r0, r0, #0x1
    str r0, [r4, #0x68]
    b L_021fd90c
L_021fd8e0:
    ldr r0, [r4, #0x70]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    ldrne r0, [r4, #0x68]
    addne r0, r0, #0x1
    strne r0, [r4, #0x68]
    b L_021fd90c
L_021fd904:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fd90c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fd914: .word data_ov031_021fe604
L_021fd918: .word data_ov031_021fe66c
.size func_ov031_021fd7fc, .-func_ov031_021fd7fc
