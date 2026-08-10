.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern TrackedResourceActorImpulse_Update

.global func_ov095_0221c8dc
func_ov095_0221c8dc:
    ldr ip, .L_0221c8e4
    bx ip
.L_0221c8e4: .word TrackedResourceActorImpulse_Update
.size func_ov095_0221c8dc, . - func_ov095_0221c8dc
