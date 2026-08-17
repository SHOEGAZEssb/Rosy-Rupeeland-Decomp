.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern AnimationResourceState_Destroy
.extern func_ov059_02210114

.global func_ov059_0220fd64
func_ov059_0220fd64:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov059_02210114
    add r0, r4, #0x44
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov059_0220fd64, . - func_ov059_0220fd64
