.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290
.extern data_ov075_02217348
.extern data_ov075_02217350
.extern func_020050a4
.extern ActorExtendedLinkSource_UpdateFrame
.extern ActorExtendedLinkSource_ClearPartnerLinkedFlag
.extern func_0204cfa4
.extern func_ov075_022152ac
.extern func_ov075_022154e8
.extern func_ov075_0221627c

.global func_ov075_02215cf8
func_ov075_02215cf8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, .L_02216090
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0xc0]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02216094
    bne .L_02215d48
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02215d48:
    cmp r3, #0x0
    bne .L_02215d68
    mov r0, r4
    bl ActorExtendedLinkSource_ClearPartnerLinkedFlag
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa4]
    b .L_02216084
.L_02215d68:
    ldr r0, .L_02216090
    ldr r2, [r4, #0x218]
    ldr r0, [r0, #0xb8]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02216098
    bne .L_02215d98
    ldr r1, [r4, #0x21c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02215d98:
    cmp r3, #0x0
    beq .L_02216084
    ldr r0, [r4, #0xd0]
    tst r0, #0x100
    bne .L_02216084
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_02216084
    ldr r1, [r4, #0x298]
    cmp r1, #0x0
    beq .L_02216064
    add r0, r4, #0x22c
    add r1, r1, #0x22c
    bl func_020050a4
    ldr r0, [r4, #0x298]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    beq .L_02215e40
    ldr r0, [r4, #0x29c]
    tst r0, #0x1
    beq .L_02215e40
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1d8]
    blx r1
    ldr r0, [r4, #0xd0]
    mov r2, #0x0
    orr r0, r0, #0x2000
    str r0, [r4, #0xd0]
    strh r2, [r4, #0xda]
    add r0, r4, #0x200
    strh r2, [r0, #0xa4]
    ldr r1, [r4, #0x5c]
    sub r0, r2, #0x10000
    and r0, r1, r0
    str r0, [r4, #0x5c]
    b .L_02216084
.L_02215e40:
    ldr r0, [r4, #0x29c]
    tst r0, #0x1
    beq .L_02215f88
    ldr r2, [r4, #0x298]
    ldr r0, [r2, #0xd0]
    tst r0, #0x100
    beq .L_02215e74
    mov r0, r4
    bl ActorExtendedLinkSource_ClearPartnerLinkedFlag
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa4]
    b .L_02216084
.L_02215e74:
    ldr r1, [r2, #0x260]
    add r0, r4, #0x200
    bic r1, r1, #0x8
    str r1, [r2, #0x260]
    ldrh r0, [r0, #0xa4]
    cmp r0, #0x0
    ldrsh r0, [r4, #0xda]
    beq .L_02215ec0
    cmp r0, #0x1
    movne r0, #0x1
    strneh r0, [r4, #0xda]
    ldrne r0, [r4, #0xd0]
    orrne r0, r0, #0x1000
    strne r0, [r4, #0xd0]
    add r0, r4, #0x200
    ldrh r1, [r0, #0xa4]
    sub r1, r1, #0x1
    strh r1, [r0, #0xa4]
    b .L_02215ed8
.L_02215ec0:
    cmp r0, #0x0
    movne r0, #0x0
    strneh r0, [r4, #0xda]
    ldrne r0, [r4, #0xd0]
    orrne r0, r0, #0x1000
    strne r0, [r4, #0xd0]
.L_02215ed8:
    ldr r0, [r4, #0x298]
    bl func_ov075_022154e8
    cmp r0, #0x0
    beq .L_02215f0c
    ldrsh r0, [r4, #0xd6]
    cmp r0, #0xb
    beq .L_02215f48
    mov r0, #0xb
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
    b .L_02215f48
.L_02215f0c:
    mov r0, #0x2
    strh r0, [r4, #0xd6]
    cmp r0, #0xb
    beq .L_02215f30
    ldr r0, [r4, #0x298]
    ldrb r1, [r4, #0xd4]
    ldrb r0, [r0, #0xd4]
    cmp r1, r0
    beq .L_02215f48
.L_02215f30:
    ldr r0, [r4, #0x298]
    ldrb r0, [r0, #0xd4]
    strb r0, [r4, #0xd4]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
.L_02215f48:
    mov r0, r4
    bl func_ov075_0221627c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1e0]
    blx r1
    mov r1, r0, lsl #0x4
    mov r0, #0x10000
    mov r1, r1, asr #0x10
    ldr r2, [r4, #0x5c]
    rsb r0, r0, #0x0
    and r2, r2, r0
    mov r0, r1, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    str r0, [r4, #0x5c]
    b .L_02216084
.L_02215f88:
    add r0, r4, #0x200
    ldrh r0, [r0, #0xa2]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_0221603c
    ldr r0, [r4, #0x298]
    ldr r1, [r0, #0xd0]
    tst r1, #0x100
    bne .L_0221603c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_0221603c
    ldr r0, [r4, #0x298]
    bl func_ov075_022152ac
    cmp r0, #0x0
    bne .L_0221603c
    ldr r0, [r4, #0x298]
    bl func_ov075_022154e8
    cmp r0, #0x0
    bne .L_0221603c
    mov r0, r4
    bl func_ov075_022152ac
    cmp r0, #0x0
    bne .L_0221603c
    mov r0, r4
    bl func_ov075_022154e8
    cmp r0, #0x0
    bne .L_0221603c
    ldr r1, [r4, #0x298]
    ldr r3, [r4, #0x1c]
    ldr r0, [r1, #0x1c]
    ldr r2, [r4, #0x20]
    ldr r1, [r1, #0x20]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_0204cfa4
    cmp r0, #0x60000
    bge .L_0221603c
    mov r0, r4
    ldr r2, [r0, #0x0]
    ldr r1, [r4, #0x298]
    ldr r2, [r2, #0x1d4]
    blx r2
.L_0221603c:
    mov r0, #0x10000
    ldr r1, [r4, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r0, [r4, #0x5c]
    ldr r1, [r4, #0x298]
    ldr r0, [r1, #0x260]
    orr r0, r0, #0x8
    str r0, [r1, #0x260]
    b .L_02216084
.L_02216064:
    mov r2, #0x0
    strh r2, [r4, #0xda]
    add r0, r4, #0x200
    strh r2, [r0, #0xa4]
    ldr r1, [r4, #0x5c]
    sub r0, r2, #0x10000
    and r0, r1, r0
    str r0, [r4, #0x5c]
.L_02216084:
    mov r0, r4
    bl ActorExtendedLinkSource_UpdateFrame
    ldmia sp!, {r4, pc}
.L_02216090: .word data_ov075_02217290
.L_02216094: .word data_ov075_02217350
.L_02216098: .word data_ov075_02217348
.size func_ov075_02215cf8, . - func_ov075_02215cf8
