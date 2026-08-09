.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern func_ov070_0221187c

.global func_ov070_0221186c
func_ov070_0221186c:
    ldr ip, .L_02211878
    add r1, r1, #0x1b8
    bx ip
.L_02211878: .word func_ov070_0221187c
.size func_ov070_0221186c, . - func_ov070_0221186c
