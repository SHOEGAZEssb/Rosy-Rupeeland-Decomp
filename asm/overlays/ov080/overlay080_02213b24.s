.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern data_02105310
.extern func_02005030
.extern func_02005058
.extern func_0200b04c
.extern Actor_GetCachedTerrainHeight
.extern func_02050078

.global func_ov080_02213b24
func_ov080_02213b24:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0x200
    ldrh r1, [r0, #0xa2]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0xa2]
    ldr r0, .L_02213be8
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_02213be0
    ldr r0, [r4, #0x29c]
    cmp r0, #0x0
    beq .L_02213be0
    add r0, r4, #0x200
    ldrh r1, [r0, #0x9a]
    cmp r1, #0x0
    bne .L_02213bd8
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    beq .L_02213be0
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    cmp r1, r0
    bne .L_02213be0
    ldr r1, [r4, #0x228]
    add r0, sp, #0x0
    add r1, r1, #0x18
    bl func_02005030
    ldr r0, [r4, #0x29c]
    add r2, sp, #0x0
    ldrsh r0, [r0, #0x0]
    add r1, r4, #0x18
    bl func_02050078
    ldr r0, [r4, #0x29c]
    add r1, r4, #0x200
    ldrsh r3, [r0, #0x22]
    add r0, sp, #0x0
    mov r2, #0x1e
    strh r3, [r1, #0x9a]
    strh r2, [r1, #0xa2]
    bl func_02005058
    b .L_02213be0
.L_02213bd8:
    sub r1, r1, #0x1
    strh r1, [r0, #0x9a]
.L_02213be0:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_02213be8: .word data_02105310
.size func_ov080_02213b24, . - func_ov080_02213b24
