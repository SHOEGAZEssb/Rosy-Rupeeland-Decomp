.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern gActorRuntimeCollection
.extern data_ov085_02214328
.extern data_ov085_02214358
.extern data_ov085_02214370
.extern data_ov085_022143a0
.extern data_ov085_022143b0
.extern data_ov085_022143b8
.extern data_ov085_022143c0
.extern data_ov085_022143c8
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorDerivedRuntime_AcceptInteractionQuery
.extern Sound_PlayOwnedEffect
.extern func_ov085_02213bd0
.extern gSoundContext

.global func_ov085_02213484
func_ov085_02213484:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, .L_022136a0
    mov r4, r1
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0221368c
    ldr r0, [r5, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221368c
    ldr r1, .L_022136a4
    mov r0, #0x1
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x48]
    mov ip, r0
    cmp r3, r1
    ldr r1, .L_022136a8
    bne .L_022134f0
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_022134f0:
    cmp ip, #0x0
    beq .L_02213530
    ldr r1, .L_022136a4
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0xa0]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_022136ac
    bne .L_02213528
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213528:
    cmp ip, #0x0
    movne r0, #0x0
.L_02213530:
    cmp r0, #0x0
    beq .L_02213580
    ldr r0, [r5, #0xd0]
    tst r0, #0x10
    ldreq r1, [r5, #0x24]
    ldreq r0, [r5, #0x1dc]
    cmpeq r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221368c
    ldr r0, [r5, #0x24c]
    cmp r0, #0x0
    bne .L_0221368c
    mov r0, #0x4
    str r0, [r5, #0x24c]
    ldr r0, [r5, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r5, #0xd0]
    b .L_0221368c
.L_02213580:
    ldr r0, .L_022136a4
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x98]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_022136b0
    bne .L_022135b0
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_022135b0:
    cmp r3, #0x0
    bne .L_022135fc
    ldr r1, .L_022136b4
    mov r0, r5
    ldmia r1, {r1, r2}
    mov r3, #0xc8
    bl func_ov085_02213bd0
    mov r0, #0x0
    str r0, [r5, #0x250]
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_022136b8
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r5
    add r1, r1, #0x33
    mov r2, #0x2
    bl Sound_PlayOwnedEffect
    b .L_0221368c
.L_022135fc:
    ldr r0, .L_022136a4
    ldr r3, [r5, #0x208]
    ldr r1, [r0, #0x88]
    mov r0, #0x0
    cmp r3, r1
    mov ip, #0x1
    ldr r1, .L_022136bc
    bne .L_02213630
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213630:
    cmp ip, #0x0
    beq .L_02213670
    ldr r1, .L_022136a4
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x30]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_022136c0
    bne .L_02213668
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213668:
    cmp ip, #0x0
    movne r0, #0x1
.L_02213670:
    cmp r0, #0x0
    beq .L_0221368c
    ldr r1, .L_022136c4
    mov r0, r5
    mov r3, #0x3c
    ldmia r1, {r1, r2}
    bl func_ov085_02213bd0
.L_0221368c:
    mov r0, r5
    mov r1, r4
    bl ActorDerivedRuntime_AcceptInteractionQuery
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_022136a0: .word gActorRuntimeCollection
.L_022136a4: .word data_ov085_02214328
.L_022136a8: .word data_ov085_02214370
.L_022136ac: .word data_ov085_022143c8
.L_022136b0: .word data_ov085_022143c0
.L_022136b4: .word data_ov085_022143b8
.L_022136b8: .word gSoundContext
.L_022136bc: .word data_ov085_022143b0
.L_022136c0: .word data_ov085_02214358
.L_022136c4: .word data_ov085_022143a0
.size func_ov085_02213484, . - func_ov085_02213484
