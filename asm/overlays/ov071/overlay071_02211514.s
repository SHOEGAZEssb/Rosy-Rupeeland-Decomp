.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern __construct_array
.extern func_ov071_02210184
.extern func_ov071_022101a0

.global func_ov071_02211514
func_ov071_02211514:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr ip, .L_022115b4
    mov r5, r1
    ldr r3, .L_022115b8
    add r0, r4, #0x4
    mov r1, #0x3c
    mov r2, #0xc
    str ip, [sp, #0x0]
    bl __construct_array
    ldr ip, .L_022115b4
    ldr r3, .L_022115b8
    add r0, r4, #0x2d4
    mov r1, #0x3c
    mov r2, #0xc
    str ip, [sp, #0x0]
    bl __construct_array
    ldr r1, .L_022115b4
    add r0, r4, #0x1a4
    str r1, [sp, #0x0]
    ldr r3, .L_022115b8
    add r0, r0, #0x400
    mov r1, #0x3c
    mov r2, #0xc
    bl __construct_array
    mov r0, #0x3c
    str r5, [r4, #0x0]
    sub r3, r0, #0x1
    mvn r2, #0x0
.L_02211588:
    add r1, r4, r3, lsl #0x2
    add r0, r3, #0x1
    str r2, [r1, #0x964]
    str r0, [r1, #0xb44]
    subs r3, r3, #0x1
    bpl .L_02211588
    str r2, [r4, #0xc30]
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0xc34]
    ldmia sp!, {r3, r4, r5, pc}
.L_022115b4: .word func_ov071_022101a0
.L_022115b8: .word func_ov071_02210184
.size func_ov071_02211514, . - func_ov071_02211514
