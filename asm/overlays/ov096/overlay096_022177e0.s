.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern data_020eb850
.extern data_ov096_02218b98
.extern ActorExtendedType2_Init

.global func_ov096_022177e0
func_ov096_022177e0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_02217860
    mov r1, #0x0
    str r0, [r4, #0x0]
    strb r1, [r4, #0x298]
    strb r1, [r4, #0x299]
    strb r1, [r4, #0x29a]
    strb r1, [r4, #0x29b]
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    mov ip, #0x0
    ldrsb r5, [sp, #0x25]
    ldr r3, .L_02217864
    mov lr, ip
    mov r0, #0x32
.L_02217834:
    mul r2, lr, r0
    ldrsh r1, [r3, r2]
    add lr, lr, #0x1
    cmp r5, r1
    addeq ip, r3, r2
    cmp lr, #0x43
    blt .L_02217834
    mov r0, r4
    str ip, [r4, #0x29c]
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_02217860: .word data_ov096_02218b98
.L_02217864: .word data_020eb850
.size func_ov096_022177e0, . - func_ov096_022177e0
