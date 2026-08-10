.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern ActorExtendedType2_IsInteractionActive

.global func_ov075_022150f4
func_ov075_022150f4:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x2a4]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl ActorExtendedType2_IsInteractionActive
    ldmia sp!, {r3, pc}
.size func_ov075_022150f4, . - func_ov075_022150f4
