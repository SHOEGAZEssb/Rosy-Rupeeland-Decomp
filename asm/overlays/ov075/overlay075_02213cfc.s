.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_02032228
.extern Actor_QueryTerrainHeight
.extern func_02045364
.extern func_0204539c
.extern func_020453b0
.extern func_020453c8
.extern func_ov075_02212f20
.extern func_ov075_022132e8

.global func_ov075_02213cfc
func_ov075_02213cfc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0x200
    mov r1, #0x1
    strh r1, [r0, #0x6a]
    ldr r0, [r5, #0x26c]
    bl func_0204539c
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0xc
    str r0, [r5, #0x230]
    ldr r0, [r5, #0x26c]
    bl func_020453b0
    ldr r1, [r0, #0x0]
    mov r0, r5
    mov r2, r1, lsl #0xc
    str r2, [r5, #0x234]
    ldr r1, [r5, #0x230]
    mov r2, r2, asr #0x10
    mov r1, r1, asr #0x10
    bl Actor_QueryTerrainHeight
    mov r2, r0, lsl #0x10
    add r0, r5, #0x28
    add r1, r5, #0x22c
    str r2, [r5, #0x238]
    bl func_020050a4
    mov r1, r0
    add r0, r5, #0x18
    bl func_020050a4
    ldr r0, [r5, #0x26c]
    bl func_02045364
    ldr r0, [r5, #0x26c]
    bl func_0204539c
    ldr r0, [r0, #0x0]
    mov r0, r0, lsl #0xc
    str r0, [r5, #0x2b4]
    ldr r0, [r5, #0x26c]
    bl func_020453b0
    ldr r1, [r0, #0x0]
    mov r0, r5
    mov r1, r1, lsl #0xc
    str r1, [r5, #0x2b8]
    mov r2, r1, asr #0x10
    ldr r1, [r5, #0x2b4]
    mov r1, r1, asr #0x10
    bl Actor_QueryTerrainHeight
    mov r0, r0, lsl #0x10
    str r0, [r5, #0x2bc]
    ldr r2, [r5, #0x2b8]
    ldr r0, [r5, #0x234]
    ldr r1, [r5, #0x2b4]
    sub r2, r2, r0
    ldr r0, [r5, #0x230]
    sub r0, r1, r0
    cmp r0, #0x0
    bgt .L_02213df0
    cmp r2, #0x0
    movle r0, #0x2
    strle r0, [r5, #0x2ac]
    movgt r0, #0x0
    b .L_02213e00
.L_02213df0:
    cmp r2, #0x0
    movle r0, #0x4
    strle r0, [r5, #0x2ac]
    movgt r0, #0x6
.L_02213e00:
    strgt r0, [r5, #0x2ac]
    ldr r0, [r5, #0x26c]
    bl func_02045364
    ldr r0, [r5, #0x26c]
    bl func_020453c8
    add r1, r5, #0x200
    strh r0, [r1, #0x5a]
    ldr r4, [r5, #0x2b4]
    ldr r1, [r5, #0x1c]
    ldr r3, [r5, #0x2b8]
    ldr r2, [r5, #0x20]
    mov r0, r5
    sub r2, r3, r2
    sub r1, r4, r1
    mov r3, #0x8000
    bl func_02032228
    ldrb r2, [r5, #0xd4]
    add r0, sp, #0x0
    add r1, r5, #0x18
    and r2, r2, #0xe
    strb r2, [r5, #0xd4]
    bl func_02005030
    ldr r0, [sp, #0xc]
    mov r4, #0x0
    sub r0, r0, #0x1000
    str r0, [sp, #0xc]
    add r6, r5, #0x200
    add r8, sp, #0x0
    mov r7, #0x8000
    b .L_02213ea8
.L_02213e78:
    ldr r0, [r5, #0x2a4]
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_02213ea4
    mov r1, r8
    bl func_ov075_02212f20
    ldr r0, [r5, #0x2a4]
    mov r2, r7
    ldr r0, [r0, r4, lsl #0x2]
    add r1, r5, #0x2b0
    bl func_ov075_022132e8
.L_02213ea4:
    add r4, r4, #0x1
.L_02213ea8:
    ldrsh r0, [r6, #0xa8]
    cmp r4, r0
    blt .L_02213e78
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov075_02213cfc, . - func_ov075_02213cfc
