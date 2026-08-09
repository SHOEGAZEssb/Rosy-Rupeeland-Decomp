.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern func_020befec

.global func_ov069_022124f0
func_ov069_022124f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x48]
    ldr r3, [r1, #0x8]
    ldr r2, [r0, #0x34]
    ldr r1, [r1, #0x4]
    ldr r0, [r0, #0x30]
    sub r4, r3, r2
    sub r0, r1, r0
    mov r1, #0x32
    bl func_020befec
    str r0, [r5, #0x54]
    mov r0, r4
    mov r1, #0x32
    bl func_020befec
    str r0, [r5, #0x58]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov069_022124f0, . - func_ov069_022124f0
