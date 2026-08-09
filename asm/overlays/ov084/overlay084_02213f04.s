.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern func_0203f2ec
.extern func_02043610

.global func_ov084_02213f04
func_ov084_02213f04:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0203f2ec
    add r0, r5, #0x200
    ldrh r0, [r0, #0x9a]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_02043610
    strh r0, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov084_02213f04, . - func_ov084_02213f04
