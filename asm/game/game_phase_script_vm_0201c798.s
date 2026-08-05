; Matching retail form; see src/graphics/main_bg_control.c.
.text
.extern GX_SetGraphicsMode
.extern OS_Halt
.global func_0201c798
func_0201c798: ; 0x0201c798
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r2
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_0201c7dc
L_0201c7b0: ; jump table
    b L_0201c7c0 ; case 0
    b L_0201c7c8 ; case 1
    b L_0201c7d0 ; case 2
    b L_0201c7d8 ; case 3
L_0201c7c0:
    mov r4, #0x0
    b L_0201c7dc
L_0201c7c8:
    mov r4, #0x1
    b L_0201c7dc
L_0201c7d0:
    mov r4, #0x2
    b L_0201c7dc
L_0201c7d8:
    mov r4, #0x3
L_0201c7dc:
    cmp r3, #0x3
    addls pc, pc, r3, lsl #0x2
    b L_0201c828
L_0201c7e8: ; jump table
    b L_0201c7f8 ; case 0
    b L_0201c810 ; case 1
    b L_0201c818 ; case 2
    b L_0201c820 ; case 3
L_0201c7f8:
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
    mov r5, #0x0
    b L_0201c82c
L_0201c810:
    mov r5, #0x1
    b L_0201c82c
L_0201c818:
    mov r5, #0x2
    b L_0201c82c
L_0201c820:
    mov r5, #0x3
    b L_0201c82c
L_0201c828:
    bl OS_Halt
L_0201c82c:
    ldr r0, L_0201c918
    mov r1, #0x0
    strh r1, [r0, #0x0]
    cmp r7, #0x3
    addls pc, pc, r7, lsl #0x2
    b L_0201c910
L_0201c844: ; jump table
    b L_0201c854 ; case 0
    b L_0201c884 ; case 1
    b L_0201c8b4 ; case 2
    b L_0201c8e4 ; case 3
L_0201c854:
    sub r1, r0, #0x48
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, r4, lsl #0xe
    orr r0, r0, #0x1800
    orr r0, r0, r5, lsl #0x2
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r6
    strh r0, [r1, #0x0]
    b L_0201c910
L_0201c884:
    sub r1, r0, #0x46
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, r4, lsl #0xe
    orr r0, r0, #0x1a00
    orr r0, r0, r5, lsl #0x2
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r6
    strh r0, [r1, #0x0]
    b L_0201c910
L_0201c8b4:
    sub r1, r0, #0x44
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, r4, lsl #0xe
    orr r0, r0, #0x1c00
    orr r0, r0, r5, lsl #0x2
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r6
    strh r0, [r1, #0x0]
    b L_0201c910
L_0201c8e4:
    sub r1, r0, #0x42
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, r4, lsl #0xe
    orr r0, r0, #0x1e00
    orr r0, r0, r5, lsl #0x2
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, r6
    strh r0, [r1, #0x0]
L_0201c910:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201c918: .word 0x4000050
.size func_0201c798, . - func_0201c798
