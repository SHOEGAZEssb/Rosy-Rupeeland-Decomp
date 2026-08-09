.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_02034a60
.extern func_ov088_02218280

.global func_ov088_0221a8c4
func_ov088_0221a8c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add ip, r4, #0x200
    ldrh r0, [ip, #0x1a]
    mov r1, #0x0
    mov r2, r1
    orr lr, r0, #0x2000
    mov r3, r1
    add r0, r4, #0x38
    strh lr, [ip, #0x1a]
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov088_02218280
    ldr r1, .L_0221a92c
    mov r0, r4
    mov r2, #0x0
    bl func_02034a60
    ldmia sp!, {r4, pc}
.L_0221a92c: .word 0xfe04
.size func_ov088_0221a8c4, . - func_ov088_0221a8c4
