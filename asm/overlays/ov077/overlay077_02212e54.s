.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern ActorExtendedType2_UpdatePresentationForState

.global func_ov077_02212e54
func_ov077_02212e54:
    ldr ip, .L_02212e5c
    bx ip
.L_02212e5c: .word ActorExtendedType2_UpdatePresentationForState
.size func_ov077_02212e54, . - func_ov077_02212e54
