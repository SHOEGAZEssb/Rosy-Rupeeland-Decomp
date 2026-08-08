.text

/* Exact fallback; see src/overlays/ov027/overlay027_scene_helpers.c. */
.extern func_02059278
.extern func_0205929c
.extern func_02091b98
.extern func_02091c7c
.extern func_ov027_021fe1c8
.extern func_ov027_021fe47c
.extern func_ov027_021fe4a8
.extern func_ov027_021fe4d4
.extern gSoundContext


    .global func_ov027_021fe5c4
func_ov027_021fe5c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b L_021fe7dc
L_021fe5dc: ; jump table
    b L_021fe5fc ; case 0
    b L_021fe624 ; case 1
    b L_021fe658 ; case 2
    b L_021fe68c ; case 3
    b L_021fe6f4 ; case 4
    b L_021fe724 ; case 5
    b L_021fe78c ; case 6
    b L_021fe7d0 ; case 7
L_021fe5fc:
    ldr r0, L_021fe7ec
    mov r1, #0xfe
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fe624:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x78
    ble L_021fe7dc
    mov r0, r4
    bl func_ov027_021fe47c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe7dc
L_021fe658:
    bl func_ov027_021fe4a8
    cmp r0, #0x0
    beq L_021fe7dc
    add r0, r4, #0x1c4
    add r0, r0, #0x400
    mov r1, #0x78
    bl func_02091b98
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe7dc
L_021fe68c:
    add r0, r4, #0x1c4
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe7dc
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x3
    add r0, r4, #0x1c4
    add r0, r0, #0x400
    ble L_021fe6e0
    mov r1, #0xf0
    bl func_02091b98
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe7dc
L_021fe6e0:
    mov r1, #0x3c
    bl func_02091b98
    mov r0, r4
    bl func_ov027_021fe4d4
    b L_021fe7dc
L_021fe6f4:
    add r0, r4, #0x1c4
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe7dc
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe7dc
L_021fe724:
    add r0, r4, #0x1c4
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe7dc
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x32
    add r0, r4, #0x1c4
    add r0, r0, #0x400
    ble L_021fe778
    mov r1, #0xb4
    bl func_02091b98
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe7dc
L_021fe778:
    mov r1, #0x8
    bl func_02091b98
    mov r0, r4
    bl func_ov027_021fe4d4
    b L_021fe7dc
L_021fe78c:
    add r0, r4, #0x1c4
    add r0, r0, #0x400
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fe7dc
    ldr r0, L_021fe7ec
    mov r1, #0xfe
    ldr r0, [r0, #0x0]
    mov r2, #0x1e
    bl func_0205929c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe7dc
L_021fe7d0:
    bl func_ov027_021fe1c8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fe7dc:
    mov r0, r4
    bl func_ov027_021fe1c8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe7ec: .word gSoundContext
.size func_ov027_021fe5c4, .-func_ov027_021fe5c4

