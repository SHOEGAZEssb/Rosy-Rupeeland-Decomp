.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov086_02212bf4
func_ov086_02212bf4:
    ldr ip, .L_02212c00
    add r1, r1, #0x18
    bx ip
.L_02212c00: .word VecFx32Object_InitCopy
.size func_ov086_02212bf4, . - func_ov086_02212bf4
