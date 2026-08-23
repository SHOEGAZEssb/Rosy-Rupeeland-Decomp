.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern Actor_TurnTowardVector
.extern TrackedResourceActorImpulse_SetupFromRecord

.global func_ov095_0221c77c
func_ov095_0221c77c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActorImpulse_SetupFromRecord
    ldr r1, [r4, #0x3c]
    ldr r2, [r4, #0x40]
    mov r0, r4
    mov r3, #0x8000
    bl Actor_TurnTowardVector
    ldr r0, [r4, #0x10]
    mvn r1, #0xf
    orr r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    ldr r2, [r4, #0xd0]
    sub r0, r1, #0x8
    bic r2, r2, #0x2000
    str r2, [r4, #0xd0]
    strh r1, [r4, #0x60]
    strh r0, [r4, #0x62]
    mov r0, #0x10
    strh r0, [r4, #0x64]
    strh r0, [r4, #0x66]
    ldmia sp!, {r4, pc}
.size func_ov095_0221c77c, . - func_ov095_0221c77c
