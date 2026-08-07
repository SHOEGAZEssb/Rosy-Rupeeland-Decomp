.text

/* Exact fallback; see src/overlays/ov024/overlay024_graphics_setup.c. */
.extern data_020f4e18
.extern func_02070638
.extern func_02070874
.extern func_02070b50
.extern func_02070e0c
.extern func_02072048
.extern func_020925a4
.extern func_020925f8
.extern func_02092638
.extern func_02092850
.extern func_020afce8
.extern func_020b44e8
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load


    .global func_ov024_021fd2f8
func_ov024_021fd2f8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r3, L_021fd828
    mov r4, r0
    ldrh r2, [r3, #0x0]
    mov r1, #0x1f
    mov r0, #0x0
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r4, #0x48]
    bl func_020925a4
    ldr r1, L_021fd82c
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x8
    orr r0, r0, #0xe000
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x410
    orr r0, r0, #0xe000
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0x18
    orr r0, r0, #0xc800
    strh r0, [r1, #0x4]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0x14
    orr r0, r0, #0xc00
    strh r0, [r1, #0x6]
    bl func_020925f8
    mov r0, #0x2
    mov r1, r0
    mov r2, r0
    mov r3, #0x3
    bl func_02092638
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    add r0, r2, #0x50
    bic r1, r1, #0xe000
    orr r1, r1, #0x8000
    str r1, [r2, #0x0]
    mov r1, #0x1f
    mov r2, #0x0
    bl func_020afce8
    ldr r2, L_021fd830
    add r0, sp, #0x4
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3f00
    orr r1, r1, #0x3f00
    strh r1, [r2, #0x0]
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3f
    orr r1, r1, #0x1f
    strh r1, [r2, #0x0]
    bl GraphicsResourceSet_Init
    ldr r0, [r4, #0x58]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b L_021fd64c
L_021fd3f0: ; jump table
    b L_021fd64c ; case 0
    b L_021fd418 ; case 1
    b L_021fd418 ; case 2
    b L_021fd418 ; case 3
    b L_021fd418 ; case 4
    b L_021fd544 ; case 5
    b L_021fd544 ; case 6
    b L_021fd544 ; case 7
    b L_021fd64c ; case 8
    b L_021fd64c ; case 9
L_021fd418:
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_021fd4c4
L_021fd424: ; jump table
    b L_021fd4c4 ; case 0
    b L_021fd438 ; case 1
    b L_021fd45c ; case 2
    b L_021fd480 ; case 3
    b L_021fd4a4 ; case 4
L_021fd438:
    ldr r3, L_021fd834
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fd4c4
L_021fd45c:
    ldr r3, L_021fd83c
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    b L_021fd4c4
L_021fd480:
    ldr r3, L_021fd840
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x5
    bl GraphicsResourceSet_Load
    b L_021fd4c4
L_021fd4a4:
    ldr r3, L_021fd844
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x7
    bl GraphicsResourceSet_Load
L_021fd4c4:
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl func_02072048
    ldr r3, L_021fd848
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x9
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x1
    mov r2, #0x0
    bl func_02072048
    ldr r3, L_021fd84c
    ldr r1, L_021fd838
    str r3, [sp, #0x0]
    sub r2, r3, #0x1
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x11
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    bl func_02072048
    b L_021fd748
L_021fd544:
    ldr r3, L_021fd844
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x7
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl func_02072048
    ldr r0, [r4, #0x58]
    cmp r0, #0x5
    beq L_021fd598
    cmp r0, #0x6
    beq L_021fd5bc
    cmp r0, #0x7
    beq L_021fd5e0
    b L_021fd600
L_021fd598:
    ldr r3, L_021fd850
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0xb
    bl GraphicsResourceSet_Load
    b L_021fd600
L_021fd5bc:
    ldr r3, L_021fd854
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0xd
    bl GraphicsResourceSet_Load
    b L_021fd600
L_021fd5e0:
    ldr r3, L_021fd858
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0xf
    bl GraphicsResourceSet_Load
L_021fd600:
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x1
    mov r2, #0x0
    bl func_02072048
    ldr r3, L_021fd84c
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x11
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    bl func_02072048
    b L_021fd748
L_021fd64c:
    ldr r3, L_021fd844
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x7
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl func_02072048
    ldr r3, L_021fd858
    ldr r1, L_021fd838
    str r3, [sp, #0x0]
    sub r2, r3, #0x1
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0xf
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    add r0, sp, #0x4
    mov r1, #0x1
    mov r2, #0x0
    bl func_02072048
    ldr r0, [r4, #0x58]
    cmp r0, #0x8
    beq L_021fd6cc
    cmp r0, #0x9
    beq L_021fd6f0
    b L_021fd714
L_021fd6cc:
    ldr r3, L_021fd85c
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x13
    bl GraphicsResourceSet_Load
    b L_021fd734
L_021fd6f0:
    ldr r3, L_021fd860
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x15
    bl GraphicsResourceSet_Load
    b L_021fd734
L_021fd714:
    ldr r3, L_021fd864
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x1
    add r0, sp, #0x4
    sub r3, r3, #0x17
    bl GraphicsResourceSet_Load
L_021fd734:
    bl func_020b44e8
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    bl func_02072048
L_021fd748:
    ldr r3, L_021fd868
    ldr r0, L_021fd838
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0xc]
    mov r2, #0x400
    mov r1, #0x0
    ldr r0, [r0, #0x24]
    rsb r2, r2, #0x0
    b L_021fd7bc
L_021fd780:
    ldrh r3, [r0, #0x0]
    add r1, r1, #0x1
    bic r3, r3, #0xf000
    orr r3, r3, #0xf000
    strh r3, [r0, #0x0]
    ldrh r4, [r0, #0x0]
    mov r3, r4, lsl #0x16
    mov r3, r3, lsr #0x16
    add r3, r3, #0x100
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    and r4, r4, r2
    and r3, r3, r2, lsr #0x16
    orr r3, r4, r3
    strh r3, [r0], #0x2
L_021fd7bc:
    ldr r3, [sp, #0xc]
    ldr r3, [r3, #0x20]
    ldr r4, [r3, #0xc]
    ldr r3, [r3, #0x10]
    mul r3, r4, r3
    cmp r1, r3
    blt L_021fd780
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    mov r2, #0x2000
    bl func_02070638
    ldr r0, [sp, #0x8]
    mov r1, #0x1e0
    bl func_02070b50
    ldr r0, [sp, #0xc]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0x8]
    bl func_02070874
    ldrh r0, [r0, #0x0]
    bl func_02092850
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fd828: .word 0x4000304
L_021fd82c: .word 0x4000008
L_021fd830: .word 0x400004a
L_021fd834: .word 0xb088
L_021fd838: .word data_020f4e18
L_021fd83c: .word 0xb08a
L_021fd840: .word 0xb08c
L_021fd844: .word 0xb08e
L_021fd848: .word 0xb090
L_021fd84c: .word 0xb098
L_021fd850: .word 0xb092
L_021fd854: .word 0xb094
L_021fd858: .word 0xb096
L_021fd85c: .word 0xb09a
L_021fd860: .word 0xb09c
L_021fd864: .word 0xb09e
L_021fd868: .word 0xc00e
.size func_ov024_021fd2f8, .-func_ov024_021fd2f8

