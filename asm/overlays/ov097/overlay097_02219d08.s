.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern ActorExtendedType2_LaunchRandomMotion

.global func_ov097_02219d08
func_ov097_02219d08:
    ldr ip, .L_02219d10
    bx ip
.L_02219d10: .word ActorExtendedType2_LaunchRandomMotion
.size func_ov097_02219d08, . - func_ov097_02219d08
