.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern Heap_Free
.extern TrackedResourceActorImpulse_Destroy

.global func_ov095_0221c760
func_ov095_0221c760:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActorImpulse_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov095_0221c760, . - func_ov095_0221c760
