.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_controller_recovery.c.
.extern __construct_array
.extern func_ov049_0220c21c
.extern func_ov049_0220c238
.extern func_ov049_0220c23c

.global func_ov049_0220c124
func_ov049_0220c124:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r4, .L_0220c214
    ldr r3, .L_0220c218
    add r0, r10, #0x4
    mov r1, #0x32
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    ldr r3, .L_0220c218
    add r0, r10, #0x25c
    mov r1, #0x32
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    mov r1, #0x0
    mov r0, #0xa
    str r1, [r10, #0x0]
    sub r9, r0, #0x1
.L_0220c170:
    mov r0, #0x1e000
    mul r5, r9, r0
    mov r1, #0x3c
    mul r3, r9, r1
    mov r0, #0x14
    add r2, r10, #0x4
    add r1, r10, #0x25c
    mov r4, #0x5
    add r11, r5, #0x200000
    mla r8, r9, r0, r10
    sub r4, r4, #0x1
    add r5, r10, r3
    add r6, r2, r3
    add r7, r1, r3
.L_0220c1a8:
    mov r0, #0xc
    mul r2, r4, r0
    add r0, r4, r4, lsl #0x1
    add r1, r5, r2
    mov r0, r0, lsl #0xe
    rsb r3, r0, #0x190000
    str r11, [r1, #0x8]
    str r3, [r1, #0xc]
    add r0, r7, r2
    add r1, r6, r2
    bl func_ov049_0220c23c
    add r1, r8, r4, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0x57c]
    str r0, [r1, #0x4b4]
    subs r4, r4, #0x1
    bpl .L_0220c1a8
    add r0, r10, r9, lsl #0x1
    add r1, r0, #0x600
    mvn r0, #0x0
    strh r0, [r1, #0x44]
    mov r0, #0x0
    strh r0, [r1, #0x6c]
    subs r9, r9, #0x1
    bpl .L_0220c170
    mov r0, r10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220c214: .word func_ov049_0220c238
.L_0220c218: .word func_ov049_0220c21c
.size func_ov049_0220c124, . - func_ov049_0220c124
