.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern Heap_Free
.extern VecFx32Object_Destroy
.extern ActorDerivedRuntime_DestroyAlternate
.extern Type7MarkerPresentation_Destroy

.global func_ov085_02212c2c
func_ov085_02212c2c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x23c
    bl Type7MarkerPresentation_Destroy
    add r0, r4, #0x214
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov085_02212c2c, . - func_ov085_02212c2c
