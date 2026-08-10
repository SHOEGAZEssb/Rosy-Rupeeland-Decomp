.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern ActorExtendedLinked_Destroy

.global func_ov075_022150c4
func_ov075_022150c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedLinked_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov075_022150c4, . - func_ov075_022150c4
