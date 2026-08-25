    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */

.global Overlay021_List_FindSpecialRow
Overlay021_List_FindSpecialRow:
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x54]
    mov lr, #0x0
    mov r1, #0xc
    b L_021fd1a8
L_021fd164:
    mul r2, lr, r1
    ldr r3, [r0, #0x4c]
    ldr r2, [r3, r2]
    ldr ip, [r2, #0x4]
    ldr r3, [ip, #0xc]
    and r2, r3, #0xf00
    mov r2, r2, lsr #0x8
    cmp r2, #0x1
    bne L_021fd1a4
    and r2, r3, #0xff
    cmp r2, #0x8
    beq L_021fd1a4
    ldrh r2, [ip, #0x4]
    cmp r2, #0x1
    moveq r0, lr
    ldmeqia sp!, {r4, pc}
L_021fd1a4:
    add lr, lr, #0x1
L_021fd1a8:
    cmp lr, r4
    blt L_021fd164
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
    .size Overlay021_List_FindSpecialRow, . - Overlay021_List_FindSpecialRow

