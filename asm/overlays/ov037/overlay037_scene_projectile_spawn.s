.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_projectile_spawn.c for documented portable C. */

    .extern Heap_Alloc
    .extern func_0209189c
    .extern func_ov037_021fd554
    .extern func_020918f4
    .extern func_02094bf0
    .extern func_020948d4
    .extern func_02094bbc
    .extern func_020948e4
    .extern func_ov037_021fdf50
    .extern func_02095274
    .extern data_ov037_021feec0
    .extern gHeapContext
    .extern data_020c9670

    .global func_ov037_021fdf68
func_ov037_021fdf68:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, L_021fe1bc
    mov r7, r0
    ldr r3, L_021fe1c0
    mov r0, #0xc8
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq L_021fdfb4
    mov r1, #0x800
    add r0, r7, #0xbc
    rsb r1, r1, #0x0
    mov r2, #0x800
    bl func_0209189c
    mov r2, r0
    ldr r1, [r7, #0x110]
    mov r0, r4
    bl func_ov037_021fd554
    mov r4, r0
L_021fdfb4:
    add r0, r7, #0xbc
    mov r1, #0x740
    mov r2, #0x8c0
    bl func_0209189c
    mov r5, r0, lsl #0x4
    add r0, r7, #0xbc
    mov r1, #0x1000
    bl func_020918f4
    mov r2, r0, lsl #0x4
    mov r0, r4
    mov r1, #0x0
    rsb r3, r5, #0x0
    bl func_02094bf0
    add r0, r7, #0xbc
    mov r1, #0x1c
    bl func_020918f4
    cmp r0, #0x1b
    addls pc, pc, r0, lsl #0x2
    b L_021fe0c0
L_021fe000: ; jump table
    b L_021fe0b8 ; case 0
    b L_021fe0ac ; case 1
    b L_021fe0ac ; case 2
    b L_021fe0a0 ; case 3
    b L_021fe0a0 ; case 4
    b L_021fe0a0 ; case 5
    b L_021fe094 ; case 6
    b L_021fe094 ; case 7
    b L_021fe094 ; case 8
    b L_021fe094 ; case 9
    b L_021fe088 ; case 10
    b L_021fe088 ; case 11
    b L_021fe088 ; case 12
    b L_021fe088 ; case 13
    b L_021fe088 ; case 14
    b L_021fe07c ; case 15
    b L_021fe07c ; case 16
    b L_021fe07c ; case 17
    b L_021fe07c ; case 18
    b L_021fe07c ; case 19
    b L_021fe07c ; case 20
    b L_021fe070 ; case 21
    b L_021fe070 ; case 22
    b L_021fe070 ; case 23
    b L_021fe070 ; case 24
    b L_021fe070 ; case 25
    b L_021fe070 ; case 26
    b L_021fe070 ; case 27
L_021fe070:
    ldr r6, L_021fe1c4
    mov r8, #0xcd
    b L_021fe0c0
L_021fe07c:
    ldr r6, L_021fe1c8
    mov r8, #0xf6
    b L_021fe0c0
L_021fe088:
    ldr r6, L_021fe1cc
    ldr r8, L_021fe1d0
    b L_021fe0c0
L_021fe094:
    ldr r6, L_021fe1d4
    mov r8, #0x148
    b L_021fe0c0
L_021fe0a0:
    ldr r6, L_021fe1d8
    ldr r8, L_021fe1dc
    b L_021fe0c0
L_021fe0ac:
    ldr r6, L_021fe1e0
    sub r8, r6, #0x63
    b L_021fe0c0
L_021fe0b8:
    ldr r6, L_021fe1e4
    ldr r8, L_021fe1e8
L_021fe0c0:
    strh r6, [r4, #0xbc]
    mov r1, r8
    strh r6, [r4, #0xc0]
    mov r2, #0x1
    add r0, r4, #0x6c
    str r2, [r4, #0xa4]
    bl func_020948d4
    mov r0, r5, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    mov r1, #0xc00
    rsb r1, r1, #0x0
    ldr r3, L_021fe1ec
    mov r0, r0, lsl #0x1
    mov r5, r2, lsl #0x1
    ldrsh r6, [r3, r0]
    add r0, r7, #0xbc
    add r2, r1, #0xa00
    ldrsh r5, [r3, r5]
    bl func_0209189c
    mov r1, #0x180
    mov r3, r0
    mov r0, r4
    smulbb r2, r5, r1
    smulbb ip, r6, r1
    mov r1, r2, asr #0x7
    add r1, r2, r1, lsr #0x18
    mov r1, r1, asr #0x8
    mov r2, ip, asr #0x7
    add r2, ip, r2, lsr #0x18
    mov r2, r2, asr #0x8
    add r2, r2, #0x3000
    bl func_02094bbc
    add r0, r4, #0xc
    mov r1, #0x1
    mov r2, #0x380
    smulbb r3, r5, r2
    mov r2, r3, asr #0x7
    add r2, r3, r2, lsr #0x18
    mov r2, r2, asr #0x8
    bl func_020948e4
    add r0, r4, #0x1c
    mov r1, #0x1
    mov r2, #0x380
    smulbb r3, r6, r2
    mov r2, r3, asr #0x7
    add r2, r3, r2, lsr #0x18
    mov r2, r2, asr #0x8
    add r2, r2, #0x3000
    bl func_020948e4
    add r0, r7, #0xbc
    mov r1, #0x5a
    mov r2, #0x78
    bl func_0209189c
    mov r1, r0
    mov r0, r4
    bl func_ov037_021fdf50
    add r0, r7, #0x13c
    mov r1, #0x1
    str r1, [r4, #0x88]
    mov r1, r4
    bl func_02095274
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fe1bc: .word data_ov037_021feec0
L_021fe1c0: .word gHeapContext
L_021fe1c4: .word 0x74c
L_021fe1c8: .word 0x6b21
L_021fe1cc: .word 0x757
L_021fe1d0: .word 0x11f
L_021fe1d4: .word 0x1859
L_021fe1d8: .word 0x4c59
L_021fe1dc: .word 0x171
L_021fe1e0: .word 0x1fd
L_021fe1e4: .word 0x4e73
L_021fe1e8: .word 0x1c3
L_021fe1ec: .word data_020c9670
    .size func_ov037_021fdf68, .-func_ov037_021fdf68
