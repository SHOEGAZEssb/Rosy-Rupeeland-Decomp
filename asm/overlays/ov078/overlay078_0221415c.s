.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern Heap_Free
.extern VecFx32Object_Destroy
.extern ActorExtendedType2_Destroy

.global func_ov078_0221415c
func_ov078_0221415c:
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
.size func_ov078_0221415c, . - func_ov078_0221415c
