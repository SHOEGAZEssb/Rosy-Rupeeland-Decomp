.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_02005030

.global func_ov075_022144c0
func_ov075_022144c0:
    ldr ip, .L_022144cc
    add r1, r1, #0x18
    bx ip
.L_022144cc: .word func_02005030
.size func_ov075_022144c0, . - func_ov075_022144c0
