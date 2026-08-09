.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_ov056_0220e828
.extern func_ov056_0220e8f8

.global func_ov056_0220ee78
func_ov056_0220ee78:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x1e
    mov r3, #0x4
    bl func_ov056_0220e828
    mov r6, #0x0
    mov r5, r6
.L_0220ee9c:
    mov r7, r5
.L_0220eea0:
    ldr r1, [r4, #0x82c]
    ldr r2, [r4, #0x830]
    mov r0, r4
    add r1, r1, r7
    add r2, r2, r6
    bl func_ov056_0220e8f8
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_0220eea0
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_0220ee9c
    mov r0, #0x3e8
    rsb r0, r0, #0x0
    str r0, [r4, #0x82c]
    str r0, [r4, #0x830]
    mov r0, #0x1
    str r0, [r4, #0x8a8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov056_0220ee78, . - func_ov056_0220ee78
