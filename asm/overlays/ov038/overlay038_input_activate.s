.text

/* Exact fallback; see src/overlays/ov038/overlay038_input_activate.c for documented portable C. */

    .extern func_020befec
    .extern func_020755bc
    .extern func_ov038_021fd40c
    .extern func_ov038_021fd508
    .extern func_02028100
    .extern func_ov046_0220c3bc
    .extern func_ov046_0220c410
    .extern func_ov046_0220c46c
    .extern func_ov038_021fd540
    .extern func_ov046_0220bffc
    .extern func_ov038_021fd624
    .extern func_ov038_021fce04
    .extern data_020f4e14
    .extern gDebugFont
    .extern data_ov038_021fdce0
    .extern data_ov038_021fdcc8

    .global func_ov038_021fd670
func_ov038_021fd670:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    ldr r1, [r4, #0x34]
    sub r0, r0, #0x18
    subs r1, r1, #0x10
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, pc}
    cmp r1, #0xc8
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
    ldr r2, [r4, #0x314]
    cmp r0, #0x5
    ldr r2, [r2, #0xc]
    movge r0, #0x4
    ldr r1, [r4, #0x110]
    add r0, r0, r2
    cmp r0, r1
    mvnge r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_ov038_021fd670, .-func_ov038_021fd670

    .global func_ov038_021fd6e0
func_ov038_021fd6e0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    bne L_021fd7e0
    ldr r1, [r4, #0x110]
    cmp r1, #0x0
    beq L_021fd7c4
    ldr r0, L_021fd7e8
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fd7ec
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    bl func_ov038_021fd40c
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x344]
    bl func_02028100
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c3bc
    mov r5, r0
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c410
    mov r1, r5
    mov r2, r0
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c46c
    mov r0, r4
    bl func_ov038_021fd508
    mov r5, r0
    mov r0, r4
    bl func_ov038_021fd540
    mov r1, r5
    mov r3, r0
    ldr r0, [r4, #0x340]
    mov r2, #0x1
    bl func_ov046_0220bffc
    mov r0, r4
    bl func_ov038_021fd624
    ldr r1, [r4, #0x20]
    mov r0, r4
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x20]
    ldr r1, L_021fd7f0
    ldmia r1, {r1, r2}
    bl func_ov038_021fce04
    b L_021fd7e0
L_021fd7c4:
    ldr r2, [r4, #0x20]
    ldr r1, L_021fd7f4
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    str r2, [r4, #0x20]
    ldmia r1, {r1, r2}
    bl func_ov038_021fce04
L_021fd7e0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fd7e8: .word data_020f4e14
L_021fd7ec: .word gDebugFont
L_021fd7f0: .word data_ov038_021fdce0
L_021fd7f4: .word data_ov038_021fdcc8
    .size func_ov038_021fd6e0, .-func_ov038_021fd6e0
