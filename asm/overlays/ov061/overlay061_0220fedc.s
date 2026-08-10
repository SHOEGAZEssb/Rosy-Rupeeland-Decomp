.text
; Matching fallback for the portable implementation in src/overlays/ov061/overlay061_recovery.c.
.extern data_020f4dc8
.extern data_020f4e14
.extern data_021052fc
.extern DisplayBrightness_StartTransition
.extern DisplayBrightness_GetCurrent
.extern DisplayBrightnessPair_GetScreen
.extern GamePhaseRuntime_FinalizeActorCollections
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern DebugHudState_PollInput
.extern DebugHudState_GetGlobal
.extern func_020755bc
.extern func_ov061_022100e4
.extern func_ov061_022101dc
.extern gDebugFont

.global func_ov061_0220fedc
func_ov061_0220fedc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r1, .L_0221008c
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r4, #0x4]
    mov r2, #0x3
    bl GamePhaseRuntime_FinalizeActorCollections
    ldr r0, [r4, #0x8]
    cmp r0, #0xe
    addls pc, pc, r0, lsl #0x2
    b .L_02210070
.L_0220ff0c:
    b .L_0220ff48
    b .L_0220ff84
    b .L_0220ff84
    b .L_0220ff84
    b .L_0220ff84
    b .L_0220ff84
    b .L_0220ff94
    b .L_0220ffc4
    b .L_02210038
    b .L_02210040
    b .L_02210040
    b .L_02210040
    b .L_02210040
    b .L_02210040
    b .L_02210050
.L_0220ff48:
    ldr r1, [r4, #0x28]
    ldr r0, .L_02210090
    bl DisplayBrightnessPair_GetScreen
    bl DisplayBrightness_GetCurrent
    mov r5, r0
    ldr r1, [r4, #0x28]
    ldr r0, .L_02210090
    bl DisplayBrightnessPair_GetScreen
    mov r1, r5
    mov r2, #0x10
    mov r3, #0x5
    bl DisplayBrightness_StartTransition
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
.L_0220ff84:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_02210070
.L_0220ff94:
    mov r0, r4
    bl func_ov061_022100e4
    ldr r1, [r4, #0x28]
    ldr r0, .L_02210090
    bl DisplayBrightnessPair_GetScreen
    mov r2, #0x0
    mov r3, r2
    mov r1, #0x10
    bl DisplayBrightness_StartTransition
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
.L_0220ffc4:
    bl DebugHudState_GetGlobal
    mov r1, #0x0
    bl DebugHudState_PollInput
    mov r1, r0, lsl #0x1f
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    beq .L_02210070
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    bne .L_02210000
    ldr r0, .L_02210094
    ldr r0, [r0, #0x0]
    bl func_020755bc
    b .L_0221000c
.L_02210000:
    ldr r0, .L_02210098
    ldr r0, [r0, #0x0]
    bl func_020755bc
.L_0221000c:
    ldr r1, [r4, #0x28]
    ldr r0, .L_02210090
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x10
    mov r2, #0x0
    mov r3, #0x5
    bl DisplayBrightness_StartTransition
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_02210070
.L_02210038:
    mov r0, r4
    bl func_ov061_022101dc
.L_02210040:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_02210070
.L_02210050:
    cmp r4, #0x0
    beq .L_02210068
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210068:
    mov r0, #0x1
    b .L_02210084
.L_02210070:
    ldr r0, .L_0221008c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateActorPresentationState
    mov r0, #0x0
.L_02210084:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0221008c: .word data_021052fc
.L_02210090: .word data_020f4dc8
.L_02210094: .word data_020f4e14
.L_02210098: .word gDebugFont
.size func_ov061_0220fedc, . - func_ov061_0220fedc
