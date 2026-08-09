.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_panel_position.c.
.extern data_ov046_0220cd14
.extern data_ov046_0220cd1c
.extern data_ov046_0220cd24
.extern data_ov046_0220ce0c

.global func_ov046_0220c410
func_ov046_0220c410:
    stmdb sp!, {r4, lr}
    mov r0, #0x14
    mul r4, r1, r0
    ldr r1, .L_0220c45c
    mov r0, #0x28
    ldr r1, [r1, r4]
    ldr ip, .L_0220c460
    mul r3, r1, r0
    ldr r2, .L_0220c464
    ldr r0, .L_0220c468
    ldr ip, [ip, r4]
    mov r1, #0x30
    mul lr, ip, r1
    ldr r3, [r2, r3]
    ldr r2, [r0, r4]
    add r0, lr, lr, lsr #0x1f
    mla r1, r2, r1, r3
    add r0, r1, r0, asr #0x1
    ldmia sp!, {r4, pc}
.L_0220c45c: .word data_ov046_0220cd14
.L_0220c460: .word data_ov046_0220cd24
.L_0220c464: .word data_ov046_0220ce0c
.L_0220c468: .word data_ov046_0220cd1c
.size func_ov046_0220c410, . - func_ov046_0220c410
