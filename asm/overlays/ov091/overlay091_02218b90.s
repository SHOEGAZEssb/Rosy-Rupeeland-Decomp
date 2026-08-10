.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov091_02218b90
func_ov091_02218b90:
    ldr ip, .L_02218b9c
    add r1, r1, #0x18
    bx ip
.L_02218b9c: .word VecFx32Object_InitCopy
.size func_ov091_02218b90, . - func_ov091_02218b90
