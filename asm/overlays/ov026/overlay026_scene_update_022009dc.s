.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_update.c. */
.extern func_020773a8
.extern func_0209189c
.extern func_020918f4
.extern func_020948e4
.extern func_02095360
.extern func_ov026_021fe5c0
.extern func_ov026_0220046c
.extern func_ov026_02200d08
.extern func_ov026_02200e0c
.extern func_ov026_02200ff4
.extern func_ov026_0220112c
.extern func_ov026_02201284


    .global func_ov026_022009dc
func_ov026_022009dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x1
    beq L_02200a40
    tst r0, #0x400
    bne L_02200a40
    add r0, r4, #0x3a4
    add r0, r0, #0x400
    mov r1, #0x4
    bl func_020918f4
    cmp r0, #0x0
    bne L_02200a40
    ldr r1, [r4, #0x160]
    add r0, r4, #0x3a4
    ldr r1, [r1, #0x13c]
    add r0, r0, #0x400
    bl func_020918f4
    ldr r1, [r4, #0x160]
    mov r2, r0
    ldr r1, [r1, #0x20]
    mov r0, r4
    sub r1, r1, r2, lsl #0xa
    bl func_ov026_02200e0c
L_02200a40:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x2
    beq L_02200a58
    mov r0, r4
    bl func_ov026_02200ff4
L_02200a58:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x4000
    beq L_02200a70
    mov r0, r4
    bl func_ov026_0220112c
L_02200a70:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x10000
    beq L_02200a8c
    ldr r1, L_02200cf4
    mov r0, r4
    bl func_ov026_02201284
L_02200a8c:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x20000
    beq L_02200aa8
    ldr r1, L_02200cf8
    mov r0, r4
    bl func_ov026_02201284
L_02200aa8:
    add r0, r4, #0x2f4
    bl func_02095360
    add r0, r4, #0x304
    bl func_02095360
    add r0, r4, #0x314
    bl func_02095360
    ldr r0, [r4, #0x6c]
    bl func_020773a8
    ldr r0, [r4, #0x70]
    bl func_020773a8
    ldr r0, [r4, #0x74]
    bl func_020773a8
    ldr r0, [r4, #0x78]
    bl func_020773a8
    ldr r0, [r4, #0x2f0]
    bl func_ov026_02200d08
    cmp r0, #0x0
    beq L_02200bf0
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x1
    beq L_02200b9c
    ldr r2, [r4, #0x36c]
    add r0, r4, #0x3a4
    add r0, r0, #0x400
    rsb r1, r2, #0x0
    bl func_0209189c
    ldr r1, [r4, #0x2f0]
    mov r2, r0
    add r0, r1, #0xc
    mov r1, #0x2
    bl func_020948e4
    ldr r2, [r4, #0x36c]
    add r0, r4, #0x3a4
    add r0, r0, #0x400
    rsb r1, r2, #0x0
    bl func_0209189c
    ldr r1, [r4, #0x2f0]
    mov r2, r0
    add r0, r1, #0x1c
    mov r1, #0x2
    bl func_020948e4
    ldr r2, [r4, #0x36c]
    add r0, r4, #0x3a4
    add r0, r0, #0x400
    rsb r1, r2, #0x0
    bl func_0209189c
    mov r2, r0
    ldr r0, [r4, #0x2f0]
    mov r1, #0x2
    add r0, r0, #0x2c
    bl func_020948e4
    add r0, r4, #0x3a4
    add r0, r0, #0x400
    mov r1, #0x1
    mov r2, #0x3
    bl func_0209189c
    mov r1, r0
    ldr r0, [r4, #0x2f0]
    bl func_ov026_021fe5c0
    b L_02200c00
L_02200b9c:
    ldr r0, [r4, #0x2f0]
    mov r1, #0x2
    add r0, r0, #0xc
    mov r2, #0x0
    bl func_020948e4
    ldr r0, [r4, #0x2f0]
    mov r1, #0x2
    add r0, r0, #0x1c
    mov r2, #0x0
    bl func_020948e4
    ldr r0, [r4, #0x2f0]
    mov r1, #0x2
    add r0, r0, #0x2c
    mov r2, #0x0
    bl func_020948e4
    ldr r1, [r4, #0x2f0]
    mov r0, #0x8
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    b L_02200c00
L_02200bf0:
    ldr r0, [r4, #0x2f0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_02200c00:
    ldr r0, [r4, #0x2e8]
    ldr r2, [r0, #0x30]
    ldr r1, [r0, #0x20]
    ldr r0, [r0, #0x10]
    str r0, [r4, #0x1c4]
    str r1, [r4, #0x1c8]
    str r2, [r4, #0x1cc]
    ldr r3, [r4, #0x2f0]
    ldr r2, [r4, #0x2ec]
    ldr r0, [r3, #0x10]
    ldr r1, [r2, #0x10]
    ldr lr, [r3, #0x30]
    ldr ip, [r2, #0x30]
    ldr r3, [r3, #0x20]
    ldr r2, [r2, #0x20]
    add r0, r1, r0
    str r0, [r4, #0x1d0]
    add r0, r2, r3
    str r0, [r4, #0x1d4]
    add r0, ip, lr
    str r0, [r4, #0x1d8]
    ldr r0, [r4, #0x54]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_02200ce8
L_02200c64: ; jump table
    b L_02200ce8 ; case 0
    b L_02200c90 ; case 1
    b L_02200c90 ; case 2
    b L_02200c90 ; case 3
    b L_02200c90 ; case 4
    b L_02200ca8 ; case 5
    b L_02200ca8 ; case 6
    b L_02200cc0 ; case 7
    b L_02200cc0 ; case 8
    b L_02200cd8 ; case 9
    b L_02200cd8 ; case 10
L_02200c90:
    ldr r2, [r4, #0x160]
    ldr r0, L_02200cfc
    ldr r1, [r2, #0x12c]
    and r0, r1, r0
    str r0, [r2, #0x12c]
    b L_02200ce8
L_02200ca8:
    ldr r2, [r4, #0x160]
    ldr r0, L_02200d00
    ldr r1, [r2, #0x12c]
    and r0, r1, r0
    str r0, [r2, #0x12c]
    b L_02200ce8
L_02200cc0:
    ldr r2, [r4, #0x160]
    ldr r0, L_02200d04
    ldr r1, [r2, #0x12c]
    and r0, r1, r0
    str r0, [r2, #0x12c]
    b L_02200ce8
L_02200cd8:
    ldr r1, [r4, #0x160]
    ldr r0, [r1, #0x12c]
    bic r0, r0, #0x5e
    str r0, [r1, #0x12c]
L_02200ce8:
    mov r0, r4
    bl func_ov026_0220046c
    ldmia sp!, {r4, pc}
L_02200cf4: .word 0x64cd
L_02200cf8: .word 0x3a66
L_02200cfc: .word 0xfffbfeff
L_02200d00: .word 0xfffbfef9
L_02200d04: .word 0xfffffef1
.size func_ov026_022009dc, .-func_ov026_022009dc

