.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov077_02216d68
func_ov077_02216d68:
    ldr ip, .L_02216d74
    add r1, r1, #0x18
    bx ip
.L_02216d74: .word VecFx32Object_InitCopy
.size func_ov077_02216d68, . - func_ov077_02216d68
