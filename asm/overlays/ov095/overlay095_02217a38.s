.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern Heap_Alloc
.extern data_ov095_0221ceb0
.extern func_02005580
.extern func_02030acc
.extern func_020337d4
.extern func_0203e56c
.extern func_020740c8
.extern gHeapContext

.global func_ov095_02217a38
func_ov095_02217a38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_0203e56c
    ldr r1, .L_02217a9c
    ldr r3, .L_02217aa0
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217a70
    ldr r2, .L_02217aa4
    ldr r1, .L_02217aa8
    add r3, r2, #0x388
    bl func_02005580
.L_02217a70:
    mov r4, r0
    str r0, [r5, #0x320]
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldr r1, [r4, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0xa8]
    ldmib r4, {r2, r3}
    bl func_020740c8
    ldmia sp!, {r3, r4, r5, pc}
.L_02217a9c: .word data_ov095_0221ceb0
.L_02217aa0: .word gHeapContext
.L_02217aa4: .word 0x1001
.L_02217aa8: .word 0x1388
.size func_ov095_02217a38, . - func_ov095_02217a38
