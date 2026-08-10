.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern ActorExtendedType2_EnterState2WithCallbacks
.extern func_ov084_02213bc8

.global func_ov084_02213b0c
func_ov084_02213b0c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_ov084_02213bc8
    mov r0, r5
    mov r1, r4
    bl ActorExtendedType2_EnterState2WithCallbacks
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov084_02213b0c, . - func_ov084_02213b0c
