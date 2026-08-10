.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern VecFx32Object_Destroy
.extern ActorDerivedRuntime_DestroyAlternate
.extern Type7MarkerPresentation_Destroy

.global func_ov081_022140a0
func_ov081_022140a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x244
    bl Type7MarkerPresentation_Destroy
    add r0, r4, #0x214
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov081_022140a0, . - func_ov081_022140a0
