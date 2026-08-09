.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02213838
func_ov078_02213838:
    ldrb r1, [r0, #0x27e]
    mov r0, #0x0
    add r1, r1, #0xff
    and r2, r1, #0xff
    cmp r2, #0x1f
    bxhi lr
    mov r1, #0x1
    mov r2, r1, lsl r2
    tst r2, #0x90000007
    movne r0, r1
    bx lr
.size func_ov078_02213838, . - func_ov078_02213838
