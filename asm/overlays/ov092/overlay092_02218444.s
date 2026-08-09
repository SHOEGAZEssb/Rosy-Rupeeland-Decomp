.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_020afce8

.global func_ov092_02218444
func_ov092_02218444:
    stmdb sp!, {r4, lr}
    ldrb r1, [r0, #0x1ec]
    cmp r1, #0x5
    add r1, r0, #0x200
    ldreqsh r2, [r1, #0xa2]
    subeq r2, r2, #0x20
    ldrnesh r2, [r1, #0xa2]
    addne r2, r2, #0x20
    strh r2, [r1, #0xa2]
    add r1, r0, #0x200
    ldrsh r2, [r1, #0xa2]
    cmp r2, #0x0
    movgt r2, #0x0
    bgt .L_0221848c
    mov r1, #0x300
    rsb r1, r1, #0x0
    cmp r2, r1
    movlt r2, r1
.L_0221848c:
    add r1, r0, #0x200
    ldr r0, .L_022184c8
    strh r2, [r1, #0xa2]
    mov r2, #0x0
    strh r2, [r0, #0x0]
    ldrsh r2, [r1, #0xa2]
    mov r1, #0xe
    mov r4, r2, asr #0x8
    mov r2, r4
    bl func_020afce8
    ldr r0, .L_022184cc
    mov r2, r4
    mov r1, #0xe
    bl func_020afce8
    ldmia sp!, {r4, pc}
.L_022184c8: .word 0x4000050
.L_022184cc: .word 0x4001050
.size func_ov092_02218444, . - func_ov092_02218444
