.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_ov085_02214398
.extern func_ov085_02213bd0

.global func_ov085_02213a70
func_ov085_02213a70:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r3, r2
    ldr r2, .L_02213aa8
    str r3, [r5, #0x230]
    mov r4, r1
    ldmia r2, {r1, r2}
    bl func_ov085_02213bd0
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0xcc]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.L_02213aa8: .word data_ov085_02214398
.size func_ov085_02213a70, . - func_ov085_02213a70
