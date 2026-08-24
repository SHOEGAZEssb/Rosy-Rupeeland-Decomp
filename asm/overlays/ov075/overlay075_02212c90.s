.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_GetActorCollection
.extern ActorExtendedType2_GetDescriptorValue2A
.extern func_ov075_02212d80
.extern func_ov075_02213ca4

.global func_ov075_02212c90
func_ov075_02212c90:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r6, #0x1
    mov r9, #0x0
    mov r10, r0
    mov r5, r9
    mov r11, r6
    mov r7, r6
    ldr r4, .L_02212d7c
    b .L_02212d5c
.L_02212cb4:
    ldr r0, [r4, #0x0]
    mov r1, r7
    bl GamePhaseRuntime_GetActorCollection
    ldr r8, [r0, r9, lsl #0x2]
    cmp r8, #0x0
    beq .L_02212d58
    ldrb r0, [r8, #0x4d]
    cmp r0, #0x2
    moveq r0, r6
    movne r0, r5
    cmp r0, #0x0
    beq .L_02212d58
    add r0, r8, #0x200
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0xf
    moveq r0, r11
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02212d58
    mov r0, r8
    bl ActorExtendedType2_GetDescriptorValue2A
    add r1, r8, #0x200
    ldrsh r1, [r1, #0xa8]
    cmp r1, r0
    movlt r0, #0x1
    movge r0, #0x0
    cmp r0, #0x0
    beq .L_02212d58
    mov r0, r8
    mov r1, r10
    bl func_ov075_02213ca4
    mov r0, r8
    str r8, [r10, #0x29c]
    bl func_ov075_02212d80
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r0, r10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xfc]
    blx r1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02212d58:
    add r9, r9, #0x1
.L_02212d5c:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_02212cb4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02212d7c: .word gGamePhaseRuntime
.size func_ov075_02212c90, . - func_ov075_02212c90
