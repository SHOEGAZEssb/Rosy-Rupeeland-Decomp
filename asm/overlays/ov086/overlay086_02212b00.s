.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.
.extern ActorExtendedTransform_Destroy

.global func_ov086_02212b00
func_ov086_02212b00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedTransform_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov086_02212b00, . - func_ov086_02212b00
