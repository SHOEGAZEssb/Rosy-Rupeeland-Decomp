.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov084_022136b8
func_ov084_022136b8:
    ldr ip, .L_022136c4
    add r1, r1, #0x18
    bx ip
.L_022136c4: .word VecFx32Object_InitCopy
.size func_ov084_022136b8, . - func_ov084_022136b8
