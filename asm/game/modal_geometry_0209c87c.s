.text
; Matching fallback for the portable implementation in src/game/modal_geometry.c.
.extern G3Command_SubmitTexCoord
.extern G3Command_SubmitVertex16

.global func_0209c87c
func_0209c87c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, .L_0209c9cc
    mov lr, #0x0
    str lr, [ip, #0x0]
    ldr r4, [r0, #0x88]
    ldr r5, [r0, #0x8c]
    add r0, r4, #0x80000
    mov r4, r0, lsl #0x4
    add r5, r5, #0x60000
    mov r0, r5, lsl #0x4
    mov r4, r4, asr #0x10
    mov r5, r0, asr #0x10
    rsb r0, r4, #0x0
    str r0, [ip, #0x2c]
    rsb r0, r5, #0x0
    str r0, [ip, #0x2c]
    str lr, [ip, #0x2c]
    mov r0, #0x1
    str r0, [ip, #0xbc]
    mov r4, r2
    str r3, [ip, #0x3c]
    mov r5, r1
    ldmia r4, {r0, r1}
    bl G3Command_SubmitTexCoord
    ldmia r5, {r0, r1}
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    ldrsh r2, [sp, #0x10]
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    bl G3Command_SubmitVertex16
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0x4]
    bl G3Command_SubmitTexCoord
    ldr r0, [r5, #0xc]
    ldr r2, [r5, #0x8]
    mov r1, r0, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    ldr r0, .L_0209c9d0
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x8]
    ldr r1, [r4, #0xc]
    bl G3Command_SubmitTexCoord
    ldr r1, [r5, #0x14]
    ldr r0, [r5, #0x10]
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    ldr r0, .L_0209c9d0
    str r1, [r0, #0x0]
    ldr r0, [r4, #0x0]
    ldr r1, [r4, #0xc]
    bl G3Command_SubmitTexCoord
    ldr r0, [r5, #0x1c]
    ldr r2, [r5, #0x18]
    mov r1, r0, lsl #0x10
    mov r1, r1, asr #0x10
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r2, r1, r0, lsr #0x10
    ldr r1, .L_0209c9d0
    mov r0, #0x0
    str r2, [r1, #0x0]
    str r0, [r1, #0x70]
    mov r0, #0x1
    str r0, [r1, #-0x4c]
    ldmia sp!, {r3, r4, r5, pc}
.L_0209c9cc: .word 0x4000444
.L_0209c9d0: .word 0x4000494
.size func_0209c87c, . - func_0209c87c
