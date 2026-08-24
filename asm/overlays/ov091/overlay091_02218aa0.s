.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov091_02218dd0
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_AddCurrency
.extern RuntimePresentationManager_AppendFirstListEffect
.extern func_02022cb0
.extern Type1Actor_TryEnterFailureState
.extern gHeapContext
.extern gGamePhaseCurrencyHud

.global func_ov091_02218aa0
func_ov091_02218aa0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldrb r0, [r0, #0x1ec]
    add r0, r0, #0xfe
    and r0, r0, #0xff
    cmp r0, #0x2
    bhi .L_02218b68
    ldr r0, [r1, #0x1fc]
    ldrsh r0, [r0, #0xc]
    rsbs r4, r0, #0x0
    beq .L_02218b68
    ldr r1, .L_02218b70
    ldr r0, .L_02218b74
    ldr r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r3, r1, #0x2000
    mov r1, r4
    mov r2, #0x0
    ldr r5, [r3, #0xea4]
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, .L_02218b78
    ldr r3, .L_02218b7c
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r6, r0
    beq .L_02218b48
    ldr r0, .L_02218b70
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov ip, #0x2000
    mov r1, r0
    mov r0, r6
    mov r2, r5
    mov r3, r4
    str ip, [sp, #0x0]
    sub r4, ip, #0x20c0
    str r4, [sp, #0x4]
    bl func_02022cb0
    mov r6, r0
.L_02218b48:
    ldr r0, .L_02218b70
    mov r1, r6
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    mov r0, r5
    bl Type1Actor_TryEnterFailureState
.L_02218b68:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_02218b70: .word data_021052fc
.L_02218b74: .word gGamePhaseCurrencyHud
.L_02218b78: .word data_ov091_02218dd0
.L_02218b7c: .word gHeapContext
.size func_ov091_02218aa0, . - func_ov091_02218aa0
