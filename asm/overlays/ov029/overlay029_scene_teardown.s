.text

/* Exact fallback; see src/overlays/ov029/overlay029_scene_teardown.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern gGamePhaseRuntime
.extern data_ov029_021fecfc
.extern RuntimePresentationManager_BroadcastSlot1C
.extern func_02071c38
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern func_020927b8
.extern func_ov002_021fb9c4
.extern func_ov045_0220b8cc
.extern func_ov045_0220d2d8
.extern gDebugFont
.extern Heap_Free


    .global func_ov029_021fd174
func_ov029_021fd174:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd288
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    mvn r1, #0x0
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x70]
    cmp r0, r1
    beq L_021fd1a4
    bl func_ov045_0220d2d8
L_021fd1a4:
    ldr r5, [r4, #0xd0]
    cmp r5, #0x0
    beq L_021fd1c0
    mov r0, r5
    bl func_ov045_0220b8cc
    mov r0, r5
    bl Heap_Free
L_021fd1c0:
    ldr r5, [r4, #0xa8]
    cmp r5, #0x0
    beq L_021fd1dc
    mov r0, r5
    bl func_ov002_021fb9c4
    mov r0, r5
    bl Heap_Free
L_021fd1dc:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fd1f4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd1f4:
    ldr r0, [r4, #0xa4]
    cmp r0, #0x0
    beq L_021fd20c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd20c:
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    beq L_021fd224
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd224:
    ldr r0, L_021fd28c
    ldr r1, [r4, #0xe8]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, L_021fd290
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    ldr r0, L_021fd294
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fd298
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fd29c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_BroadcastSlot1C
    add r0, r4, #0x78
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd288: .word data_ov029_021fecfc
L_021fd28c: .word data_020f4e18
L_021fd290: .word 0x4000050
L_021fd294: .word data_020f4e14
L_021fd298: .word gDebugFont
L_021fd29c: .word gGamePhaseRuntime
.size func_ov029_021fd174, .-func_ov029_021fd174
    .global func_ov029_021fd2a0
func_ov029_021fd2a0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd3bc
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    mvn r1, #0x0
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x70]
    cmp r0, r1
    beq L_021fd2d0
    bl func_ov045_0220d2d8
L_021fd2d0:
    ldr r5, [r4, #0xd0]
    cmp r5, #0x0
    beq L_021fd2ec
    mov r0, r5
    bl func_ov045_0220b8cc
    mov r0, r5
    bl Heap_Free
L_021fd2ec:
    ldr r5, [r4, #0xa8]
    cmp r5, #0x0
    beq L_021fd308
    mov r0, r5
    bl func_ov002_021fb9c4
    mov r0, r5
    bl Heap_Free
L_021fd308:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fd320
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd320:
    ldr r0, [r4, #0xa4]
    cmp r0, #0x0
    beq L_021fd338
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd338:
    ldr r0, [r4, #0x9c]
    cmp r0, #0x0
    beq L_021fd350
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd350:
    ldr r0, L_021fd3c0
    ldr r1, [r4, #0xe8]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, L_021fd3c4
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    ldr r0, L_021fd3c8
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fd3cc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fd3d0
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_BroadcastSlot1C
    add r0, r4, #0x78
    bl func_020927b8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd3bc: .word data_ov029_021fecfc
L_021fd3c0: .word data_020f4e18
L_021fd3c4: .word 0x4000050
L_021fd3c8: .word data_020f4e14
L_021fd3cc: .word gDebugFont
L_021fd3d0: .word gGamePhaseRuntime
.size func_ov029_021fd2a0, .-func_ov029_021fd2a0
