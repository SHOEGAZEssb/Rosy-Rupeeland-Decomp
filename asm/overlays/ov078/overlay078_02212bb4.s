.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern ActorExtendedType2_InitializePresentation

.global func_ov078_02212bb4
func_ov078_02212bb4:
    ldr ip, .L_02212bbc
    bx ip
.L_02212bbc: .word ActorExtendedType2_InitializePresentation
.size func_ov078_02212bb4, . - func_ov078_02212bb4
