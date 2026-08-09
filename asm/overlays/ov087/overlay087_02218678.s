.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern func_02005030

.global func_ov087_02218678
func_ov087_02218678:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r1, r1, #0x18
    bl func_02005030
    ldr r0, [r4, #0xc]
    add r0, r0, #0xa000
    str r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
.size func_ov087_02218678, . - func_ov087_02218678
