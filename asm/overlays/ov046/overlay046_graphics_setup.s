.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_graphics_recovery.c.
.extern GraphicsResourceSet_Apply
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e14
.extern data_020f4e18
.extern func_02070f34
.extern func_02072000
.extern func_02072048
.extern func_020925a4
.extern func_020925dc
.extern func_020925f8
.extern func_02092618
.extern func_02092638
.extern func_02092688
.extern func_020b44e8
.extern func_ov046_0220bd14

.global func_ov046_0220bac0
func_ov046_0220bac0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r0, [r4, #0x114]
    cmp r0, #0x0
    bne .L_0220bb04
    ldr r3, .L_0220bc68
    ldr r0, .L_0220bc6c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b .L_0220bb24
.L_0220bb04:
    ldr r3, .L_0220bc70
    ldr r0, .L_0220bc6c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
.L_0220bb24:
    ldr r0, [sp, #0xc]
    mov r1, #0xf
    bl func_02070f34
    bl func_020b44e8
    ldr r0, .L_0220bc74
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    cmp r1, r0
    mov r0, #0x0
    bne .L_0220bbcc
    bl func_020925a4
    ldr r1, .L_0220bc78
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
    orr r0, r0, #0xc00
    strh r0, [r1, #0x6]
    bl func_020925f8
    mov r0, #0x2
    mov r1, r0
    mov r2, r0
    mov r3, #0x3
    bl func_02092638
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x1e0
    bl func_02072048
    b .L_0220bc48
.L_0220bbcc:
    bl func_020925dc
    ldr r1, .L_0220bc7c
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
    orr r0, r0, #0xc00
    strh r0, [r1, #0x6]
    bl func_02092618
    mov r0, #0x2
    mov r1, r0
    mov r2, r0
    mov r3, #0x3
    bl func_02092688
    add r0, sp, #0x4
    mov r1, #0x3
    mov r2, #0x1e0
    bl GraphicsResourceSet_Apply
.L_0220bc48:
    add r0, sp, #0x4
    bl func_02072000
    mov r0, r4
    bl func_ov046_0220bd14
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_0220bc68: .word 0xb10c
.L_0220bc6c: .word data_020f4e18
.L_0220bc70: .word 0xc011
.L_0220bc74: .word data_020f4e14
.L_0220bc78: .word 0x4000008
.L_0220bc7c: .word 0x4001008
.size func_ov046_0220bac0, . - func_ov046_0220bac0
