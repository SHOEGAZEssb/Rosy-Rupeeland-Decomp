.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_ov074_02211d5c
.extern func_ov074_02211a8c

.global func_ov074_0220fd68
func_ov074_0220fd68:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov ip, #0x10
    mov r3, r2
    str ip, [sp, #0x0]
    mov ip, #0x7
    mov r2, #0x0
    mov r4, r0
    str ip, [sp, #0x4]
    bl func_ov074_02211a8c
    ldr r1, .L_0220fda4
    mov r0, r4
    str r1, [r4, #0x0]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_0220fda4: .word data_ov074_02211d5c
.size func_ov074_0220fd68, . - func_ov074_0220fd68
