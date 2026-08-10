.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern ActorExtendedTransform_UpdateTargetMotion

.global func_ov096_0221865c
func_ov096_0221865c:
    ldr ip, .L_02218664
    bx ip
.L_02218664: .word ActorExtendedTransform_UpdateTargetMotion
.size func_ov096_0221865c, . - func_ov096_0221865c
