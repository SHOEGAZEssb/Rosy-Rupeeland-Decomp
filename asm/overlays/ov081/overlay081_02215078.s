.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_02215078
func_ov081_02215078:
    stmdb sp!, {r3, lr}
    mov r2, #0x2000
    str r2, [r0, #0xcc]
    str r2, [r0, #0xc8]
    mov r1, #0x1
    strb r1, [r0, #0xd5]
    strb r1, [r0, #0xd4]
    add r1, r0, #0x100
    mov r2, #0x0
    strh r2, [r1, #0xea]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x120]
    blx r1
    ldmia sp!, {r3, pc}
.size func_ov081_02215078, . - func_ov081_02215078
