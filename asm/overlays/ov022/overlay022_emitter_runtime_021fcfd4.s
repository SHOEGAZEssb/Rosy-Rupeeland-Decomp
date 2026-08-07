    .text
/* Exact fallback; see src/overlays/ov022/overlay022_emitter_runtime.c. */
    .extern data_ov022_022005a8
    .extern data_ov022_022005b8
    .extern func_02091a70
    .extern func_02091b98
    .extern func_02091bac

.global func_ov022_021fcfd4
func_ov022_021fcfd4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r2
    mov r5, r0
    mov r6, r3
    mov r2, r1
    mov r3, r7
    mov r0, #0x14
    mov r1, #0xc8
    bl func_02091a70
    mov r4, r0
    mov r0, r7, lsl #0x2
    cmp r4, r7, lsl #0x2
    movgt r4, r0
    mov r3, r7
    add r0, r5, #0x10
    mov r1, #0x1
    mov r2, #0x0
    str r4, [sp, #0x0]
    bl func_02091bac
    mov r0, #0x0
    str r0, [r5, #0x58]
    cmp r6, #0x0
    str r0, [r5, #0x5c]
    ldreq r1, L_021fd060
    ldreq r0, L_021fd064
    ldrne r1, L_021fd064
    str r6, [r5, #0x60]
    str r1, [r5, #0x68]
    ldrne r0, L_021fd060
    mov r1, #0xa
    str r0, [r5, #0x6c]
    add r0, r5, #0x2c
    bl func_02091b98
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fd060: .word data_ov022_022005a8
L_021fd064: .word data_ov022_022005b8
.size func_ov022_021fcfd4, . - func_ov022_021fcfd4
