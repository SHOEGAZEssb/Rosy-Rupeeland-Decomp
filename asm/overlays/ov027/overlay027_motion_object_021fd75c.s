.text

/* Exact fallback; see src/overlays/ov027/overlay027_motion_object.c. */
.extern func_020948e4
.extern func_020948f8
.extern func_02094dd4
.extern func_ov027_021fd3d8
.extern func_ov027_021fd3f0


    .global func_ov027_021fd75c
func_ov027_021fd75c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xb0]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_021fd824
L_021fd774: ; jump table
    b L_021fd784 ; case 0
    b L_021fd798 ; case 1
    b L_021fd804 ; case 2
    b L_021fd81c ; case 3
L_021fd784:
    ldr r1, [r4, #0xa8]
    bl func_ov027_021fd3d8
    ldr r0, [r4, #0xb0]
    add r0, r0, #0x1
    str r0, [r4, #0xb0]
L_021fd798:
    mov r0, r4
    bl func_ov027_021fd3f0
    cmp r0, #0x0
    beq L_021fd824
    add r0, r4, #0x6c
    mov r1, #0x3
    mov r2, #0x10000
    bl func_020948e4
    ldr r2, [r4, #0x9c]
    add r0, r4, #0xc
    mov r1, #0x5
    bl func_020948f8
    ldr r2, [r4, #0xa0]
    add r0, r4, #0x1c
    mov r1, #0x5
    bl func_020948f8
    ldr r2, [r4, #0xa4]
    add r0, r4, #0x2c
    mov r1, #0x1
    bl func_020948f8
    ldr r1, [r4, #0xac]
    mov r0, r4
    bl func_ov027_021fd3d8
    ldr r0, [r4, #0xb0]
    add r0, r0, #0x1
    str r0, [r4, #0xb0]
    b L_021fd824
L_021fd804:
    bl func_ov027_021fd3f0
    cmp r0, #0x0
    ldrne r0, [r4, #0xb0]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb0]
    b L_021fd824
L_021fd81c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fd824:
    mov r0, r4
    bl func_02094dd4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov027_021fd75c, .-func_ov027_021fd75c

