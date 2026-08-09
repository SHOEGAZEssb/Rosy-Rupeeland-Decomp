.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern Heap_Free
.extern data_ov077_022172f4
.extern func_ov077_02212cb8

.global func_ov077_02213408
func_ov077_02213408:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0221348c
    mov r5, r0
    str r1, [r5, #0x0]
    mov r4, #0x0
.L_0221341c:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x2d4]
    cmp r0, #0x0
    beq .L_02213438
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02213438:
    add r4, r4, #0x1
    cmp r4, #0x3
    blt .L_0221341c
    ldr r0, [r5, #0x2e0]
    cmp r0, #0x0
    beq .L_0221345c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221345c:
    ldr r0, [r5, #0x2c4]
    cmp r0, #0x0
    beq .L_02213474
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02213474:
    mov r0, r5
    bl func_ov077_02212cb8
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0221348c: .word data_ov077_022172f4
.size func_ov077_02213408, . - func_ov077_02213408
