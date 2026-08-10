.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_021052fc
.extern data_ov079_02213b08
.extern data_ov079_02213b30
.extern GamePhaseRuntime_GetActorCollection
.extern func_0204cfa4

.global func_ov079_02213310
func_ov079_02213310:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r0, [r10, #0x2a4]
    cmp r0, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r9, #0x0
    mov r11, r9
    ldr r6, .L_02213400
    mov r7, #0x1
    ldr r4, .L_02213404
    ldr r5, .L_02213408
    b .L_022133dc
.L_02213344:
    ldr r0, [r5, #0x0]
    mov r1, r7
    bl GamePhaseRuntime_GetActorCollection
    ldr r8, [r0, r9, lsl #0x2]
    cmp r8, #0x0
    cmpne r8, r10
    beq .L_022133d8
    ldrb r0, [r8, #0x4d]
    cmp r0, #0x5
    bne .L_022133d8
    ldr r3, [r8, #0x218]
    ldr r1, [r4, #0x28]
    mov r0, r11
    cmp r3, r1
    mov ip, #0x1
    bne .L_02213398
    ldr r2, [r8, #0x21c]
    ldr r1, [r6, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213398:
    cmp ip, #0x0
    ldreq r1, [r8, #0x2a4]
    cmpeq r1, #0x0
    moveq r0, #0x1
    cmp r0, #0x0
    beq .L_022133d8
    ldr r1, [r8, #0x1c]
    ldr r0, [r10, #0x1c]
    ldr r2, [r8, #0x20]
    sub r0, r1, r0
    ldr r1, [r10, #0x20]
    sub r1, r2, r1
    bl func_0204cfa4
    cmp r0, #0x30000
    movlt r0, r8
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022133d8:
    add r9, r9, #0x1
.L_022133dc:
    ldr r0, [r5, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_02213344
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02213400: .word data_ov079_02213b30
.L_02213404: .word data_ov079_02213b08
.L_02213408: .word data_021052fc
.size func_ov079_02213310, . - func_ov079_02213310
