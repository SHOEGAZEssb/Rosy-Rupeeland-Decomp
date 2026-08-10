.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern ActorExtendedType2_Destroy

.global func_ov084_02213ec0
func_ov084_02213ec0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov084_02213ec0, . - func_ov084_02213ec0
