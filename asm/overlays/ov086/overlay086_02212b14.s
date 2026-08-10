.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.
.extern Heap_Free
.extern ActorExtendedTransform_Destroy

.global func_ov086_02212b14
func_ov086_02212b14:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedTransform_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov086_02212b14, . - func_ov086_02212b14
