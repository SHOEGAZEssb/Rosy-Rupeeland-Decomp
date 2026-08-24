.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern data_021052fc
.extern GamePhaseRuntime_PrepareActorCollections
.extern GamePhaseRuntime_FinalizeActorCollections
.extern GamePhaseRuntime_SynchronizeActorPlacement
.extern GamePhaseCurrencyHud_Update
.extern RuntimePresentationManager_UpdatePresentations
.extern func_020a681c
.extern func_020a6990
.extern func_ov063_02210414
.extern gGamePhaseCurrencyHud

.global func_ov063_0220ffd0
func_ov063_0220ffd0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd0]
    blx r1
    movs r1, r0
    beq .L_02210018
    mov r0, r4
    bl func_ov063_02210414
    cmp r4, #0x0
    beq .L_02210010
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210010:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02210018:
    ldr r2, [r4, #0x50]
    ldr r0, .L_022101b8
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x12
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x12
    orr r0, r2, r0, lsr #0x2
    str r0, [r4, #0x50]
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd8]
    blx r1
    cmp r0, #0x0
    beq .L_0221006c
    ldr r0, .L_022101bc
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    b .L_02210138
.L_0221006c:
    ldrb r0, [r4, #0x54]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_02210090
    ldr r0, [r4, #0x50]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x12
    tst r0, #0x1
    beq .L_02210104
.L_02210090:
    ldr r0, .L_022101bc
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl GamePhaseRuntime_PrepareActorCollections
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xdc]
    blx r1
    ldr r0, .L_022101bc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r0, .L_022101bc
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r0, .L_022101bc
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_UpdatePresentations
    ldr r0, .L_022101bc
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl GamePhaseRuntime_FinalizeActorCollections
    b .L_02210114
.L_02210104:
    ldr r0, [r4, #0x4c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe0]
    blx r1
.L_02210114:
    ldr r0, .L_022101c0
    ldr r0, [r0, #0x0]
    ldrh r1, [r0, #0xb0]
    tst r1, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02210138
    bl GamePhaseCurrencyHud_Update
.L_02210138:
    ldr r0, [r4, #0x50]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_02210178
    add r0, r4, #0x28
    mov r1, #0x0
    mov r2, #0x6
    bl func_020a6990
    ldrb r1, [r4, #0x54]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    and r0, r0, #0x1
    bic r1, r1, #0x1
    orr r0, r1, r0
    strb r0, [r4, #0x54]
.L_02210178:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_022101b0
    bl func_020a681c
    ldr r1, [r4, #0x24]
    ldr r0, [r1, #0x8]
    cmp r0, #0x1
    moveq r0, #0x0
    streq r0, [r1, #0x8]
    ldr r1, [r4, #0x24]
    ldr r0, [r1, #0x8]
    cmp r0, #0x2
    moveq r0, #0x0
    streq r0, [r1, #0x8]
.L_022101b0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_022101b8: .word 0xc000ffff
.L_022101bc: .word data_021052fc
.L_022101c0: .word gGamePhaseCurrencyHud
.size func_ov063_0220ffd0, . - func_ov063_0220ffd0
