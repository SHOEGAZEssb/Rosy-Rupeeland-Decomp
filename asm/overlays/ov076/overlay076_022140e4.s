.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern Heap_Free
.extern ActorExtendedType2_Destroy

.global func_ov076_022140e4
func_ov076_022140e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov076_022140e4, . - func_ov076_022140e4
