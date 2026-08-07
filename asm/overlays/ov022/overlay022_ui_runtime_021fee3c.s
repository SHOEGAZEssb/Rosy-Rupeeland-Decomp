.text

/* Exact fallback; see src/overlays/ov022/overlay022_ui_runtime.c. */
.extern func_02073e48
.extern func_02073ffc
.extern func_020957f0
.extern func_02095820
.extern func_ov022_021fef48


    .global func_ov022_021fee3c
func_ov022_021fee3c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0x9c]
    add r1, r4, #0x84
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r2, #0x0
    add r0, r4, #0x154
    mov r3, #0x1
    str r2, [sp, #0x0]
    bl func_020957f0
    add r0, r4, #0x154
    mvn r1, #0x3f
    mov r2, #0x40
    bl func_02095820
    ldr r0, [r4, #0x9c]
    add r1, r4, #0x84
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0x200
    mov r2, #0x2
    mov r3, #0x1
    bl func_020957f0
    add r0, r4, #0x200
    mvn r1, #0x3f
    mov r2, #0x70
    bl func_02095820
    mov r0, r4
    bl func_ov022_021fef48
    ldr r0, [r4, #0x9c]
    add r1, r4, #0x78
    mov r2, #0x1
    bl func_02073ffc
    str r0, [r4, #0xa4]
    mov r0, #0x1
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x6
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xa4]
    mov r1, #0x14
    mov r2, #0x86
    mov r3, #0x1c
    bl func_02073e48
    ldr r0, [r4, #0x9c]
    add r1, r4, #0x78
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0xa8
    mov r2, #0x2
    mov r3, #0x1
    bl func_020957f0
    add r0, r4, #0xa8
    mov r1, #0xe4
    mov r2, #0xaa
    bl func_02095820
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.size func_ov022_021fee3c, .-func_ov022_021fee3c

