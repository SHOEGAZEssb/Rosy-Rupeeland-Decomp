.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern Heap_Free
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern data_ov062_02211ba4
.extern func_02002290
.extern func_020022dc
.extern func_020050a4
.extern func_0200637c

.global func_ov062_02210914
func_ov062_02210914:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_022109d0
    mov r4, r0
    str r1, [r4, #0x0]
    bl Scene_ClearFlags03
    ldr r0, [r4, #0x24]
    ldr r1, [r4, #0x28]
    add r0, r0, #0x18
    add r1, r1, #0x10
    bl func_020050a4
    ldr r1, [r4, #0x24]
    add r0, r1, #0x28
    add r1, r1, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    ldrne r0, [r4, #0x24]
    ldrne r1, [r0, #0x54]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq .L_02210990
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
.L_02210990:
    ldr r5, [r4, #0x28]
    cmp r5, #0x0
    beq .L_022109ac
    mov r0, r5
    bl func_0200637c
    mov r0, r5
    bl Heap_Free
.L_022109ac:
    bl func_020022dc
    mov r1, #0x2
    bl func_02002290
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_022109d0: .word data_ov062_02211ba4
.size func_ov062_02210914, . - func_ov062_02210914
