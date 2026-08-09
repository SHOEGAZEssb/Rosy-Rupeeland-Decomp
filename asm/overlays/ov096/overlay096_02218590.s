.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern data_ov096_02218d6c
.extern data_ov096_02218d74

.global func_ov096_02218590
func_ov096_02218590:
    ldr r1, .L_022185d0
    ldr r2, [r0, #0x218]
    ldr r1, [r1, #0x8]
    mov ip, #0x1
    cmp r2, r1
    ldr r3, .L_022185d4
    bne .L_022185c0
    ldr r1, [r0, #0x21c]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq ip, #0x0
.L_022185c0:
    cmp ip, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_022185d0: .word data_ov096_02218d6c
.L_022185d4: .word data_ov096_02218d74
.size func_ov096_02218590, . - func_ov096_02218590
