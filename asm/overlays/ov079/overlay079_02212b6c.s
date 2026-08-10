.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern Heap_Free
.extern ActorExtendedType2_Destroy

.global func_ov079_02212b6c
func_ov079_02212b6c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov079_02212b6c, . - func_ov079_02212b6c
