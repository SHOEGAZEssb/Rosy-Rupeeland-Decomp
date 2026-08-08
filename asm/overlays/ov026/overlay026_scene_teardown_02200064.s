.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_teardown.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov026_022048b8
.extern data_ov026_02204944
.extern func_0205940c
.extern func_02071e04
.extern func_020720d4
.extern func_02075020
.extern func_020775d8
.extern func_02077ac4
.extern func_02092314
.extern func_020923a0
.extern func_02092418
.extern func_02095308
.extern func_ov048_0220b7b4
.extern gDebugFont
.extern gSoundContext
.extern GX_SetGraphicsMode
.extern Heap_Free


    .global func_ov026_02200064
func_ov026_02200064:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, L_022001a0
    mov r4, r0
    mov r1, #0x3d
    mov r2, #0x8
    str r3, [r4, #0x0]
    bl func_02092314
    ldr r0, L_022001a4
    mov r1, #0x22
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205940c
    ldr r1, [r4, #0x20]
    add r0, r4, #0x2f4
    bic r1, r1, #0x400
    str r1, [r4, #0x20]
    bl func_02095308
    add r0, r4, #0x304
    bl func_02095308
    add r0, r4, #0x314
    bl func_02095308
    ldr r0, L_022001a8
    ldr r1, [r4, #0x15c]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    ldr r5, [r4, #0x68]
    cmp r5, #0x0
    beq L_022000e4
    mov r0, r5
    bl func_020775d8
    mov r0, r5
    bl Heap_Free
L_022000e4:
    ldr r0, L_022001ac
    ldr r0, [r0, #0x0]
    bl func_02075020
    ldr r0, L_022001b0
    ldr r0, [r0, #0x0]
    bl func_02075020
    add r0, r4, #0x328
    bl func_02092418
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
    ldr r0, L_022001b4
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    add r0, r4, #0x370
    strh r2, [r1, #0x0]
    bl func_ov048_0220b7b4
    add r0, r4, #0x328
    bl func_020923a0
    ldr r1, L_022001b8
    add r0, r4, #0x314
    str r1, [r4, #0x314]
    bl func_02095308
    ldr r1, L_022001b8
    add r0, r4, #0x304
    str r1, [r4, #0x304]
    bl func_02095308
    ldr r1, L_022001b8
    add r0, r4, #0x2f4
    str r1, [r4, #0x2f4]
    bl func_02095308
    add r0, r4, #0x180
    bl func_02077ac4
    add r0, r4, #0xac
    bl func_020720d4
    add r0, r4, #0xa0
    bl func_020720d4
    add r0, r4, #0x94
    bl func_020720d4
    add r0, r4, #0x88
    bl func_020720d4
    add r0, r4, #0x7c
    bl func_020720d4
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_022001a0: .word data_ov026_02204944
L_022001a4: .word gSoundContext
L_022001a8: .word data_020f4e18
L_022001ac: .word data_020f4e14
L_022001b0: .word gDebugFont
L_022001b4: .word 0x4000050
L_022001b8: .word data_ov026_022048b8
.size func_ov026_02200064, .-func_ov026_02200064

