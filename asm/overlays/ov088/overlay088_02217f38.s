.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Heap_Alloc
.extern data_020f4e18
.extern data_ov088_0221b9fc
.extern func_02005580
.extern func_02030acc
.extern func_020337d4
.extern func_02071ee0
.extern func_02073fc4
.extern func_ov088_02219960
.extern func_ov088_0221ad9c
.extern gHeapContext

.global func_ov088_02217f38
func_ov088_02217f38:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r3, [r5, #0x238]
    ldr ip, .L_02218120
    ldrh r2, [r3, #0xe]
    mov r4, r1
    add r0, r5, #0x1f0
    str r2, [sp, #0x0]
    ldrh r2, [r3, #0xa]
    ldrh r3, [r3, #0xc]
    ldr r1, [ip, #0x0]
    bl func_02071ee0
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x1f0]
    ldr r2, [r5, #0x1f4]
    ldr r3, [r5, #0x1f8]
    bl func_02073fc4
    str r0, [r5, #0x54]
    mov r0, #0x10
    ldr r1, .L_02218124
    mov r2, #0x4
    ldr r3, .L_02218128
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217fc4
    ldr r3, [r5, #0x238]
    ldrh r1, [r3, #0x4]
    ldrh r2, [r3, #0x6]
    ldrh r3, [r3, #0x8]
    bl func_02005580
.L_02217fc4:
    mov r6, r0
    str r0, [r5, #0x220]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r6, {r1, r2, r3}
    bl func_02073fc4
    mov r2, r0
    str r0, [r5, #0x224]
    ldrh r1, [r2, #0x24]
    mov r0, r5
    orr r1, r1, #0x8
    strh r1, [r2, #0x24]
    ldr r6, [r5, #0x220]
    bl func_020337d4
    bl func_02030acc
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r6, {r1, r2, r3}
    bl func_02073fc4
    str r0, [r5, #0x228]
    mov r2, r0
    ldrh r1, [r2, #0x24]
    mov r0, r5
    orr r1, r1, #0x8
    strh r1, [r2, #0x24]
    ldr r6, [r5, #0x220]
    bl func_020337d4
    bl func_02030acc
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r6, {r1, r2, r3}
    bl func_02073fc4
    str r0, [r5, #0x22c]
    mov r3, r0
    ldrh r2, [r3, #0x24]
    ldr r1, .L_02218124
    mov r0, #0x10
    orr r2, r2, #0x8
    strh r2, [r3, #0x24]
    ldr r3, .L_02218128
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218090
    ldr r1, .L_0221812c
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_02005580
.L_02218090:
    mov r6, r0
    str r0, [r5, #0x254]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r6, {r1, r2, r3}
    bl func_02073fc4
    str r0, [r5, #0x258]
    mov r1, #0xf0
    strh r1, [r0, #0x2c]
    mov r1, #0x18
    strh r1, [r0, #0x2e]
    ldr r0, [r5, #0x258]
    mov r1, #0x0
    strb r1, [r0, #0x3a]
    ldr r0, [r5, #0x258]
    mov r2, #0x1000
    strh r2, [r0, #0x28]
    mov r0, r5
    bl func_ov088_0221ad9c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    ldr r0, [r5, #0x14]
    tst r0, #0x80
    ldrnesh r1, [r4, #0x3c]
    ldrne r0, [r5, #0x54]
    strneb r1, [r0, #0x3a]
    mov r0, r5
    mov r1, #0x0
    bl func_ov088_02219960
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02218120: .word data_020f4e18
.L_02218124: .word data_ov088_0221b9fc
.L_02218128: .word gHeapContext
.L_0221812c: .word 0x32fa
.size func_ov088_02217f38, . - func_ov088_02217f38
