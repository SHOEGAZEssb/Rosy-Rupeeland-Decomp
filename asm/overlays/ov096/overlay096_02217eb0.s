.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern ActorExtendedType2_UpdatePresentationForState

.global func_ov096_02217eb0
func_ov096_02217eb0:
    stmdb sp!, {r3, lr}
    ldrb r1, [r0, #0x29b]
    tst r1, #0x1
    ldmneia sp!, {r3, pc}
    bl ActorExtendedType2_UpdatePresentationForState
    ldmia sp!, {r3, pc}
.size func_ov096_02217eb0, . - func_ov096_02217eb0
