.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov093_02218734
func_ov093_02218734:
    ldr ip, .L_02218740
    add r1, r1, #0x18
    bx ip
.L_02218740: .word VecFx32Object_InitCopy
.size func_ov093_02218734, . - func_ov093_02218734
