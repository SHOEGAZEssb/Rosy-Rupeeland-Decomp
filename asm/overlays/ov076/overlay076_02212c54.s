.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern func_02004fe0
.extern func_02005058
.extern func_02005084
.extern ActorExtendedType2_ApplyContactResponse
.extern func_ov076_02212e18

.global func_ov076_02212c54
func_ov076_02212c54:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r8, r0
    mov r7, r1
    ldr r4, [r7, #0x1c]
    ldr r3, [r8, #0x1c]
    ldr r1, [r7, #0x20]
    ldr r0, [r8, #0x20]
    sub r4, r4, r3
    mov r6, r2
    cmp r4, #0x0
    sub r5, r1, r0
    ble .L_02212cb0
    ldrb r0, [r8, #0x29c]
    tst r0, #0x1
    beq .L_02212cdc
    bic r0, r0, #0x1
    strb r0, [r8, #0x29c]
    add r0, r8, #0x200
    ldrh r1, [r0, #0x9e]
    add r1, r1, #0x1e
    strh r1, [r0, #0x9e]
    b .L_02212cdc
.L_02212cb0:
    cmp r4, #0x0
    bge .L_02212cdc
    ldrb r0, [r8, #0x29c]
    tst r0, #0x1
    addeq r0, r8, #0x200
    ldreqh r1, [r0, #0x9e]
    addeq r1, r1, #0x1e
    streqh r1, [r0, #0x9e]
    ldrb r0, [r8, #0x29c]
    orr r0, r0, #0x1
    strb r0, [r8, #0x29c]
.L_02212cdc:
    cmp r5, #0x0
    ble .L_02212d0c
    ldrb r0, [r8, #0x29c]
    tst r0, #0x2
    beq .L_02212d34
    bic r0, r0, #0x2
    strb r0, [r8, #0x29c]
    add r0, r8, #0x200
    ldrh r1, [r0, #0x9e]
    add r1, r1, #0x1e
    strh r1, [r0, #0x9e]
    b .L_02212d34
.L_02212d0c:
    bge .L_02212d34
    ldrb r0, [r8, #0x29c]
    tst r0, #0x2
    addeq r0, r8, #0x200
    ldreqh r1, [r0, #0x9e]
    addeq r1, r1, #0x1e
    streqh r1, [r0, #0x9e]
    ldrb r0, [r8, #0x29c]
    orr r0, r0, #0x2
    strb r0, [r8, #0x29c]
.L_02212d34:
    add r0, r8, #0x200
    ldrh r1, [r0, #0x9e]
    cmp r1, #0x96
    movhi r1, #0x96
    strhih r1, [r0, #0x9e]
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_02212df4
    add r0, r8, #0x200
    ldrsh r1, [r0, #0xa2]
    cmp r1, #0x1e
    subgt r1, r1, #0x1e
    strgth r1, [r0, #0xa2]
    ldr r0, [r7, #0x20c]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    cmp r0, #0xf
    bge .L_02212df4
    add r0, r8, #0x200
    ldrh r1, [r0, #0x9e]
    cmp r1, #0x78
    bhi .L_02212da4
    ldrsh r0, [r0, #0xa0]
    cmp r0, #0x0
    ble .L_02212df4
.L_02212da4:
    add r0, sp, #0x0
    bl func_02004fe0
    cmp r4, #0x0
    cmpne r5, #0x0
    beq .L_02212dd4
    add r0, sp, #0x0
    str r4, [sp, #0x4]
    str r5, [sp, #0x8]
    bl func_02005084
    ldr r1, .L_02212e0c
    add r0, sp, #0x0
    bl func_ov076_02212e18
.L_02212dd4:
    mov r0, r7
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x0
    blx r3
    add r0, sp, #0x0
    bl func_02005058
.L_02212df4:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl ActorExtendedType2_ApplyContactResponse
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02212e0c: .word 0x4cd
.size func_ov076_02212c54, . - func_ov076_02212c54
