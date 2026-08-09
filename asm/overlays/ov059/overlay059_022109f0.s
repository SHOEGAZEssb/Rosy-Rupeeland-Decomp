.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_ov059_02210a2c
.extern func_ov059_02210b24

.global func_ov059_022109f0
func_ov059_022109f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r1, #0x0
    bl func_ov059_02210a2c
    str r4, [r5, #0x8]
    mov r0, #0x0
    str r0, [r5, #0xc]
    str r0, [r5, #0x10]
    ldr r1, [r5, #0x8]
    mov r0, r5
    ldrsh r1, [r1, #0x0]
    bl func_ov059_02210b24
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov059_022109f0, . - func_ov059_022109f0
