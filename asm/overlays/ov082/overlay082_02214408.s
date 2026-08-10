.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern ActorCollection_FindActorByDescriptorValue
.extern func_020337d4

.global func_ov082_02214408
func_ov082_02214408:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    movmi r0, #0x0
    bmi .L_02214428
    bl func_020337d4
    mov r1, r4
    bl ActorCollection_FindActorByDescriptorValue
.L_02214428:
    str r0, [r5, #0x298]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov082_02214408, . - func_ov082_02214408
