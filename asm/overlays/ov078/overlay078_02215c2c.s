.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern ActorExtendedType2_LaunchRandomMotion

.global func_ov078_02215c2c
func_ov078_02215c2c:
    ldr ip, .L_02215c34
    bx ip
.L_02215c34: .word ActorExtendedType2_LaunchRandomMotion
.size func_ov078_02215c2c, . - func_ov078_02215c2c
