.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_widget.c. */
.extern func_02072b68
.extern func_020befec


    .global func_ov025_021fdb18
func_ov025_021fdb18:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x88]
    ldr r0, [r4, #0xc]
    add r1, r1, #0x58
    str r1, [r0, #0x18]
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    beq L_021fdc3c
    ldr r0, [r4, #0x80]
    cmp r0, #0x0
    ldr r0, [r4, #0x10]
    beq L_021fdb5c
    mov r1, #0x3
    bl func_02072b68
    b L_021fdb64
L_021fdb5c:
    mov r1, #0x2f
    bl func_02072b68
L_021fdb64:
    ldr r0, [r4, #0x7c]
    cmp r0, #0xa
    bge L_021fdbc4
    ldr r5, [r4, #0x14]
    cmp r5, #0x0
    beq L_021fdb98
    ldrb r0, [r5, #0x38]
    mov r1, #0xa
    bl func_020befec
    add r1, r1, #0x14
    mov r0, r5
    and r1, r1, #0xff
    bl func_02072b68
L_021fdb98:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq L_021fdbac
    mov r1, #0x31
    bl func_02072b68
L_021fdbac:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq L_021fdc20
    mov r1, #0x14
    bl func_02072b68
    b L_021fdc20
L_021fdbc4:
    mov r7, #0x0
    mov r5, #0xa
    mov r6, #0x1f
L_021fdbd0:
    add r0, r4, r7, lsl #0x2
    ldr r8, [r0, #0x14]
    cmp r8, #0x0
    beq L_021fdc14
    cmp r7, #0x2
    bne L_021fdbf8
    mov r0, r8
    mov r1, r6
    bl func_02072b68
    b L_021fdc14
L_021fdbf8:
    ldrb r0, [r8, #0x38]
    mov r1, r5
    bl func_020befec
    add r1, r1, #0x14
    mov r0, r8
    and r1, r1, #0xff
    bl func_02072b68
L_021fdc14:
    add r7, r7, #0x1
    cmp r7, #0x6
    blt L_021fdbd0
L_021fdc20:
    ldr r1, [r4, #0x78]
    ldr r0, [r4, #0x2c]
    mov r1, r1, lsl #0x1
    add r1, r1, #0x5
    and r1, r1, #0xff
    bl func_02072b68
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fdc3c:
    ldr r0, [r4, #0x10]
    mov r1, #0x1
    bl func_02072b68
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov025_021fdb18, .-func_ov025_021fdb18

