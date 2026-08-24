.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.
.extern GameWork_TestFlag
.extern gGamePhaseRuntime
.extern ActorExtendedType2_InitializeReentryState
.extern gGameWork

.global func_ov086_02212b30
func_ov086_02212b30:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, .L_02212be0
    mov r6, r0
    mov r5, r1
    ldr r0, [r3, #0x0]
    ldr r1, .L_02212be4
    mov r4, r2
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02212bb4
    ldr r0, [r6, #0x1fc]
    cmp r0, #0x0
    bgt .L_02212bb4
    ldr r0, .L_02212be8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0xea8]
    cmp r1, #0x0
    beq .L_02212b98
    ldr r0, [r1, #0x29c]
    ldrh r0, [r0, #0x36]
    cmp r0, #0x5
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02212ba4
.L_02212b98:
    mov r0, #0x1
    str r0, [r6, #0x1fc]
    b .L_02212bb4
.L_02212ba4:
    ldr r0, [r1, #0x1fc]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r6, #0x1fc]
.L_02212bb4:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl ActorExtendedType2_InitializeReentryState
    ldr r0, [r6, #0x260]
    bic r0, r0, #0x8
    str r0, [r6, #0x260]
    ldr r0, [r6, #0x10]
    orr r0, r0, #0x90000
    str r0, [r6, #0x10]
    ldmia sp!, {r4, r5, r6, pc}
.L_02212be0: .word gGameWork
.L_02212be4: .word 0x44b
.L_02212be8: .word gGamePhaseRuntime
.size func_ov086_02212b30, . - func_ov086_02212b30
