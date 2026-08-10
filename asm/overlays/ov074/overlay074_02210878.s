.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_021052fc
.extern func_02004fe0
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern SplineMover_InitTransition
.extern func_0200875c
.extern func_ov074_02210a04

.global func_ov074_02210878
func_ov074_02210878:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xa4
    mov r5, r0
    add r0, sp, #0x94
    mov r4, r2
    bl func_02004fe0
    ldr r1, .L_02210a00
    add r0, sp, #0x84
    ldr r1, [r1, #0x0]
    bl func_0200875c
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b .L_022109cc
.L_022108ac:
    b .L_022108bc
    b .L_02210900
    b .L_02210948
    b .L_0221098c
.L_022108bc:
    mov r2, #0x0
    add r0, sp, #0x74
    mov r3, r2
    mov r1, #0x80000
    bl func_0200500c
    add r0, sp, #0x64
    add r1, sp, #0x84
    add r2, sp, #0x74
    bl func_ov074_02210a04
    add r0, sp, #0x94
    add r1, sp, #0x64
    bl func_020050a4
    add r0, sp, #0x64
    bl func_02005058
    add r0, sp, #0x74
    bl func_02005058
    b .L_022109cc
.L_02210900:
    mov r1, #0x80000
    mov r2, #0x0
    add r0, sp, #0x54
    mov r3, r2
    rsb r1, r1, #0x0
    bl func_0200500c
    add r0, sp, #0x44
    add r1, sp, #0x84
    add r2, sp, #0x54
    bl func_ov074_02210a04
    add r0, sp, #0x94
    add r1, sp, #0x44
    bl func_020050a4
    add r0, sp, #0x44
    bl func_02005058
    add r0, sp, #0x54
    bl func_02005058
    b .L_022109cc
.L_02210948:
    mov r1, #0x0
    add r0, sp, #0x34
    mov r3, r1
    mov r2, #0x60000
    bl func_0200500c
    add r0, sp, #0x24
    add r1, sp, #0x84
    add r2, sp, #0x34
    bl func_ov074_02210a04
    add r0, sp, #0x94
    add r1, sp, #0x24
    bl func_020050a4
    add r0, sp, #0x24
    bl func_02005058
    add r0, sp, #0x34
    bl func_02005058
    b .L_022109cc
.L_0221098c:
    mov r1, #0x0
    add r0, sp, #0x14
    mov r3, r1
    sub r2, r1, #0x60000
    bl func_0200500c
    add r0, sp, #0x4
    add r1, sp, #0x84
    add r2, sp, #0x14
    bl func_ov074_02210a04
    add r0, sp, #0x94
    add r1, sp, #0x4
    bl func_020050a4
    add r0, sp, #0x4
    bl func_02005058
    add r0, sp, #0x14
    bl func_02005058
.L_022109cc:
    add r1, sp, #0x84
    mov ip, #0x20
    add r2, sp, #0x94
    mov r0, r5
    mov r3, r1
    str ip, [sp, #0x0]
    bl SplineMover_InitTransition
    add r0, sp, #0x84
    bl func_02005058
    add r0, sp, #0x94
    bl func_02005058
    add sp, sp, #0xa4
    ldmia sp!, {r4, r5, pc}
.L_02210a00: .word data_021052fc
.size func_ov074_02210878, . - func_ov074_02210878
