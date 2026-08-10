.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_020e6adc
.extern data_020e6b74
.extern data_020e6c0c
.extern func_02030acc
.extern Actor_GetCollection
.extern Actor_GetCachedTerrainHeight
.extern func_0204362c
.extern func_02072b68
.extern func_020740c8

.global func_ov082_02212b30
func_ov082_02212b30:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldrsh r1, [r7, #0xd6]
    mov r5, #0x0
    mov r6, r5
    cmp r1, #0x16
    mov r4, #0x100
    addls pc, pc, r1, lsl #0x2
    b .L_02212cfc
.L_02212b58:
    b .L_02212cfc
    b .L_02212c54
    b .L_02212c10
    b .L_02212c10
    b .L_02212c10
    b .L_02212bd4
    b .L_02212bd4
    b .L_02212bb4
    b .L_02212c08
    b .L_02212c08
    b .L_02212cfc
    b .L_02212ce8
    b .L_02212cfc
    b .L_02212cf0
    b .L_02212cfc
    b .L_02212cfc
    b .L_02212cfc
    b .L_02212c9c
    b .L_02212cb8
    b .L_02212cc4
    b .L_02212c98
    b .L_02212cfc
    b .L_02212c4c
.L_02212bb4:
    ldrh r1, [r7, #0x4e]
    ldr r0, .L_02212d84
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    ldrneb r0, [r7, #0xd4]
    movne r6, #0x1
    addne r5, r0, #0x15
    bne .L_02212cfc
.L_02212bd4:
    mov r0, r7
    bl func_0204362c
    mvn r1, #0x0
    cmp r0, r1
    beq .L_02212c00
    ldrsh r0, [r7, #0xda]
    cmp r0, #0x1
    ldreqb r0, [r7, #0xd4]
    addeq r5, r0, #0x16
    ldrneb r5, [r7, #0xd4]
    b .L_02212cfc
.L_02212c00:
    ldrb r5, [r7, #0xd4]
    b .L_02212cfc
.L_02212c08:
    ldrb r5, [r7, #0xd4]
    b .L_02212cfc
.L_02212c10:
    bl func_0204362c
    mvn r1, #0x0
    cmp r0, r1
    beq .L_02212c40
    ldr r0, [r7, #0x238]
    ldr r1, [r7, #0x24]
    add r0, r0, #0x14000
    cmp r1, r0
    ldrb r0, [r7, #0xd4]
    addlt r5, r0, #0x8
    addge r5, r0, #0x16
    b .L_02212cfc
.L_02212c40:
    ldrb r0, [r7, #0xd4]
    add r5, r0, #0x8
    b .L_02212cfc
.L_02212c4c:
    mov r5, #0x11
    b .L_02212cfc
.L_02212c54:
    bl func_0204362c
    mvn r1, #0x0
    cmp r0, r1
    beq .L_02212c88
    mov r0, r7
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r7, #0x24]
    add r0, r0, #0x8000
    cmp r1, r0
    ldrb r0, [r7, #0xd4]
    addlt r5, r0, #0x8
    addge r5, r0, #0x16
    b .L_02212cfc
.L_02212c88:
    ldrb r0, [r7, #0xd4]
    mov r4, r5
    mov r6, #0x1
    add r5, r0, #0x8
.L_02212c98:
    b .L_02212cfc
.L_02212c9c:
    ldrh r1, [r7, #0x4e]
    ldr r0, .L_02212d88
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    movne r5, #0x15
    movne r6, #0x1
    b .L_02212cfc
.L_02212cb8:
    mov r5, #0x10
    mov r6, #0x1
    b .L_02212cfc
.L_02212cc4:
    ldrh r1, [r7, #0x4e]
    ldr r0, .L_02212d8c
    ldrb r0, [r0, r1]
    cmp r0, #0x0
    ldreqb r0, [r7, #0xd4]
    movne r5, #0x14
    movne r6, #0x1
    addeq r5, r0, #0x8
    b .L_02212cfc
.L_02212ce8:
    mov r5, #0x12
    b .L_02212cfc
.L_02212cf0:
    ldrb r0, [r7, #0xd4]
    mov r6, #0x1
    add r5, r0, #0x16
.L_02212cfc:
    ldr r8, [r7, #0x208]
    mov r0, r7
    bl Actor_GetCollection
    bl func_02030acc
    ldr r1, [r8, #0xc]
    str r1, [sp, #0x0]
    ldr r1, [r7, #0x54]
    ldmib r8, {r2, r3}
    bl func_020740c8
    ldr r0, [r7, #0x54]
    ldrb r1, [r0, #0x38]
    cmp r5, r1
    beq .L_02212d38
    and r1, r5, #0xff
    bl func_02072b68
.L_02212d38:
    ldr r0, [r7, #0x54]
    mov r1, #0x0
    strh r4, [r0, #0x36]
    ldr r0, [r7, #0x54]
    cmp r6, #0x0
    strh r1, [r0, #0x30]
    ldr r1, [r7, #0x54]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x3
    bne .L_02212d78
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
.L_02212d78:
    strh r0, [r1, #0x24]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02212d84: .word data_020e6c0c
.L_02212d88: .word data_020e6b74
.L_02212d8c: .word data_020e6adc
.size func_ov082_02212b30, . - func_ov082_02212b30
