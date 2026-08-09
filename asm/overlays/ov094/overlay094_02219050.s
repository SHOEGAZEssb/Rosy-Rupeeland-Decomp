.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern data_ov094_02219bd8
.extern data_ov094_02219f14
.extern func_02073ffc
.extern func_020740a4
.extern func_02091b98
.extern func_02091c7c
.extern func_02095274
.extern func_02095360
.extern func_ov094_02218a2c
.extern gGameWork
.extern gHeapContext

.global func_ov094_02219050
func_ov094_02219050:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r1, [r6, #0x0]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_022191c8
.L_02219068:
    b .L_02219080
    b .L_022190a4
    b .L_02219164
    b .L_02219194
    b .L_022191a8
    b .L_022191c0
.L_02219080:
    ldr r0, .L_022191e8
    ldr r1, .L_022191ec
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r0, [r6, #0x0]
    addne r0, r0, #0x1
    strne r0, [r6, #0x0]
    b .L_022191c8
.L_022190a4:
    add r0, r6, #0x30
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq .L_022191c8
    ldr r0, [r6, #0x24]
    cmp r0, #0xa
    bge .L_02219154
    ldr r0, [r6, #0x10]
    add r1, r6, #0x4
    mov r2, #0x1
    bl func_02073ffc
    mov r5, r0
    ldr r0, [r6, #0x14]
    add r1, r6, #0x4
    mov r2, #0x1
    bl func_02073ffc
    ldrh r2, [r5, #0x24]
    mov r4, r0
    ldr r1, .L_022191f0
    orr r0, r2, #0x2
    strh r0, [r5, #0x24]
    ldrh r2, [r4, #0x24]
    ldr r3, .L_022191f4
    mov r0, #0xc0
    orr r2, r2, #0x2
    strh r2, [r4, #0x24]
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0221913c
    ldr r3, [r6, #0x24]
    ldr ip, .L_022191f8
    mov r1, r5
    mov r2, r4
    add r3, ip, r3, lsl #0x3
    bl func_ov094_02218a2c
    mov r1, r0
.L_0221913c:
    add r0, r6, #0x18
    bl func_02095274
    add r0, r6, #0x30
    mov r1, #0x6
    bl func_02091b98
    b .L_022191c8
.L_02219154:
    ldr r0, [r6, #0x0]
    add r0, r0, #0x1
    str r0, [r6, #0x0]
    b .L_022191c8
.L_02219164:
    ldr r0, [r6, #0x20]
    ldrh r0, [r0, #0x98]
    tst r0, #0x1
    beq .L_022191c8
    ldr r0, .L_022191e8
    ldr r1, .L_022191ec
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, [r6, #0x0]
    add r0, r0, #0x1
    str r0, [r6, #0x0]
    b .L_022191c8
.L_02219194:
    ldr r0, [r6, #0x24]
    cmp r0, #0x0
    addeq r0, r1, #0x1
    streq r0, [r6, #0x0]
    b .L_022191c8
.L_022191a8:
    ldr r0, [r6, #0x10]
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    addeq r0, r1, #0x1
    streq r0, [r6, #0x0]
    b .L_022191c8
.L_022191c0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_022191c8:
    add r0, r6, #0x18
    bl func_02095360
    ldr r0, [r6, #0x10]
    bl func_020740a4
    ldr r0, [r6, #0x14]
    bl func_020740a4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_022191e8: .word gGameWork
.L_022191ec: .word 0x3d3
.L_022191f0: .word data_ov094_02219f14
.L_022191f4: .word gHeapContext
.L_022191f8: .word data_ov094_02219bd8
.size func_ov094_02219050, . - func_ov094_02219050
