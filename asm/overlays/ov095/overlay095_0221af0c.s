.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_021052fc
.extern data_ov095_0221cba8
.extern data_ov095_0221cbf8
.extern GamePhaseRuntime_GetActorCollection
.extern ActorCollection_QueueActorForRemoval
.extern Actor_GetCollection
.extern func_0204cfa4

.global func_ov095_0221af0c
func_ov095_0221af0c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r4, .L_0221b054
    ldr r11, .L_0221b058
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r7, r3
    mov r5, #0x0
.L_0221af2c:
    add r0, r10, r5, lsl #0x2
    ldr r6, [r0, #0x304]
    ldr r0, [r6, #0xd0]
    tst r0, #0x100
    bne .L_0221afa8
    ldr r2, [r6, #0x218]
    ldr r0, [r11, #0x50]
    mov r3, #0x1
    cmp r2, r0
    bne .L_0221af68
    ldr r1, [r6, #0x21c]
    ldr r0, [r4, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_0221af68:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221afa8
    ldr r0, [r6, #0x1c]
    ldr r1, [r6, #0x20]
    sub r0, r0, r9
    sub r1, r1, r8
    bl func_0204cfa4
    cmp r0, r7, lsl #0xc
    bge .L_0221afa8
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x204]
    blx r1
.L_0221afa8:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt .L_0221af2c
    mov r6, #0x0
    mov r11, #0x1
    ldr r4, .L_0221b05c
    b .L_0221b034
.L_0221afc4:
    ldr r0, [r4, #0x0]
    mov r1, r11
    bl GamePhaseRuntime_GetActorCollection
    ldr r5, [r0, r6, lsl #0x2]
    cmp r5, #0x0
    beq .L_0221b030
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221b030
    ldrh r0, [r5, #0x4e]
    cmp r0, #0x1d
    cmpne r0, #0x15
    bne .L_0221b030
    ldr r0, [r5, #0x1c]
    ldr r1, [r5, #0x20]
    sub r0, r0, r9
    sub r1, r1, r8
    bl func_0204cfa4
    cmp r0, r7, lsl #0xc
    bge .L_0221b030
    mov r0, r10
    bl Actor_GetCollection
    mov r1, r5
    bl ActorCollection_QueueActorForRemoval
.L_0221b030:
    add r6, r6, #0x1
.L_0221b034:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r6, r0
    blt .L_0221afc4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221b054: .word data_ov095_0221cbf8
.L_0221b058: .word data_ov095_0221cba8
.L_0221b05c: .word data_021052fc
.size func_ov095_0221af0c, . - func_ov095_0221af0c
