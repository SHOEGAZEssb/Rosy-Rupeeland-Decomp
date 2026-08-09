.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern data_021052fc
.extern func_02005058
.extern func_02007f0c
.extern func_02008148
.extern func_0200875c
.extern func_02008b50
.extern func_02009d78
.extern func_02010e68
.extern func_0201dcec
.extern func_0202eb18
.extern func_02030acc
.extern func_0203ad64
.extern func_020740a4
.extern gLupyContext

.global func_ov064_02210ae8
func_ov064_02210ae8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x70]
    tst r0, #0x1
    add r0, r5, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r5, #0x6c]
    ldrne r1, [r2, r1]
    ldreq r1, [r5, #0x6c]
    blx r1
    ldrb r1, [r5, #0x77]
    mov r4, r0
    cmp r1, #0x3
    beq .L_02210c10
    ldr r0, .L_02210c54
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02008148
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02008148
    bl func_0203ad64
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    ldr r1, .L_02210c54
    mov r6, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    mov r1, r0
    mov r0, r6
    bl func_0202eb18
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    bl func_02030acc
    bl func_020740a4
    ldr r1, .L_02210c54
    add r0, sp, #0x0
    ldr r1, [r1, #0x0]
    bl func_0200875c
    ldr r0, .L_02210c54
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r1, sp, #0x0
    bl func_0202eb18
    add r0, sp, #0x0
    bl func_02005058
    ldr r0, .L_02210c54
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    bl func_02030acc
    bl func_020740a4
    ldr r0, .L_02210c54
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201dcec
    ldr r0, .L_02210c58
    ldr r0, [r0, #0x0]
    bl func_02010e68
    ldr r0, .L_02210c54
    ldr r0, [r0, #0x0]
    bl func_02008b50
    b .L_02210c20
.L_02210c10:
    ldr r0, [r5, #0x3c]
    bl func_020740a4
    ldr r0, [r5, #0x40]
    bl func_020740a4
.L_02210c20:
    cmp r4, #0x0
    beq .L_02210c48
    cmp r5, #0x0
    beq .L_02210c40
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210c40:
    mov r0, #0x1
    b .L_02210c4c
.L_02210c48:
    mov r0, #0x0
.L_02210c4c:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02210c54: .word data_021052fc
.L_02210c58: .word gLupyContext
.size func_ov064_02210ae8, . - func_ov064_02210ae8
