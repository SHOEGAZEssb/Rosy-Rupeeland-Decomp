.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern func_02030acc
.extern func_020337d4
.extern func_0203e56c
.extern func_02072b68
.extern func_02073fc4

.global func_ov076_022138e8
func_ov076_022138e8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_0203e56c
    ldr r3, [r4, #0x54]
    mvn r0, #0x0
    ldrh r2, [r3, #0x24]
    mov r1, #0x0
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    strh r0, [r4, #0xda]
    ldr r0, [r4, #0x54]
    bl func_02072b68
    mov r0, r4
    ldr r5, [r4, #0x20c]
    bl func_020337d4
    bl func_02030acc
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r5, {r1, r2, r3}
    bl func_02073fc4
    str r0, [r4, #0x2a0]
    mov r1, #0x0
    bl func_02072b68
    ldr r5, [r4, #0x210]
    mov r0, r4
    bl func_020337d4
    bl func_02030acc
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r5, {r1, r2, r3}
    bl func_02073fc4
    mov r1, #0x1
    str r0, [r4, #0x2a4]
    bl func_02072b68
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov076_022138e8, . - func_ov076_022138e8
