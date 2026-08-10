.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern Heap_Free
.extern ActorExtendedLinkSource_Destroy

.global func_ov083_022137bc
func_ov083_022137bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedLinkSource_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov083_022137bc, . - func_ov083_022137bc
