    .text

/* Exact fallback; see src/overlays/ov017/overlay017_sprite_pool_state.c. */
    .extern func_02091bac
.global func_ov017_021fe6dc
func_ov017_021fe6dc:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov ip, #0x10
    add r0, r4, #0x38
    mov r1, #0x2
    mov r2, #0x0
    mov r3, #0x1800
    str ip, [sp, #0x0]
    bl func_02091bac
    mov r0, #0x1
    str r0, [r4, #0x30]
    mov r0, #0x0
    str r0, [r4, #0x34]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
    .size func_ov017_021fe6dc, . - func_ov017_021fe6dc
