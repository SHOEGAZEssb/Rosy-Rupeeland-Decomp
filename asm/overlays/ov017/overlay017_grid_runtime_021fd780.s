    .text

/* Exact fallback; see src/overlays/ov017/overlay017_grid_runtime.c. */
    .extern data_020f4e18
    .extern data_ov017_02201608
    .extern GraphicsArchive_ReleaseOwlvResource
.global func_ov017_021fd780
func_ov017_021fd780:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd7b0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_021fd7a8
    ldr r0, L_021fd7b4
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseOwlvResource
L_021fd7a8:
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd7b0: .word data_ov017_02201608
L_021fd7b4: .word data_020f4e18
    .size func_ov017_021fd780, . - func_ov017_021fd780

