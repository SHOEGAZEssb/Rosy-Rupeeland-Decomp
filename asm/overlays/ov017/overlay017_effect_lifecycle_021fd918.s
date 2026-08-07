    .text

/* Exact fallback; see src/overlays/ov017/overlay017_effect_lifecycle.c. */
    .extern func_01ff88c4
.global func_ov017_021fd918
func_ov017_021fd918:
    mov r2, #0xc
    mul r2, r1, r2
    ldr r1, [r0, #0x4]
    ldr ip, L_021fd944
    ldr r3, [r1, #0x24]
    mov r0, #0x3
    add r1, r3, r2
    ldr r1, [r1, #0x4]
    ldr r2, [r3, r2]
    add r1, r3, r1
    bx ip
L_021fd944: .word func_01ff88c4
    .size func_ov017_021fd918, . - func_ov017_021fd918

