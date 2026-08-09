.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern data_021052fc
.extern func_02007f0c

.global func_ov092_0221a6d4
func_ov092_0221a6d4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    add r0, r0, #0x200
    ldrsb r0, [r0, #0x78]
    cmp r0, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r6, #0x1
    mov r8, #0x0
    mov r5, r8
    mov r7, r6
    mov r4, r6
    ldr r9, .L_0221a770
    b .L_0221a74c
.L_0221a708:
    ldr r0, [r9, #0x0]
    mov r1, r7
    bl func_02007f0c
    ldr r1, [r0, r8, lsl #0x2]
    cmp r1, #0x0
    beq .L_0221a748
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x4
    moveq r0, r6
    movne r0, r5
    cmp r0, #0x0
    beq .L_0221a748
    ldrh r0, [r1, #0x4e]
    cmp r0, #0x1e
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0221a748:
    add r8, r8, #0x1
.L_0221a74c:
    ldr r0, [r9, #0x0]
    mov r1, r4
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r8, r0
    blt .L_0221a708
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0221a770: .word data_021052fc
.size func_ov092_0221a6d4, . - func_ov092_0221a6d4
