.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern func_02004fe0

.global func_ov073_022102bc
func_ov073_022102bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10
    bl func_02004fe0
    add r0, r4, #0x20
    bl func_02004fe0
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov073_022102bc, . - func_ov073_022102bc
