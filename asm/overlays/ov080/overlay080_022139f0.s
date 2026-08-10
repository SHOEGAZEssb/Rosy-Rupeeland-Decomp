.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern Actor_RestoreSavedFlags
.extern func_ov080_022136f4

.global func_ov080_022139f0
func_ov080_022139f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_RestoreSavedFlags
    mov r0, r4
    mov r1, #0x1
    bl func_ov080_022136f4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    add r0, r4, #0x200
    mov r1, #0xc
    strh r1, [r0, #0x54]
    ldr r1, [r4, #0xd0]
    mov r0, #0x2
    bic r1, r1, #0x200
    str r1, [r4, #0xd0]
    strh r0, [r4, #0xd6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov080_022139f0, . - func_ov080_022139f0
