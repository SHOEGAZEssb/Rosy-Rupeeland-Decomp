.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_ov076_02213a3c

.global func_ov095_022180f0
func_ov095_022180f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov076_02213a3c
    add r0, r4, #0x200
    mov r2, #0x0
    strh r2, [r0, #0xd6]
    strh r2, [r0, #0xd8]
    mov r1, #0x78
    strh r1, [r0, #0xda]
    strh r2, [r0, #0x9c]
    mov r1, #0x3c
    strh r1, [r0, #0x56]
    ldmia sp!, {r4, pc}
.size func_ov095_022180f0, . - func_ov095_022180f0
