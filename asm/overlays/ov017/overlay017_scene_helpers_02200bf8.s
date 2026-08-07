    .text
/* Exact fallback; see src/overlays/ov017/overlay017_scene_helpers.c. */
    .extern data_021e9ac0
    .extern func_020651a4
.global func_ov017_02200bf8
func_ov017_02200bf8:
    stmdb sp!, {r3, lr}
    ldr r0, L_02200c1c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x1c
    bl func_020651a4
    cmp r0, #0x63
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, pc}
L_02200c1c: .word data_021e9ac0
    .size func_ov017_02200bf8, . - func_ov017_02200bf8
