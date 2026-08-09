.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_020050a4
.extern func_020425d4

.global func_ov095_0221b798
func_ov095_0221b798:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020425d4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x40]
    blx r1
    mov r1, r4
    add r0, r5, #0x29c
    bl func_020050a4
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov095_0221b798, . - func_ov095_0221b798
