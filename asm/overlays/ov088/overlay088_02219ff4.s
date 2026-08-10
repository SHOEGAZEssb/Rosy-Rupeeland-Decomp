.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern GameWork_SetFlag
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov088_0221b9fc
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Object_Destroy
.extern GamePhaseRuntime_GetActorCollection
.extern func_02034a60
.extern func_ov062_0220fe78
.extern func_ov088_02218280
.extern func_ov088_0221a98c
.extern gGameWork
.extern gHeapContext

.global func_ov088_02219ff4
func_ov088_02219ff4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r10, r0
    add r3, r10, #0x200
    ldrsh r2, [r3, #0x30]
    mov r5, r1
    cmp r2, #0x0
    bne .L_0221a260
    ldrh r4, [r3, #0x1a]
    ldr r1, .L_0221a27c
    mov r2, #0x0
    orr r4, r4, #0x2
    strh r4, [r3, #0x1a]
    bl func_02034a60
    ldr r0, .L_0221a280
    cmp r5, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    ble .L_0221a120
    bl OverlayManager_GetGlobal
    ldr r2, .L_0221a284
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, .L_0221a288
    ldr r3, .L_0221a28c
    mov r0, #0x48
    mov r2, #0x4
    mov r7, #0x0
    bl Heap_Alloc
    movs r6, r0
    beq .L_0221a0a8
    add r0, sp, #0xc
    mov r1, r10
    bl func_ov088_0221a98c
    mov r0, r7
    str r0, [sp, #0x0]
    add r1, sp, #0xc
    mov r0, r6
    mov r3, r5
    str r4, [sp, #0x4]
    mov r7, #0x1
    mov r2, #0x20
    str r7, [sp, #0x8]
    bl func_ov062_0220fe78
.L_0221a0a8:
    cmp r7, #0x0
    beq .L_0221a0b8
    add r0, sp, #0xc
    bl VecFx32Object_Destroy
.L_0221a0b8:
    add r0, r10, #0x200
    ldrh r3, [r0, #0x1a]
    mov r1, #0x0
    mov r2, r1
    orr r3, r3, #0x80
    strh r3, [r0, #0x1a]
    ldr r0, [r4, #0x230]
    mov r3, r1
    bic r5, r0, #0x4
    add r0, r4, #0x38
    str r5, [r4, #0x230]
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
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x2
    str r0, [r4, #0x14]
    b .L_0221a174
.L_0221a120:
    ldr r0, [r4, #0x230]
    mov r1, #0x0
    bic r5, r0, #0x4
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    str r5, [r4, #0x230]
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
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x2
    str r0, [r4, #0x14]
.L_0221a174:
    ldr r1, [r10, #0xd0]
    ldr r0, .L_0221a290
    orr r1, r1, #0x100000
    str r1, [r10, #0xd0]
    ldr r2, [r4, #0x230]
    ldr r1, .L_0221a294
    orr r2, r2, #0x100
    orr r2, r2, #0x20000
    str r2, [r4, #0x230]
    ldr r2, [r4, #0x14]
    bic r2, r2, #0x100000
    str r2, [r4, #0x14]
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    add r0, r10, #0x200
    ldrh r1, [r0, #0x1a]
    bic r1, r1, #0x1000
    strh r1, [r0, #0x1a]
    ldr r0, [r10, #0x238]
    ldrh r0, [r0, #0x2e]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_0221a260
    mov r7, #0x1
    mov r9, #0x0
    mov r6, r9
    mvn r5, #0x0
    mov r8, r7
    mov r11, r7
    ldr r4, .L_0221a280
    b .L_0221a244
.L_0221a1f0:
    ldr r0, [r4, #0x0]
    mov r1, r8
    bl GamePhaseRuntime_GetActorCollection
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_0221a240
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x3
    moveq r1, r7
    movne r1, r6
    cmp r1, #0x0
    beq .L_0221a240
    ldrh r1, [r0, #0x4e]
    cmp r1, #0x6
    bne .L_0221a240
    ldr r3, [r0, #0x0]
    mov r1, r10
    ldr r3, [r3, #0xd0]
    mov r2, r5
    blx r3
.L_0221a240:
    add r9, r9, #0x1
.L_0221a244:
    ldr r0, [r4, #0x0]
    mov r1, r11
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_0221a1f0
.L_0221a260:
    add r0, r10, #0x200
    mov r1, #0x1
    strh r1, [r0, #0x30]
    mov r1, #0xc
    strh r1, [r0, #0x32]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221a27c: .word 0xfd86
.L_0221a280: .word data_021052fc
.L_0221a284: .word 0x3e
.L_0221a288: .word data_ov088_0221b9fc
.L_0221a28c: .word gHeapContext
.L_0221a290: .word gGameWork
.L_0221a294: .word 0x402
.size func_ov088_02219ff4, . - func_ov088_02219ff4
