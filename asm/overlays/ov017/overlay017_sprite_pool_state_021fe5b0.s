    .text

/* Exact fallback; see src/overlays/ov017/overlay017_sprite_pool_state.c. */
    .extern func_020773a8
    .extern func_0209189c
    .extern func_02091bac
    .extern func_02091c7c
    .extern func_02091cf0
.global func_ov017_021fe5b0
func_ov017_021fe5b0:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    add r0, r4, #0x38
    mov r1, #0x0
    bl func_02091c7c
    ldr r0, [r4, #0x30]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021fe6a4
L_021fe5d8:
    b L_021fe6a4
    b L_021fe5e8
    b L_021fe628
    b L_021fe68c
L_021fe5e8:
    add r0, r4, #0x38
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fe6a4
    mov r0, #0x8
    str r0, [sp, #0x0]
    ldr r2, [r4, #0x48]
    add r0, r4, #0x38
    mov r1, #0x2
    mov r3, #0x1000
    bl func_02091bac
    mov r0, #0x2
    str r0, [r4, #0x30]
    mov r0, #0x0
    str r0, [r4, #0x34]
    b L_021fe6a4
L_021fe628:
    add r0, r4, #0x38
    bl func_02091cf0
    cmp r0, #0x0
    beq L_021fe6a4
    ldr r1, L_021fe6d8
    add r0, r4, #0x54
    add r2, r1, #0x334
    ldr r6, [r4, #0x48]
    bl func_0209189c
    mov r5, r0
    add r0, r4, #0x54
    mov r1, #0x4
    mov r2, #0x8
    bl func_0209189c
    str r0, [sp, #0x0]
    mov r2, r6
    mov r3, r5
    add r0, r4, #0x38
    mov r1, #0x2
    bl func_02091bac
    mov r0, #0x2
    str r0, [r4, #0x30]
    mov r0, #0x0
    str r0, [r4, #0x34]
    b L_021fe6a4
L_021fe68c:
    add r0, r4, #0x38
    bl func_02091cf0
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x30]
    strne r0, [r4, #0x34]
L_021fe6a4:
    ldr r1, [r4, #0x48]
    mov r2, #0x0
L_021fe6ac:
    add r0, r4, r2, lsl #0x2
    ldr r0, [r0, #0x10]
    add r2, r2, #0x1
    str r1, [r0, #0x34]
    str r1, [r0, #0x38]
    cmp r2, #0x8
    blt L_021fe6ac
    ldr r0, [r4, #0x0]
    bl func_020773a8
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fe6d8: .word 0xe66
    .size func_ov017_021fe5b0, . - func_ov017_021fe5b0
