.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern ActorExtendedLinkSource_UpdateFrame

.global func_ov076_022139d4
func_ov076_022139d4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl ActorExtendedLinkSource_UpdateFrame
    ldr r0, [r4, #0x29c]
    tst r0, #0x1
    beq .L_02213a28
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    ldr r1, [r4, #0x298]
    ldr r0, [r4, #0x54]
    ldr r1, [r1, #0x54]
    ldrsh r1, [r1, #0x36]
    strh r1, [r0, #0x36]
.L_02213a28:
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x2
    orr r0, r0, #0x1
    str r0, [r4, #0x260]
    ldmia sp!, {r4, pc}
.size func_ov076_022139d4, . - func_ov076_022139d4
