.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern Sound_Play
.extern data_ov079_02213b08
.extern data_ov079_02213b38
.extern func_0204cfa4
.extern func_020adc90
.extern gSoundContext

.global func_ov079_02213064
func_ov079_02213064:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, .L_02213170
    mov r4, r0
    ldr r3, [r4, #0x218]
    ldr r0, [r2, #0x30]
    mov r5, #0x1
    cmp r3, r0
    ldr r0, .L_02213174
    bne .L_0221309c
    ldr r2, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r2, r0
    cmpne r3, #0x0
    moveq r5, #0x0
.L_0221309c:
    cmp r5, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x260]
    orr r0, r0, #0x10
    str r0, [r4, #0x260]
    ldr r3, [r1, #0x1c]
    ldr r2, [r4, #0x1c]
    ldr r1, [r1, #0x20]
    ldr r0, [r4, #0x20]
    sub r5, r3, r2
    sub r7, r1, r0
    mov r0, r5
    mov r1, r7
    bl func_0204cfa4
    mov r6, r0
    cmp r6, #0x1000
    ble .L_02213134
    mov r0, r5
    mov r1, r6
    bl func_020adc90
    mov r5, r0
    mov r0, r7
    mov r1, r6
    bl func_020adc90
    ldr r1, [r4, #0x8c]
    sub r1, r1, r5
    str r1, [r4, #0x8c]
    ldr r1, [r4, #0x90]
    sub r0, r1, r0
    str r0, [r4, #0x90]
    ldr r0, [r4, #0x10]
    tst r0, #0x4
    beq .L_02213134
    ldr r0, .L_02213178
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl Sound_Play
.L_02213134:
    ldr r0, .L_02213178
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl Sound_Play
    ldr r0, .L_02213170
    ldr r2, [r0, #0x20]
    ldr r1, [r0, #0x24]
    str r2, [r4, #0x298]
    str r1, [r4, #0x29c]
    ldr r1, [r0, #0x18]
    ldr r0, [r0, #0x1c]
    str r1, [r4, #0x220]
    str r0, [r4, #0x224]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02213170: .word data_ov079_02213b08
.L_02213174: .word data_ov079_02213b38
.L_02213178: .word gSoundContext
.size func_ov079_02213064, . - func_ov079_02213064
