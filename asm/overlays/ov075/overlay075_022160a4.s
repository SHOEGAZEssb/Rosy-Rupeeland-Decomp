.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_02044088
.extern func_ov075_02212f10

.global func_ov075_022160a4
func_ov075_022160a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02044088
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov075_02212f10
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov075_02212f10
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov075_02212f10
    mov r0, #0x2800
    str r0, [r4, #0x44]
    mov r1, #0x0
    strh r1, [r4, #0xda]
    add r0, r4, #0x200
    strh r1, [r0, #0xa4]
    str r1, [r4, #0x2a8]
    ldrh r2, [r0, #0xa2]
    sub r1, r1, #0x10000
    bic r2, r2, #0x1
    strh r2, [r0, #0xa2]
    ldr r0, [r4, #0x5c]
    and r0, r0, r1
    str r0, [r4, #0x5c]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
    ldr r0, [r4, #0x298]
    ldr r0, [r0, #0x8c]
    rsb r0, r0, #0x0
    str r0, [r4, #0x8c]
    ldr r0, [r4, #0x298]
    ldr r0, [r0, #0x90]
    rsb r0, r0, #0x0
    str r0, [r4, #0x90]
    ldmia sp!, {r4, pc}
.size func_ov075_022160a4, . - func_ov075_022160a4
