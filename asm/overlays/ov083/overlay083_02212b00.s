.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern ActorExtendedLinked_Destroy

.global func_ov083_02212b00
func_ov083_02212b00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedLinked_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov083_02212b00, . - func_ov083_02212b00
