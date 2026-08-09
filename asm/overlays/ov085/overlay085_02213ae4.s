.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_ov085_02214434
.extern func_020bf1f8
.extern func_ov085_02213bd0
.extern genrand_int32

.global func_ov085_02213ae4
func_ov085_02213ae4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl genrand_int32
    tst r0, #0x7
    bne .L_02213b08
    mov r1, #0x3c
    mov r4, #0x5
    bl func_020bf1f8
    b .L_02213b1c
.L_02213b08:
    tst r0, #0x1
    movne r4, #0x4
    mov r1, #0x78
    moveq r4, #0x1
    bl func_020bf1f8
.L_02213b1c:
    add r3, r1, #0x3c
    ldr r1, .L_02213b38
    mov r0, r5
    add r1, r1, r4, lsl #0x3
    ldmia r1, {r1, r2}
    bl func_ov085_02213bd0
    ldmia sp!, {r3, r4, r5, pc}
.L_02213b38: .word data_ov085_02214434
.size func_ov085_02213ae4, . - func_ov085_02213ae4
