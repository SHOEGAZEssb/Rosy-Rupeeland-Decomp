.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_panel_position.c.
.extern data_ov046_0220cd14
.extern data_ov046_0220cd18
.extern data_ov046_0220cd20
.extern data_ov046_0220ce08

.global func_ov046_0220c3bc
func_ov046_0220c3bc:
    mov r0, #0x14
    mul ip, r1, r0
    ldr r1, .L_0220c400
    mov r0, #0x28
    ldr r1, [r1, ip]
    ldr r3, .L_0220c404
    mul r2, r1, r0
    ldr r1, .L_0220c408
    ldr r0, .L_0220c40c
    ldr r3, [r3, ip]
    ldr r2, [r1, r2]
    ldr r1, [r0, ip]
    mov r0, r3, lsl #0x6
    add r0, r0, r0, lsr #0x1f
    add r1, r2, r1, lsl #0x6
    add r0, r1, r0, asr #0x1
    bx lr
.L_0220c400: .word data_ov046_0220cd14
.L_0220c404: .word data_ov046_0220cd20
.L_0220c408: .word data_ov046_0220ce08
.L_0220c40c: .word data_ov046_0220cd18
.size func_ov046_0220c3bc, . - func_ov046_0220c3bc
