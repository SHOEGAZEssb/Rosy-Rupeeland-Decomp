.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern func_020706c4
.extern func_02070bc4
.extern func_02070eac
.extern func_02070f34
.extern func_020b44e8

.global func_ov059_02211870
func_ov059_02211870:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_02211914
    ldr r0, .L_02211918
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    ldr r2, .L_0221191c
    mov r1, #0xf
    ldrh r0, [r2, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x4
    orr r0, r0, #0x1800
    strh r0, [r2, #0x0]
    ldrh r0, [r2, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r2, #0x0]
    ldr r0, [sp, #0xc]
    bl func_02070f34
    bl func_020b44e8
    mov r1, #0x0
    ldr r0, [sp, #0x4]
    mov r2, r1
    bl func_020706c4
    mov r1, #0x0
    ldr r0, [sp, #0xc]
    mov r2, r1
    bl func_02070eac
    ldr r0, [sp, #0x8]
    mov r1, #0x1e0
    bl func_02070bc4
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.L_02211914: .word 0xb00f
.L_02211918: .word data_020f4e18
.L_0221191c: .word 0x4001008
.size func_ov059_02211870, . - func_ov059_02211870
