.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern data_ov076_02214950
.extern func_02043cd0

.global func_ov076_02212ae0
func_ov076_02212ae0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02043cd0
    ldr r1, .L_02212b5c
    mov r0, #0x3
    str r1, [r4, #0x0]
    strb r0, [r4, #0x29c]
    mov r2, #0x0
    strb r2, [r4, #0x29d]
    add r0, r4, #0x200
    strh r2, [r0, #0x9e]
    strh r2, [r0, #0xa0]
    mov r1, #0x258
    strh r1, [r0, #0xa2]
    strh r2, [r0, #0xa4]
    strh r2, [r0, #0xa6]
    strh r2, [r0, #0xa8]
    mov r2, #0xa
    strh r2, [r0, #0xaa]
    ldr r2, [r4, #0x260]
    mov r1, #0x20
    bic r2, r2, #0x8
    orr r2, r2, #0x220000
    str r2, [r4, #0x260]
    sub r0, r1, #0x80
    strh r1, [r4, #0x64]
    strh r0, [r4, #0x62]
    mov r1, #0x10
    mov r0, r4
    strh r1, [r4, #0x66]
    ldmia sp!, {r4, pc}
.L_02212b5c: .word data_ov076_02214950
.size func_ov076_02212ae0, . - func_ov076_02212ae0
