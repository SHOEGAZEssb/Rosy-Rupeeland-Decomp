.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern Heap_Free
.extern VecFx32Object_Destroy
.extern ActorExtendedType2_Destroy

.global func_ov075_022135e4
func_ov075_022135e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2b0
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov075_022135e4, . - func_ov075_022135e4
