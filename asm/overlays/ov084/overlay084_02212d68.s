.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern func_02005030
.extern func_02005058
.extern ActorExtendedType2_UpdateTargetMotion

.global func_ov084_02212d68
func_ov084_02212d68:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    bl func_02005030
    add r1, sp, #0x0
    mov r0, r4
    bl ActorExtendedType2_UpdateTargetMotion
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size func_ov084_02212d68, . - func_ov084_02212d68
