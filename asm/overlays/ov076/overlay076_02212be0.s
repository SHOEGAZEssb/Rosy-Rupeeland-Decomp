.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern ActorExtendedType2_InitializePresentation

.global func_ov076_02212be0
func_ov076_02212be0:
    ldr ip, .L_02212be8
    bx ip
.L_02212be8: .word ActorExtendedType2_InitializePresentation
.size func_ov076_02212be0, . - func_ov076_02212be0
