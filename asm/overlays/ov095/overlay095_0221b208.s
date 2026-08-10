.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern ActorExtendedType2_LaunchRandomMotion

.global func_ov095_0221b208
func_ov095_0221b208:
    ldr ip, .L_0221b210
    bx ip
.L_0221b210: .word ActorExtendedType2_LaunchRandomMotion
.size func_ov095_0221b208, . - func_ov095_0221b208
