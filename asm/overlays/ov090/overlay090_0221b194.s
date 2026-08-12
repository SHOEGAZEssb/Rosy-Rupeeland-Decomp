.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_select.c.
.extern func_020befec

.global func_ov090_0221b194
func_ov090_0221b194:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r8, r0
    mvn r5, #0x0
    mov r2, #0x0
    b .L_0221b1c0
.L_0221b1a8:
    add r0, r8, r2, lsl #0x2
    ldr r0, [r0, #0x1f4]
    cmp r0, r1
    moveq r5, r2
    beq .L_0221b1c8
    add r2, r2, #0x1
.L_0221b1c0:
    cmp r2, #0x3
    blt .L_0221b1a8
.L_0221b1c8:
    mov r7, #0x0
    mov r1, r5
    mvn r6, #0x0
    mov r4, #0x3
    mov r9, r7
    mov r10, #0x1
    b .L_0221b218
.L_0221b1e4:
    add r0, r1, #0x1
    mov r1, r4
    bl func_020befec
    add r0, r8, r1, lsl #0x2
    ldr r0, [r0, #0x1f4]
    ldrsh r0, [r0, #0xda]
    cmp r0, #0x3
    movge r0, r10
    movlt r0, r9
    cmp r0, #0x0
    moveq r6, r1
    beq .L_0221b220
    add r7, r7, #0x1
.L_0221b218:
    cmp r7, #0x3
    blt .L_0221b1e4
.L_0221b220:
    mvn r0, #0x0
    cmp r6, r0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    strb r6, [r8, #0x1ef]
    add r3, r8, r6, lsl #0x2
    ldr r0, [r3, #0x1f4]
    mov r1, #0x0
    add r0, r0, #0x200
    ldrh r2, [r0, #0xf2]
    cmp r6, r5
    orr r2, r2, #0x4
    strh r2, [r0, #0xf2]
    strh r1, [r0, #0xc8]
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
    ldr r0, [r3, #0x1f4]
    mov r1, #0x1
    add r0, r0, #0x300
    strh r1, [r0, #0x6]
    ldr r0, [r3, #0x1f4]
    add r0, r0, #0x300
    ldrh r1, [r0, #0x4]
    add r1, r1, #0x1
    strh r1, [r0, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.size func_ov090_0221b194, . - func_ov090_0221b194
