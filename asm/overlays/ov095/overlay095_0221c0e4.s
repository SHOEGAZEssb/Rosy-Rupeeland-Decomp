.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221d1a4
.extern TrackedResourceActorImpulse_Destroy
.extern func_0205940c
.extern gSoundContext

.global func_ov095_0221c0e4
func_ov095_0221c0e4:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221c128
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x1fc]
    ldrh r2, [r0, #0x1e]
    cmp r2, #0x0
    beq .L_0221c118
    ldr r0, .L_0221c12c
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl func_0205940c
.L_0221c118:
    mov r0, r4
    bl TrackedResourceActorImpulse_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221c128: .word data_ov095_0221d1a4
.L_0221c12c: .word gSoundContext
.size func_ov095_0221c0e4, . - func_ov095_0221c0e4
