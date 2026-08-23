.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern ActorCollection_FindActorByRuntimeId
.extern Actor_GetOwningCollection
.extern ActorExtendedType2_UpdateFrame
.extern ActorExtendedType2_GetDescriptorValue25
.extern func_ov097_02217fd8
.extern gGameWork

.global func_ov097_02218034
func_ov097_02218034:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x260]
    bic r1, r1, #0x200000
    str r1, [r4, #0x260]
    ldrb r1, [r4, #0x2bd]
    cmp r1, #0x0
    beq .L_02218094
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    ldr r0, .L_022180b4
    movne r2, #0x1
    ldr r0, [r0, #0x0]
    moveq r2, #0x0
    mov r1, #0x0
    bl func_ov097_02217fd8
    mov r5, r0
    mov r0, r4
    bl Actor_GetOwningCollection
    mov r1, r5
    bl ActorCollection_FindActorByRuntimeId
    str r0, [r4, #0x2c4]
    mov r0, #0x0
    strb r0, [r4, #0x2bd]
.L_02218094:
    mov r0, r4
    bl ActorExtendedType2_UpdateFrame
    ldrb r0, [r4, #0x24c]
    cmp r0, #0x8
    mvneq r0, #0x5b
    mvnne r0, #0x6b
    strh r0, [r4, #0x6a]
    ldmia sp!, {r3, r4, r5, pc}
.L_022180b4: .word gGameWork
.size func_ov097_02218034, . - func_ov097_02218034
