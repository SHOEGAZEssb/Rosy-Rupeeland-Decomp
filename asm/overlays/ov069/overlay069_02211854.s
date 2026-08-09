.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern data_020f3058
.extern func_02004fe0

.global func_ov069_02211854
func_ov069_02211854:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_02211890
    add r0, r4, #0x1c
    str r1, [r4, #0x0]
    bl func_02004fe0
    add r0, r4, #0x2c
    bl func_02004fe0
    mov r1, #0x0
    str r1, [r4, #0x4]
    str r1, [r4, #0x8]
    str r1, [r4, #0xc]
    mov r0, r4
    str r1, [r4, #0x44]
    ldmia sp!, {r4, pc}
.L_02211890: .word data_020f3058
.size func_ov069_02211854, . - func_ov069_02211854
