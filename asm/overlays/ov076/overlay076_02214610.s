.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov076_02214610
func_ov076_02214610:
    ldr ip, .L_0221461c
    add r1, r1, #0x18
    bx ip
.L_0221461c: .word VecFx32Object_InitCopy
.size func_ov076_02214610, . - func_ov076_02214610
