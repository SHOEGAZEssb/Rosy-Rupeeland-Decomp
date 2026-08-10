.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern ActorExtendedType2_InitializePresentation

.global func_ov079_02212b88
func_ov079_02212b88:
    ldr ip, .L_02212b90
    bx ip
.L_02212b90: .word ActorExtendedType2_InitializePresentation
.size func_ov079_02212b88, . - func_ov079_02212b88
