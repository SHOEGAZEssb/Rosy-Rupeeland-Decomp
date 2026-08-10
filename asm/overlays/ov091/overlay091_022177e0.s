.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern data_021052fc
.extern data_ov091_02218cd0
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern GamePhaseRuntime_GetActorCollection
.extern func_0204d520

.global func_ov091_022177e0
func_ov091_022177e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    bl func_0204d520
    ldr r2, .L_02217908
    mov r1, #0x0
    str r2, [r10, #0x0]
    strb r1, [r10, #0x1ec]
    add r0, r10, #0x100
    strb r1, [r10, #0x1ed]
    strh r1, [r0, #0xee]
    str r1, [r10, #0x1f0]
    mov r2, r1
    mov r3, r1
    add r0, r10, #0x210
    str r1, [r10, #0x1f4]
    bl VecFx32Object_InitComponents
    mov r1, #0x0
    add r0, r10, #0x224
    str r1, [r10, #0x220]
    bl VecFx32Object_Init
    mov r8, #0x0
    mov r11, #0x1
    mov r9, r8
    mov r5, r8
    mov r6, r11
    mov r7, r11
    ldr r4, .L_0221790c
    b .L_022178e4
.L_02217850:
    ldr r0, [r4, #0x0]
    mov r1, r7
    bl GamePhaseRuntime_GetActorCollection
    ldr r1, [r0, r9, lsl #0x2]
    cmp r1, #0x0
    beq .L_022178e0
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x2
    moveq r2, r6
    movne r2, r5
    cmp r2, #0x0
    beq .L_022178b8
    add r0, r1, #0x200
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0x16
    moveq r2, r11
    movne r2, #0x0
    cmp r2, #0x0
    strne r1, [r10, #0x1f0]
    bne .L_022178e0
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    strne r1, [r10, #0x1f4]
    b .L_022178e0
.L_022178b8:
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022178e0
    ldrh r0, [r1, #0x4e]
    cmp r0, #0x12
    addeq r0, r10, r8, lsl #0x2
    streq r1, [r0, #0x1f8]
    addeq r8, r8, #0x1
.L_022178e0:
    add r9, r9, #0x1
.L_022178e4:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_02217850
    mov r0, r10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02217908: .word data_ov091_02218cd0
.L_0221790c: .word data_021052fc
.size func_ov091_022177e0, . - func_ov091_022177e0
