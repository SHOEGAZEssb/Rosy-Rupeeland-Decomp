.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern TouchRegion_Init
.extern data_ov060_02210600

.global func_ov060_0220fd20
func_ov060_0220fd20:
    stmdb sp!, {r4, lr}
    mov r3, #0x1
    mov r4, r0
    bl TouchRegion_Init
    ldr r0, .L_0220fd50
    mov r1, #0x0
    str r0, [r4, #0x0]
    str r1, [r4, #0x1c]
    strb r1, [r4, #0x20]
    mov r0, r4
    strb r1, [r4, #0x21]
    ldmia sp!, {r4, pc}
.L_0220fd50: .word data_ov060_02210600
.size func_ov060_0220fd20, . - func_ov060_0220fd20
