.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern TrackedResourceActorImpulse_QueueRemovalAndEmitEffects

.global func_ov095_0221c338
func_ov095_0221c338:
    ldr ip, .L_0221c340
    bx ip
.L_0221c340: .word TrackedResourceActorImpulse_QueueRemovalAndEmitEffects
.size func_ov095_0221c338, . - func_ov095_0221c338
