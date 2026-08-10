.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern ActorExtendedLinkSource_Destroy

.global func_ov083_022137a8
func_ov083_022137a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedLinkSource_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov083_022137a8, . - func_ov083_022137a8
