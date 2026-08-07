    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_runtime_helpers.c. */
    .extern func_020befec

.global func_ov020_021fdf08
func_ov020_021fdf08:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    ldr r1, [r4, #0x34]
    sub r0, r0, #0x10
    subs r1, r1, #0x20
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, pc}
    cmp r1, #0xac
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r4, pc}
    cmp r0, #0x78
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    mov r1, #0x18
    bl func_020befec
    ldr r2, [r4, #0x1dc]
    cmp r0, #0x5
    ldr r2, [r2, #0x44]
    movge r0, #0x4
    ldr r2, [r2, #0xc]
    ldr r1, [r4, #0x120]
    add r0, r0, r2
    cmp r0, r1
    mvnge r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_ov020_021fdf08, . - func_ov020_021fdf08

