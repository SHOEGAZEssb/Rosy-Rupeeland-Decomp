.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern ActorCollection_FindActorByDescriptorValue
.extern func_020337d4

.global func_ov077_022130f0
func_ov077_022130f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    bl func_020337d4
    mov r1, r4
    bl ActorCollection_FindActorByDescriptorValue
    str r0, [r5, #0x29c]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov077_022130f0, . - func_ov077_022130f0
