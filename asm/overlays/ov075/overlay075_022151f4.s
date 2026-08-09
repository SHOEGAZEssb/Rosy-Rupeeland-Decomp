.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_020425d4
.extern func_ov075_02215910

.global func_ov075_022151f4
func_ov075_022151f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020425d4
    ldr r0, [r4, #0x1fc]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov075_02215910
    ldmia sp!, {r4, pc}
.size func_ov075_022151f4, . - func_ov075_022151f4
