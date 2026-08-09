.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern Heap_Alloc
.extern data_ov089_022199f4
.extern func_02005580
.extern func_02073fc4
.extern gHeapContext

.global func_ov089_02217b04
func_ov089_02217b04:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r5, r3
    mov r4, r0
    mov r6, r2
    ldr r1, .L_02217b8c
    ldr r3, .L_02217b90
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217b44
    mov r1, r7
    mov r2, r6
    mov r3, r5
    bl func_02005580
.L_02217b44:
    ldrb r1, [sp, #0x1c]
    str r0, [r4, #0x0]
    mov r3, r0
    str r1, [sp, #0x0]
    ldmib r3, {r1, r2, r3}
    ldr r0, [sp, #0x18]
    bl func_02073fc4
    str r0, [r4, #0x4]
    mov r0, #0x1
    str r0, [r4, #0x14]
    mov r0, #0x0
    strh r0, [r4, #0x18]
    strb r0, [r4, #0x1a]
    ldr r1, [r4, #0x4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02217b8c: .word data_ov089_022199f4
.L_02217b90: .word gHeapContext
.size func_ov089_02217b04, . - func_ov089_02217b04
