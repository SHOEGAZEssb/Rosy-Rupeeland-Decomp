.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_GetActorCollection
.extern ActorExtendedType2_IsDirectionToActorAccepted
.extern Fx32Vector2_Magnitude
.extern func_ov079_0221323c

.global func_ov079_0221317c
func_ov079_0221317c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x2a4]
    mov r4, r1
    cmp r0, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, pc}
    ldr r1, [r5, #0x24]
    ldr r0, [r5, #0x1dc]
    cmp r1, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x260]
    tst r0, #0x10
    bne .L_022131e8
    ldr r0, .L_02213238
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r2, [r0, #0xe7c]
    mov r0, r5
    mov r1, r4
    bl ActorExtendedType2_IsDirectionToActorAccepted
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_022131e8:
    ldr r0, .L_02213238
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    ldr r0, [r5, #0x1c]
    ldr r3, [r1, #0x1c]
    ldr r2, [r1, #0x20]
    ldr r1, [r5, #0x20]
    sub r0, r3, r0
    sub r1, r2, r1
    bl Fx32Vector2_Magnitude
    cmp r0, #0x28000
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_ov079_0221323c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02213238: .word gGamePhaseRuntime
.size func_ov079_0221317c, . - func_ov079_0221317c
