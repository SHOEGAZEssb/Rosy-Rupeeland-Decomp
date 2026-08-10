.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern ActorExtendedType2_ApplyContactResponse

.global func_ov077_02212e48
func_ov077_02212e48:
    ldr ip, .L_02212e50
    bx ip
.L_02212e50: .word ActorExtendedType2_ApplyContactResponse
.size func_ov077_02212e48, . - func_ov077_02212e48
