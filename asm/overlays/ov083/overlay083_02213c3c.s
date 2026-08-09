.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern func_02044098

.global func_ov083_02213c3c
func_ov083_02213c3c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02044098
    add r0, r4, #0x200
    mov r1, #0x20
    strh r1, [r0, #0xb2]
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.size func_ov083_02213c3c, . - func_ov083_02213c3c
