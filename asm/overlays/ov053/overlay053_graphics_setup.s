.text
; Matching fallback for the portable implementation in src/overlays/ov053/overlay053_recovery.c.
.extern BgScroll_SetMainBg2
.extern BgScroll_SetSubBg2
.extern GraphicsResourceSet_Apply
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern GraphicsResourceSet_ReleaseHandles
.extern GraphicsResourceSet_ApplyToMainBg

.global func_ov053_0220da60
func_ov053_0220da60:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_0220db58
    ldr r0, .L_0220db5c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsResourceSet_ApplyToMainBg
    add r0, sp, #0x4
    bl GraphicsResourceSet_ReleaseHandles
    ldr ip, .L_0220db60
    ldr r3, .L_0220db64
    ldrh r2, [ip, #0x0]
    ldr r1, .L_0220db5c
    add r0, sp, #0x4
    and r2, r2, #0x43
    orr r2, r2, #0x1a00
    strh r2, [ip, #0x0]
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    add r0, sp, #0x4
    mov r1, #0x2
    mov r2, #0x0
    bl GraphicsResourceSet_Apply
    ldr r3, .L_0220db68
    mov r0, #0x0
    ldr r2, [r3, #0x0]
    ldr r1, [r3, #0x0]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, ip, #0x4
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    mov r1, r0
    bl BgScroll_SetMainBg2
    mov r0, #0x0
    mov r1, r0
    bl BgScroll_SetSubBg2
    ldr r3, .L_0220db6c
    add r0, sp, #0x4
    ldrh r1, [r3, #0x0]
    add r2, r3, #0x1000
    bic r1, r1, #0x3
    strh r1, [r3, #0x0]
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3
    strh r1, [r2, #0x0]
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_0220db58: .word 0xa131
.L_0220db5c: .word data_020f4e18
.L_0220db60: .word 0x400100c
.L_0220db64: .word 0xa12e
.L_0220db68: .word 0x4001000
.L_0220db6c: .word 0x400000c
.size func_ov053_0220da60, . - func_ov053_0220da60
