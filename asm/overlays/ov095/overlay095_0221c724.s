.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221d2e8
.extern TrackedResourceActorImpulse_InitBase

.global func_ov095_0221c724
func_ov095_0221c724:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActorImpulse_InitBase
    ldr r0, .L_0221c748
    mov r1, #0x0
    str r0, [r4, #0x0]
    mov r0, r4
    strb r1, [r4, #0x201]
    ldmia sp!, {r4, pc}
.L_0221c748: .word data_ov095_0221d2e8
.size func_ov095_0221c724, . - func_ov095_0221c724
