.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_resource_recovery.c.
.extern func_0209a2ac

.global func_ov049_0220c0b8
func_ov049_0220c0b8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r1, #0x0
    mov r2, #0x1
    mov r8, r0
    bl func_0209a2ac
    mov r5, #0x1
    ldr r6, [r8, #0x88]
    mov r4, r5
    b .L_0220c108
.L_0220c0e0:
    add r0, r8, r6, lsl #0x2
    ldr r0, [r0, #0x4c]
    mov r1, r7
    mov r2, r5
    bl func_0209a2ac
    add r0, r8, r6, lsl #0x2
    ldr r0, [r0, #0x68]
    mov r1, r7
    mov r2, r4
    bl func_0209a2ac
.L_0220c108:
    subs r6, r6, #0x1
    bpl .L_0220c0e0
    ldr r0, [r8, #0x84]
    mov r1, r7
    mov r2, #0x1
    bl func_0209a2ac
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov049_0220c0b8, . - func_ov049_0220c0b8
