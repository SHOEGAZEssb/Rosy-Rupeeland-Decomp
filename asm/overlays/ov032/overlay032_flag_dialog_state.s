.text

/* Exact fallback; see src/overlays/ov032/overlay032_flag_dialog_state.c for documented portable C. */
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern data_ov032_02202220
.extern func_ov032_021fe134
.extern func_ov032_021fe23c
.extern func_ov032_021fe2bc
.extern gGameWork

    .global func_ov032_0220040c
func_ov032_0220040c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xb64]
    cmp r1, #0x17
    addls pc, pc, r1, lsl #0x2
    b L_02200608
L_02200424: ; jump table
    b L_02200484 ; case 0
    b L_0220049c ; case 1
    b L_022004b4 ; case 2
    b L_02200608 ; case 3
    b L_02200608 ; case 4
    b L_02200608 ; case 5
    b L_02200608 ; case 6
    b L_02200608 ; case 7
    b L_02200608 ; case 8
    b L_02200608 ; case 9
    b L_02200500 ; case 10
    b L_02200518 ; case 11
    b L_02200530 ; case 12
    b L_0220054c ; case 13
    b L_02200608 ; case 14
    b L_02200608 ; case 15
    b L_02200608 ; case 16
    b L_02200608 ; case 17
    b L_02200608 ; case 18
    b L_02200608 ; case 19
    b L_0220058c ; case 20
    b L_022005a4 ; case 21
    b L_022005d0 ; case 22
    b L_022005ec ; case 23
L_02200484:
    mov r1, #0x1
    bl func_ov032_021fe23c
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200608
L_0220049c:
    mov r1, #0x11
    bl func_ov032_021fe2bc
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200608
L_022004b4:
    mov r1, #0x1
    bl func_ov032_021fe134
    cmp r0, #0x0
    beq L_02200608
    ldr r1, [r4, #0xb64]
    ldr r0, L_02200610
    add r1, r1, #0x1
    str r1, [r4, #0xb64]
    ldr r3, [r4, #0xf4]
    mov r1, #0xa
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r0, #0x78]
    ldr r0, [r0, #0x7c]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
    b L_02200608
L_02200500:
    mov r1, #0x1
    bl func_ov032_021fe23c
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200608
L_02200518:
    mov r1, #0x14
    bl func_ov032_021fe2bc
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200608
L_02200530:
    mov r1, #0x1
    bl func_ov032_021fe134
    cmp r0, #0x0
    ldrne r0, [r4, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb64]
    b L_02200608
L_0220054c:
    ldr r0, L_02200614
    mov r1, #0x3fc
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, L_02200614
    mov r1, #0x398
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_02200610
    mov r1, #0x0
    ldr r2, [r0, #0x70]
    ldr r0, [r0, #0x74]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
    b L_02200608
L_0220058c:
    mov r1, #0x1
    bl func_ov032_021fe23c
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200608
L_022005a4:
    ldr r0, L_02200614
    mov r1, #0x3fc
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r4
    mov r1, #0x17
    bl func_ov032_021fe2bc
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200608
L_022005d0:
    mov r1, #0x1
    bl func_ov032_021fe134
    cmp r0, #0x0
    ldrne r0, [r4, #0xb64]
    addne r0, r0, #0x1
    strne r0, [r4, #0xb64]
    b L_02200608
L_022005ec:
    ldr r0, L_02200610
    mov r1, #0x0
    ldr r2, [r0, #0x68]
    ldr r0, [r0, #0x6c]
    str r2, [r4, #0xb6c]
    str r0, [r4, #0xb70]
    str r1, [r4, #0xb64]
L_02200608:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200610: .word data_ov032_02202220
L_02200614: .word gGameWork
.size func_ov032_0220040c, .-func_ov032_0220040c

