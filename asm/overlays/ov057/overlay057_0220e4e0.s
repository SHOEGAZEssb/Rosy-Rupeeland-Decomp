.text
; Matching fallback for the portable implementation in src/overlays/ov057/overlay057_recovery.c.
.extern GraphicsResourceSet_Destroy
.extern data_ov057_0220e7d4
.extern func_02002290
.extern func_020022dc
.extern func_0201e28c

.global func_ov057_0220e4e0
func_ov057_0220e4e0:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220e514
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_020022dc
    mov r1, #0x1
    bl func_02002290
    add r0, r4, #0x8
    bl GraphicsResourceSet_Destroy
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220e514: .word data_ov057_0220e7d4
.size func_ov057_0220e4e0, . - func_ov057_0220e4e0
