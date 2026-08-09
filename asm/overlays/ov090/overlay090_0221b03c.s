.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern func_020050a4
.extern func_02059278
.extern func_0205929c
.extern gSoundContext

.global func_ov090_0221b03c
func_ov090_0221b03c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x224
    add r1, r4, #0x18
    bl func_020050a4
    mov r0, #0x0
    ldrb r2, [r5, #0x222]
    mov r1, r0
    mov ip, r0
    orr r2, r2, #0x1
    strb r2, [r5, #0x222]
    strb r0, [r5, #0x246]
    mov lr, #0x1
    mov r3, #0x3
.L_0221b078:
    add r2, r5, r1, lsl #0x2
    ldr r2, [r2, #0x1f4]
    add r1, r1, #0x1
    ldrsh r6, [r2, #0xda]
    cmp r6, #0x3
    movge r2, lr
    movlt r2, ip
    cmp r2, #0x0
    addne r0, r0, #0x1
    cmp r6, #0x3
    movge r6, r3
    ldrb r2, [r5, #0x246]
    cmp r1, #0x3
    add r2, r2, r6
    strb r2, [r5, #0x246]
    blt .L_0221b078
    cmp r0, #0x3
    ldrgeb r0, [r5, #0x222]
    orrge r0, r0, #0x2
    strgeb r0, [r5, #0x222]
    bge .L_0221b140
    ldrb r0, [r5, #0x246]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_0221b140
.L_0221b0dc:
    b .L_0221b104
    b .L_0221b114
    b .L_0221b114
    b .L_0221b114
    b .L_0221b124
    b .L_0221b124
    b .L_0221b124
    b .L_0221b134
    b .L_0221b134
    b .L_0221b134
.L_0221b104:
    add r0, r5, #0x200
    mov r1, #0x12c
    strh r1, [r0, #0x36]
    b .L_0221b140
.L_0221b114:
    add r0, r5, #0x200
    mov r1, #0x64
    strh r1, [r0, #0x36]
    b .L_0221b140
.L_0221b124:
    add r0, r5, #0x200
    mov r1, #0x46
    strh r1, [r0, #0x36]
    b .L_0221b140
.L_0221b134:
    add r0, r5, #0x200
    mov r1, #0x32
    strh r1, [r0, #0x36]
.L_0221b140:
    ldrb r0, [r5, #0x1ec]
    cmp r0, #0x10
    ldmneia sp!, {r4, r5, r6, pc}
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x3
    movge r0, #0x1
    movlt r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, .L_0221b190
    mov r1, #0x54
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205929c
    ldr r0, .L_0221b190
    mov r1, #0x55
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    ldmia sp!, {r4, r5, r6, pc}
.L_0221b190: .word gSoundContext
.size func_ov090_0221b03c, . - func_ov090_0221b03c
