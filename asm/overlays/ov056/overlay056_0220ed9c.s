.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_020b1a5c
.extern func_020b1ff0
.extern func_ov056_0220eeec
.extern func_ov056_0220f558

.global func_ov056_0220ed9c
func_ov056_0220ed9c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x848]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0220edd8
    ldr r4, [r5, #0x840]
    b .L_0220edd0
.L_0220edc4:
    ldr r0, [r4, #0x8]
    bl func_ov056_0220f558
    ldr r4, [r4, #0x0]
.L_0220edd0:
    cmp r4, #0x0
    bne .L_0220edc4
.L_0220edd8:
    ldr r0, [r5, #0x8a8]
    cmp r0, #0x0
    beq .L_0220ee08
    mov r1, #0x0
    str r1, [r5, #0x8a8]
    add r0, r5, #0x4
    mov r2, #0x800
    bl func_020b1a5c
    ldr r0, [r5, #0x0]
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
.L_0220ee08:
    add r1, r5, #0x4
    mov r0, r5
    add r1, r1, #0x800
    bl func_ov056_0220eeec
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov056_0220ed9c, . - func_ov056_0220ed9c
