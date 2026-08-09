.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern func_02005058
.extern func_0200634c
.extern func_ov084_02212cbc
.extern func_ov084_02212d28

.global func_ov084_02212c28
func_ov084_02212c28:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    add r1, r4, #0x200
    mov r2, #0x0
    strh r2, [r1, #0x9c]
    strh r2, [r1, #0x9e]
    add r0, sp, #0x10
    add r1, r4, #0x18
    mov r2, #0x800
    bl func_ov084_02212cbc
    ldr r1, [r4, #0x228]
    add r0, sp, #0x0
    add r1, r1, #0x18
    mov r2, #0x800
    bl func_ov084_02212cbc
    add r0, sp, #0x20
    add r1, sp, #0x10
    add r2, sp, #0x0
    bl func_ov084_02212d28
    add r0, sp, #0x0
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
    ldr r2, [r4, #0x228]
    ldr r0, [r4, #0x2a4]
    add r1, r4, #0x18
    add r3, sp, #0x20
    add r2, r2, #0x18
    bl func_0200634c
    ldr r1, [r4, #0x14]
    add r0, sp, #0x20
    orr r1, r1, #0x6
    str r1, [r4, #0x14]
    bl func_02005058
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
.size func_ov084_02212c28, . - func_ov084_02212c28
