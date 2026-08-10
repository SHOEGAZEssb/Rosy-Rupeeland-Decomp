.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221d1a4
.extern TrackedResourceActorImpulse_InitBase

.global func_ov095_0221c0b0
func_ov095_0221c0b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActorImpulse_InitBase
    ldr r0, .L_0221c0e0
    mov r2, #0x0
    str r0, [r4, #0x0]
    strb r2, [r4, #0x200]
    strb r2, [r4, #0x201]
    add r1, r4, #0x200
    mov r0, r4
    strh r2, [r1, #0x2]
    ldmia sp!, {r4, pc}
.L_0221c0e0: .word data_ov095_0221d1a4
.size func_ov095_0221c0b0, . - func_ov095_0221c0b0
