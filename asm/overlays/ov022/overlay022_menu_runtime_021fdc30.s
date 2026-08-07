    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_runtime.c. */
    .extern func_020befec

.global func_ov022_021fdc30
func_ov022_021fdc30:
    stmdb sp!, {r4, lr}
    ldr r2, [r1, #0x4]
    ldr r1, [r1, #0x8]
    mov r4, r0
    sub r0, r1, #0x18
    subs r2, r2, #0x10
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, pc}
    cmp r2, #0xc8
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r4, pc}
    cmp r0, #0x60
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    mov r1, #0x18
    bl func_020befec
    ldr r2, [r4, #0x30]
    cmp r0, #0x4
    ldr r2, [r2, #0xc]
    movge r0, #0x3
    ldr r1, [r4, #0x2c]
    add r0, r0, r2
    cmp r0, r1
    mvnge r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov022_021fdc30, . - func_ov022_021fdc30
