.text

/* Exact fallback; see src/overlays/ov026/overlay026_effect_container.c. */
.extern data_020f4e18
.extern data_ov026_02204960
.extern GraphicsArchive_ReleaseOwlvResource
.extern Graphics3DResourceBinding_Destroy
.extern func_ov026_021fce50
.extern Heap_Free


    .global func_ov026_021ff2d0
func_ov026_021ff2d0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021ff3d8
    mov r4, r0
    str r1, [r4, #0x0]
    mov r5, #0x0
L_021ff2e4:
    add r0, r4, r5, lsl #0x2
    ldr r6, [r0, #0xfc]
    cmp r6, #0x0
    beq L_021ff304
    mov r0, r6
    bl Graphics3DResourceBinding_Destroy
    mov r0, r6
    bl Heap_Free
L_021ff304:
    add r5, r5, #0x1
    cmp r5, #0x8
    blt L_021ff2e4
    mov r5, #0x0
    b L_021ff338
L_021ff318:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0xa0]
    cmp r0, #0x0
    beq L_021ff334
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff334:
    add r5, r5, #0x1
L_021ff338:
    ldr r0, [r4, #0x9c]
    cmp r5, r0
    blt L_021ff318
    ldr r0, [r4, #0xe0]
    cmp r0, #0x0
    beq L_021ff35c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff35c:
    ldr r0, [r4, #0xe4]
    cmp r0, #0x0
    beq L_021ff374
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff374:
    ldr r0, [r4, #0xe8]
    cmp r0, #0x0
    beq L_021ff38c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff38c:
    mov r5, #0x0
L_021ff390:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0xec]
    cmp r0, #0x0
    beq L_021ff3ac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff3ac:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt L_021ff390
    ldr r0, L_021ff3dc
    ldr r1, [r4, #0x11c]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseOwlvResource
    mov r0, r4
    bl func_ov026_021fce50
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021ff3d8: .word data_ov026_02204960
L_021ff3dc: .word data_020f4e18
.size func_ov026_021ff2d0, .-func_ov026_021ff2d0

