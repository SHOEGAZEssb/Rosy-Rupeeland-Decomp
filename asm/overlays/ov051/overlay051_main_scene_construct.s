.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_main_scene_recovery.c.
.extern GX_SetGraphicsMode
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern data_ov051_0220df48
.extern func_02070638
.extern func_02070b50
.extern func_02070e0c
.extern func_02070fd4
.extern func_020af1f8
.extern func_020afd28
.extern func_020b44e8
.extern func_ov051_0220d600
.extern func_ov051_0220dbc4

.global func_ov051_0220dbf0
func_ov051_0220dbf0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_ov051_0220d600
    ldr r1, .L_0220dd00
    add r0, sp, #0x8
    str r1, [r4, #0x0]
    bl GraphicsResourceSet_Init
    ldr r1, .L_0220dd04
    str r5, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r7
    mov r3, r6
    add r0, sp, #0x8
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0x10]
    bl func_02070fd4
    bl func_020b44e8
    mov r0, #0x10
    bl func_020af1f8
    mov r0, #0x1
    mov r1, #0x5
    mov r2, r0
    bl GX_SetGraphicsMode
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    mov r3, #0x4
    bl func_ov051_0220dbc4
    mov r2, #0x4000000
    ldr r0, [r2, #0x0]
    mov r1, #0x2
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1400
    str r0, [r2, #0x0]
    ldr r0, [sp, #0x8]
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0xc]
    mov r1, #0x4000
    bl func_02070b50
    ldr r0, [sp, #0x10]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070e0c
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, .L_0220dd08
    add r1, r4, #0xc10
    mov r2, #0x80
    mov r3, #0x60
    bl func_020afd28
    ldr r0, [r4, #0x4]
    ldr r1, .L_0220dd0c
    bic r0, r0, #0x1
    orr r0, r0, #0x3
    str r0, [r4, #0x4]
    mov r2, #0x0
    add r0, sp, #0x8
    strh r2, [r1, #0x0]
    bl GraphicsResourceSet_Destroy
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0220dd00: .word data_ov051_0220df48
.L_0220dd04: .word data_020f4e18
.L_0220dd08: .word 0x4000020
.L_0220dd0c: .word 0x4000050
.size func_ov051_0220dbf0, . - func_ov051_0220dbf0
