.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern func_02005030

.global func_ov096_02218180
func_ov096_02218180:
    ldr ip, .L_0221818c
    add r1, r1, #0x18
    bx ip
.L_0221818c: .word func_02005030
.size func_ov096_02218180, . - func_ov096_02218180
