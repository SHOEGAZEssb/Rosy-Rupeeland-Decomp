.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern TrackedResourceActorType21_ResetMotionState

.global func_ov092_0221a8ec
func_ov092_0221a8ec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActorType21_ResetMotionState
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x800000
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.size func_ov092_0221a8ec, . - func_ov092_0221a8ec
