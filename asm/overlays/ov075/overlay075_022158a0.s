.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern ActorExtendedType2_IsInteractionEligible

.global func_ov075_022158a0
func_ov075_022158a0:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x2a4]
    cmp r2, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl ActorExtendedType2_IsInteractionEligible
    ldmia sp!, {r3, pc}
.size func_ov075_022158a0, . - func_ov075_022158a0
