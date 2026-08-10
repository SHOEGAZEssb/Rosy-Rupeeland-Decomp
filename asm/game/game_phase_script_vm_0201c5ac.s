; Matching retail form; see src/graphics/sub_bg_runtime_control.c.
.text
.extern BgScroll_SetSubBg0
.extern BgScroll_SetSubBg1
.extern BgScroll_SetSubBg2
.extern BgScroll_SetSubBg3
.global GraphicsSubBackground_SetScroll
GraphicsSubBackground_SetScroll: ; 0x0201c5ac
    stmdb sp!, {r3, lr}
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_0201c608
L_0201c5bc: ; jump table
    b L_0201c5cc ; case 0
    b L_0201c5dc ; case 1
    b L_0201c5ec ; case 2
    b L_0201c5fc ; case 3
L_0201c5cc:
    mov r0, r1
    mov r1, r2
    bl BgScroll_SetSubBg0
    b L_0201c608
L_0201c5dc:
    mov r0, r1
    mov r1, r2
    bl BgScroll_SetSubBg1
    b L_0201c608
L_0201c5ec:
    mov r0, r1
    mov r1, r2
    bl BgScroll_SetSubBg2
    b L_0201c608
L_0201c5fc:
    mov r0, r1
    mov r1, r2
    bl BgScroll_SetSubBg3
L_0201c608:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size GraphicsSubBackground_SetScroll, . - GraphicsSubBackground_SetScroll
