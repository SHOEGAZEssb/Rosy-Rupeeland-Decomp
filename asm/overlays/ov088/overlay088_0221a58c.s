.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern GameWork_ClearFlag
.extern gGamePhaseRuntime
.extern VecFx32Object_Assign
.extern GamePhaseRuntime_GetActorCollection
.extern Actor_PlayRadialSpatialSound
.extern Actor_ReplaceAttachmentSlotResource
.extern Sound_StopEffect
.extern func_ov088_02218280
.extern func_ov088_0221a930
.extern gGameWork
.extern gSoundContext

.global func_ov088_0221a58c
func_ov088_0221a58c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    add r0, r10, #0x200
    ldrsh r1, [r0, #0x30]
    cmp r1, #0x1
    bne .L_0221a75c
    mov r1, #0x0
    str r1, [r10, #0x208]
    strh r1, [r0, #0x14]
    ldrh r0, [r0, #0x1a]
    tst r0, #0x1
    movne r1, #0x1
    cmp r1, #0x0
    bne .L_0221a5e4
    mov r0, r10
    bl func_ov088_0221a930
    mov r1, #0x1
    mov r0, r10
    strh r1, [r10, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
.L_0221a5e4:
    ldr r0, .L_0221a7a8
    add r1, r10, #0x18
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    add r0, r4, #0x18
    bl VecFx32Object_Assign
    ldr r1, [r10, #0xd0]
    ldr r0, .L_0221a7ac
    bic r1, r1, #0x100000
    str r1, [r10, #0xd0]
    ldr r0, [r0, #0x0]
    ldr r1, .L_0221a7b0
    bl GameWork_ClearFlag
    ldr r1, .L_0221a7b4
    mov r2, #0x1000
    str r1, [sp, #0x0]
    mov r0, r4
    add r3, r2, #0x1
    mov r1, #0x0
    bl Actor_ReplaceAttachmentSlotResource
    ldr r1, .L_0221a7b8
    mov r0, r4
    str r1, [sp, #0x0]
    sub r2, r1, #0x1
    mov r1, #0x1
    add r3, r1, #0x1000
    bl Actor_ReplaceAttachmentSlotResource
    ldr r0, [r4, #0x230]
    bic r0, r0, #0x20000
    str r0, [r4, #0x230]
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x100000
    bic r0, r0, #0x2
    str r0, [r4, #0x14]
    ldr r0, [r10, #0x238]
    ldrh r2, [r0, #0x26]
    cmp r2, #0x0
    beq .L_0221a694
    ldr r0, .L_0221a7bc
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_StopEffect
.L_0221a694:
    ldr r0, .L_0221a7bc
    ldr r1, .L_0221a7c0
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl Sound_StopEffect
    ldr r1, .L_0221a7c4
    mov r0, r10
    mov r2, #0x0
    bl Actor_PlayRadialSpatialSound
    ldr r0, [r10, #0x238]
    ldrh r0, [r0, #0x2e]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_0221a75c
    mov r9, #0x0
    mov r7, #0x1
    mov r6, r9
    mov r11, r9
    mvn r5, #0x0
    mov r8, r7
    ldr r4, .L_0221a7a8
    b .L_0221a740
.L_0221a6ec:
    ldr r0, [r4, #0x0]
    mov r1, r8
    bl GamePhaseRuntime_GetActorCollection
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_0221a73c
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x3
    moveq r1, r7
    movne r1, r6
    cmp r1, #0x0
    beq .L_0221a73c
    ldrh r1, [r0, #0x4e]
    cmp r1, #0x6
    bne .L_0221a73c
    ldr r3, [r0, #0x0]
    mov r1, r11
    ldr r3, [r3, #0xd0]
    mov r2, r5
    blx r3
.L_0221a73c:
    add r9, r9, #0x1
.L_0221a740:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_0221a6ec
.L_0221a75c:
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
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221a7a8: .word gGamePhaseRuntime
.L_0221a7ac: .word gGameWork
.L_0221a7b0: .word 0x402
.L_0221a7b4: .word 0x1002
.L_0221a7b8: .word 0x1016
.L_0221a7bc: .word gSoundContext
.L_0221a7c0: .word 0x1fb
.L_0221a7c4: .word 0xfd86
.size func_ov088_0221a58c, . - func_ov088_0221a58c
