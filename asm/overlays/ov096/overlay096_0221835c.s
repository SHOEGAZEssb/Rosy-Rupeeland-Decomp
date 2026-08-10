.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern ActorExtendedTransform_Destroy

.global func_ov096_0221835c
func_ov096_0221835c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedTransform_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov096_0221835c, . - func_ov096_0221835c
