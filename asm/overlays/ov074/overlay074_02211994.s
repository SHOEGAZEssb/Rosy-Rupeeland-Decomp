.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern GX_SetBankForLCDC

.global func_ov074_02211994
func_ov074_02211994:
    stmdb sp!, {r3, lr}
    mov r0, #0x2
    bl GX_SetBankForLCDC
    ldr r1, .L_022119b0
    ldr r0, .L_022119b4
    str r1, [r0, #0x0]
    ldmia sp!, {r3, pc}
.L_022119b0: .word 0x80310000
.L_022119b4: .word 0x4000064
.size func_ov074_02211994, . - func_ov074_02211994
