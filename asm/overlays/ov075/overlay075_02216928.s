.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_ov075_02217290
.extern func_02004fe0
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_0200634c
.extern func_0200637c
.extern func_020064b8
.extern func_02032370
.extern func_020417dc
.extern ActorExtendedLinkSource_LinkPartner
.extern func_020befec
.extern func_ov075_02214898
.extern func_ov075_022154e8
.extern func_ov075_022168a8
.extern func_ov075_022168f0

.global func_ov075_02216928
func_ov075_02216928:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x80
    mov r4, r0
    add r2, r4, #0x200
    ldrh r3, [r2, #0xa2]
    mov r3, r3, lsl #0x1f
    movs r3, r3, lsr #0x1f
    beq .L_02216b48
    ldr r1, [r4, #0x14]
    orr r1, r1, #0x6
    str r1, [r4, #0x14]
    ldrsh r1, [r2, #0xa0]
    cmp r1, #0x1e
    bge .L_02216a8c
    ldr r1, [r0, #0x0]
    ldr r5, [r4, #0x2a8]
    ldr r1, [r1, #0x140]
    blx r1
    mov r2, r0
    mov r0, r4
    add r1, r5, #0x18
    bl func_02032370
    add r1, r4, #0x200
    ldrsh r2, [r1, #0xa0]
    add r0, sp, #0x70
    add r2, r2, #0x1
    strh r2, [r1, #0xa0]
    ldr r1, [r4, #0x2a8]
    add r1, r1, #0x18
    bl func_02005030
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1e0]
    blx r1
    ldr r2, [sp, #0x7c]
    add r1, sp, #0x70
    add r0, r2, r0
    str r0, [sp, #0x7c]
    add r0, sp, #0x20
    add r2, r4, #0x2ac
    bl func_ov075_02214898
    add r0, sp, #0x10
    add r1, sp, #0x20
    mov r2, #0x2000
    bl func_ov075_022168a8
    add r0, sp, #0x60
    add r1, r4, #0x2ac
    add r2, sp, #0x10
    bl func_ov075_022168f0
    add r0, sp, #0x10
    bl func_02005058
    add r0, sp, #0x20
    bl func_02005058
    ldr r0, [sp, #0x6c]
    add r5, sp, #0x30
    add r0, r0, #0x30000
    str r0, [sp, #0x6c]
    mov r0, r5
    bl func_02004fe0
    add r0, sp, #0x40
    bl func_02004fe0
    add r0, r5, #0x20
    bl func_02004fe0
    mov r0, r5
    add r1, r4, #0x2ac
    add r2, sp, #0x70
    add r3, sp, #0x60
    bl func_0200634c
    add r0, r4, #0x200
    ldrsh r0, [r0, #0xa0]
    mov r1, #0x1e
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x0
    mov r1, r5
    bl func_020064b8
    add r1, sp, #0x0
    add r0, r4, #0x18
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    mov r0, r5
    bl func_0200637c
    add r0, sp, #0x60
    bl func_02005058
    add r0, sp, #0x70
    bl func_02005058
    b .L_02216b4c
.L_02216a8c:
    ldr r0, [r4, #0x2a8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_02216af0
    ldr r0, [r4, #0x2a8]
    ldr r1, [r0, #0xd0]
    tst r1, #0x100
    bne .L_02216af0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1a8]
    blx r1
    cmp r0, #0x0
    bne .L_02216af0
    ldr r0, [r4, #0x2a8]
    bl func_ov075_022154e8
    cmp r0, #0x0
    bne .L_02216af0
    ldr r1, [r4, #0x2a8]
    mov r0, r4
    bl ActorExtendedLinkSource_LinkPartner
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r4, #0xd0]
.L_02216af0:
    mov r0, #0x0
    str r0, [r4, #0x2a8]
    add r0, r4, #0x200
    ldrh r3, [r0, #0xa2]
    mov r2, #0x2
    ldr r1, .L_02216b58
    bic r3, r3, #0x1
    strh r3, [r0, #0xa2]
    strh r2, [r4, #0xd6]
    ldr r2, [r1, #0xa8]
    ldr r0, [r1, #0xac]
    str r2, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldr r2, [r1, #0xa0]
    ldr r0, [r1, #0xa4]
    str r2, [r4, #0x220]
    str r0, [r4, #0x224]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
    b .L_02216b4c
.L_02216b48:
    bl func_020417dc
.L_02216b4c:
    mov r0, #0x0
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, pc}
.L_02216b58: .word data_ov075_02217290
.size func_ov075_02216928, . - func_ov075_02216928
