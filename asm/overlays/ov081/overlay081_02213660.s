.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern VecFx32Object_GetMagnitude

.global func_ov081_02213660
func_ov081_02213660:
    stmdb sp!, {r3, lr}
    add r0, r0, #0x98
    bl VecFx32Object_GetMagnitude
    cmp r0, #0x800
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov081_02213660, . - func_ov081_02213660
