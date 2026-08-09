.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020068e0
.extern func_020069b8
.extern func_02006a5c

.global func_ov059_02211a14
func_ov059_02211a14:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x70
    mov r4, r1
    mov r1, #0x0
    mov r5, r0
    add r0, sp, #0x60
    mov r3, r1
    mov r2, r2, lsl #0xc
    bl func_0200500c
    mov r1, #0x0
    add r0, sp, #0x50
    mov r3, r1
    mov r2, r4, lsl #0xc
    bl func_0200500c
    add r0, sp, #0x40
    add r1, sp, #0x60
    bl func_02005030
    mov r0, #0x1e
    str r0, [sp, #0x0]
    add r0, sp, #0x4
    add r1, sp, #0x60
    add r2, sp, #0x50
    add r3, sp, #0x40
    bl func_020069b8
    add r0, r5, #0x54
    add r1, sp, #0x4
    bl func_02006a5c
    add r0, sp, #0x4
    bl func_020068e0
    add r0, sp, #0x40
    bl func_02005058
    add r0, sp, #0x50
    bl func_02005058
    add r0, sp, #0x60
    bl func_02005058
    add sp, sp, #0x70
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov059_02211a14, . - func_ov059_02211a14
