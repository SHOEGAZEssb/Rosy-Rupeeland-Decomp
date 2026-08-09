.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern func_ov078_02213be0

.global func_ov078_02215a80
func_ov078_02215a80:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov078_02213be0
    mov r1, #0x0
    add r0, r4, #0x200
    strh r1, [r0, #0xb4]
    strh r1, [r0, #0xb0]
    ldmia sp!, {r4, pc}
.size func_ov078_02215a80, . - func_ov078_02215a80
