.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern ActorExtendedType2_LaunchRandomMotion
.extern func_ov075_02215910

.global func_ov075_02215574
func_ov075_02215574:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_LaunchRandomMotion
    mov r0, r4
    bl func_ov075_02215910
    ldmia sp!, {r4, pc}
.size func_ov075_02215574, . - func_ov075_02215574
