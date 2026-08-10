.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern GameWork_ClearFlag
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov088_0221b9fc
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern func_02005058
.extern func_020050a4
.extern GamePhaseRuntime_GetActorCollection
.extern func_02034a60
.extern Actor_ReplaceAttachmentSlotResource
.extern func_020593dc
.extern func_0205940c
.extern func_ov062_0220fe78
.extern func_ov088_02218280
.extern func_ov088_0221a930
.extern func_ov088_0221a98c
.extern func_ov088_0221ad9c
.extern gGameWork
.extern gHeapContext
.extern gSoundContext

.global func_ov088_0221a298
func_ov088_0221a298:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x1c
    mov r10, r0
    add r0, r10, #0x200
    ldrsh r2, [r0, #0x30]
    mov r5, r1
    cmp r2, #0x1
    bne .L_0221a514
    mov r1, #0x0
    str r1, [r10, #0x208]
    strh r1, [r0, #0x14]
    ldrh r0, [r0, #0x1a]
    tst r0, #0x1
    movne r1, #0x1
    cmp r1, #0x0
    bne .L_0221a2f8
    mov r0, r10
    bl func_ov088_0221a930
    mov r1, #0x1
    mov r0, r10
    strh r1, [r10, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
.L_0221a2f8:
    ldr r1, [r10, #0x238]
    ldr r0, .L_0221a564
    ldrh r2, [r1, #0x24]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    cmp r2, #0x0
    ldr r4, [r0, #0xea4]
    beq .L_0221a340
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_0221a568
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r10
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl func_020593dc
.L_0221a340:
    ldr r0, [r10, #0x238]
    ldrh r2, [r0, #0x26]
    cmp r2, #0x0
    beq .L_0221a364
    ldr r0, .L_0221a568
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl func_0205940c
.L_0221a364:
    ldr r0, .L_0221a568
    ldr r1, .L_0221a56c
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_0205940c
    ldr r1, .L_0221a570
    mov r0, r10
    mov r2, #0x0
    bl func_02034a60
    bl OverlayManager_GetGlobal
    ldr r2, .L_0221a574
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    add r0, sp, #0xc
    mov r1, r10
    bl func_ov088_0221a98c
    add r0, r4, #0x18
    add r1, sp, #0xc
    bl func_020050a4
    add r0, sp, #0xc
    bl func_02005058
    ldr r1, .L_0221a578
    ldr r3, .L_0221a57c
    mov r0, #0x48
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221a3f4
    mov r6, #0x0
    str r6, [sp, #0x0]
    str r6, [sp, #0x4]
    mov r1, r5
    mov r2, #0x20
    mov r3, #0x14
    str r6, [sp, #0x8]
    bl func_ov062_0220fe78
.L_0221a3f4:
    ldr r1, [r10, #0xd0]
    ldr r0, .L_0221a580
    bic r1, r1, #0x100000
    str r1, [r10, #0xd0]
    ldr r0, [r0, #0x0]
    ldr r1, .L_0221a584
    bl GameWork_ClearFlag
    ldr r5, .L_0221a588
    mov r2, #0x1000
    mov r0, r4
    add r3, r2, #0x1
    mov r1, #0x0
    str r5, [sp, #0x0]
    bl Actor_ReplaceAttachmentSlotResource
    add r2, r5, #0x14
    mov r1, #0x1
    str r2, [sp, #0x0]
    mov r0, r4
    sub r2, r2, #0x1
    add r3, r1, #0x1000
    bl Actor_ReplaceAttachmentSlotResource
    ldr r1, [r4, #0x230]
    mov r0, r10
    bic r1, r1, #0x20000
    str r1, [r4, #0x230]
    ldr r2, [r4, #0x14]
    mov r1, #0x0
    orr r2, r2, #0x100000
    bic r2, r2, #0x2
    str r2, [r4, #0x14]
    bl func_ov088_0221ad9c
    ldr r0, [r10, #0x238]
    ldrh r0, [r0, #0x2e]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_0221a514
    mov r9, #0x0
    mov r7, #0x1
    mov r6, r9
    mov r11, r9
    mvn r5, #0x0
    mov r8, r7
    ldr r4, .L_0221a564
    b .L_0221a4f8
.L_0221a4a4:
    ldr r0, [r4, #0x0]
    mov r1, r8
    bl GamePhaseRuntime_GetActorCollection
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_0221a4f4
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x3
    moveq r1, r7
    movne r1, r6
    cmp r1, #0x0
    beq .L_0221a4f4
    ldrh r1, [r0, #0x4e]
    cmp r1, #0x6
    bne .L_0221a4f4
    ldr r3, [r0, #0x0]
    mov r1, r11
    ldr r3, [r3, #0xd0]
    mov r2, r5
    blx r3
.L_0221a4f4:
    add r9, r9, #0x1
.L_0221a4f8:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_0221a4a4
.L_0221a514:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r10, #0x38
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r10, #0x88
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r10, #0x98
    bl func_ov088_02218280
    add r0, r10, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x30]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221a564: .word data_021052fc
.L_0221a568: .word gSoundContext
.L_0221a56c: .word 0x1fb
.L_0221a570: .word 0xfd86
.L_0221a574: .word 0x3e
.L_0221a578: .word data_ov088_0221b9fc
.L_0221a57c: .word gHeapContext
.L_0221a580: .word gGameWork
.L_0221a584: .word 0x402
.L_0221a588: .word 0x1002
.size func_ov088_0221a298, . - func_ov088_0221a298
