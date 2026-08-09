.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern func_02041c48

.global func_ov096_02217f4c
func_ov096_02217f4c:
    ldrb r2, [r0, #0x29a]
    ldr ip, .L_02217f68
    cmp r2, #0x0
    ldrneh r2, [r1, #0x18]
    bicne r2, r2, #0x1
    strneh r2, [r1, #0x18]
    bx ip
.L_02217f68: .word func_02041c48
.size func_ov096_02217f4c, . - func_ov096_02217f4c
