.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern Heap_Free
.extern VecFx32Object_Destroy
.extern ActorDerivedRuntime_DestroyAlternate

.global func_ov081_02212d3c
func_ov081_02212d3c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x214
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov081_02212d3c, . - func_ov081_02212d3c
