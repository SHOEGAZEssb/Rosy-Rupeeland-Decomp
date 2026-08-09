.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_ov056_0220e854
.extern func_ov056_0220e8f8
.extern func_ov056_0220ec70
.extern func_ov056_0220eca0
.extern func_ov056_0220f40c

.global func_ov056_0220ea40
func_ov056_0220ea40:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r3, [r10, #0x82c]
    mov r9, r1
    subs r1, r9, r3
    rsbmi r0, r1, #0x0
    movpl r0, r1
    mov r8, r2
    cmp r0, #0x4
    bge .L_0220ea7c
    ldr r0, [r10, #0x830]
    subs r0, r8, r0
    rsbmi r0, r0, #0x0
    cmp r0, #0x4
    blt .L_0220eabc
.L_0220ea7c:
    mov r5, #0x0
    mov r4, r5
.L_0220ea84:
    mov r6, r4
.L_0220ea88:
    mov r0, r10
    add r1, r9, r6
    add r2, r8, r5
    bl func_ov056_0220e8f8
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_0220ea88
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0220ea84
    mov r0, r10
    bl func_ov056_0220e854
    b .L_0220ec64
.L_0220eabc:
    cmp r1, #0x0
    ble .L_0220eb28
    add r6, r3, #0x1
    add r4, r10, #0x1c
    mov r11, #0x0
    b .L_0220eb1c
.L_0220ead4:
    mov r7, r11
.L_0220ead8:
    mov r0, r10
    add r1, r6, #0x3
    add r2, r8, r7
    bl func_ov056_0220ec70
    mov r5, r0
    add r0, r4, #0x800
    add r1, r6, #0x3
    add r2, r8, r7
    bl func_ov056_0220f40c
    mov r2, r5
    mov r1, r0
    mov r0, r10
    bl func_ov056_0220eca0
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_0220ead8
    add r6, r6, #0x1
.L_0220eb1c:
    cmp r6, r9
    ble .L_0220ead4
    b .L_0220eb8c
.L_0220eb28:
    bge .L_0220eb8c
    sub r6, r3, #0x1
    add r4, r10, #0x1c
    mov r11, #0x0
    b .L_0220eb84
.L_0220eb3c:
    mov r7, r11
.L_0220eb40:
    mov r0, r10
    mov r1, r6
    add r2, r8, r7
    bl func_ov056_0220ec70
    mov r5, r0
    mov r1, r6
    add r0, r4, #0x800
    add r2, r8, r7
    bl func_ov056_0220f40c
    mov r2, r5
    mov r1, r0
    mov r0, r10
    bl func_ov056_0220eca0
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_0220eb40
    sub r6, r6, #0x1
.L_0220eb84:
    cmp r6, r9
    bge .L_0220eb3c
.L_0220eb8c:
    ldr r1, [r10, #0x830]
    sub r0, r8, r1
    cmp r0, #0x0
    ble .L_0220ec00
    add r6, r1, #0x1
    add r4, r10, #0x1c
    mov r11, #0x0
    b .L_0220ebf4
.L_0220ebac:
    mov r7, r11
.L_0220ebb0:
    mov r0, r10
    add r1, r9, r7
    add r2, r6, #0x3
    bl func_ov056_0220ec70
    mov r5, r0
    add r0, r4, #0x800
    add r1, r9, r7
    add r2, r6, #0x3
    bl func_ov056_0220f40c
    mov r2, r5
    mov r1, r0
    mov r0, r10
    bl func_ov056_0220eca0
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_0220ebb0
    add r6, r6, #0x1
.L_0220ebf4:
    cmp r6, r8
    ble .L_0220ebac
    b .L_0220ec64
.L_0220ec00:
    bge .L_0220ec64
    sub r6, r1, #0x1
    add r4, r10, #0x1c
    mov r11, #0x0
    b .L_0220ec5c
.L_0220ec14:
    mov r7, r11
.L_0220ec18:
    mov r0, r10
    mov r2, r6
    add r1, r9, r7
    bl func_ov056_0220ec70
    mov r5, r0
    mov r2, r6
    add r0, r4, #0x800
    add r1, r9, r7
    bl func_ov056_0220f40c
    mov r2, r5
    mov r1, r0
    mov r0, r10
    bl func_ov056_0220eca0
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_0220ec18
    sub r6, r6, #0x1
.L_0220ec5c:
    cmp r6, r8
    bge .L_0220ec14
.L_0220ec64:
    str r9, [r10, #0x82c]
    str r8, [r10, #0x830]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov056_0220ea40, . - func_ov056_0220ea40
