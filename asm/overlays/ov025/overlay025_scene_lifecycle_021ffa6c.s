.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_destroy.c. */
.extern __destroy_arr
.extern data_020f4e14
.extern data_ov025_02203318
.extern data_ov025_02203370
.extern Sound_ReleaseGroup
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern func_020926f8
.extern func_020927b8
.extern PresentationList_DeleteAll
.extern func_ov025_021fdec8
.extern func_ov025_021ff1c8
.extern func_ov094_022196a4
.extern gSoundContext
.extern Heap_Free


    .global func_ov025_021ffa6c
func_ov025_021ffa6c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021ffc14
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x20]
    ldr r0, L_021ffc18
    bic r1, r1, #0x400
    str r1, [r4, #0x20]
    ldr r0, [r0, #0x0]
    ldr r1, L_021ffc1c
    bl Sound_ReleaseGroup
    add r0, r4, #0xf8
    add r0, r0, #0x400
    bl PresentationList_DeleteAll
    ldr r0, [r4, #0x50c]
    cmp r0, #0x0
    beq L_021ffabc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ffabc:
    ldr r5, [r4, #0x5c0]
    cmp r5, #0x0
    beq L_021ffad8
    mov r0, r5
    bl func_ov094_022196a4
    mov r0, r5
    bl Heap_Free
L_021ffad8:
    ldr r0, L_021ffc20
    mov r5, #0x0
    strh r5, [r0, #0x0]
    add r0, r0, #0x1000
    strh r5, [r0, #0x0]
L_021ffaec:
    add r0, r4, r5, lsl #0x2
    ldr r6, [r0, #0xe4]
    cmp r6, #0x0
    beq L_021ffb1c
    ldr r0, [r6, #0xc]
    bl GraphicsSpriteGroup_Destroy
    add r0, r6, #0x30
    bl func_020927b8
    mov r0, r6
    bl AnimationResourceState_Destroy
    mov r0, r6
    bl Heap_Free
L_021ffb1c:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt L_021ffaec
    ldr r5, [r4, #0x598]
    cmp r5, #0x0
    beq L_021ffb4c
    ldr r0, [r5, #0x0]
    bl GraphicsSpriteGroup_Destroy
    add r0, r5, #0x4
    bl AnimationResourceState_Destroy
    mov r0, r5
    bl Heap_Free
L_021ffb4c:
    ldr r0, [r4, #0x59c]
    cmp r0, #0x0
    beq L_021ffb64
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ffb64:
    ldr r0, [r4, #0xb0]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0xb4]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021ffc24
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x174
    add r0, r0, #0x400
    bl func_020927b8
    add r0, r4, #0x530
    bl func_020926f8
    ldr r1, L_021ffc28
    add r0, r4, #0xf8
    str r1, [r4, #0x4f8]
    add r0, r0, #0x400
    bl PresentationList_DeleteAll
    add r0, r4, #0x2f4
    mov r1, #0x3
    mov r2, #0xac
    ldr r3, L_021ffc2c
    bl __destroy_arr
    add r0, r4, #0x248
    bl func_ov025_021fdec8
    add r0, r4, #0x19c
    bl func_ov025_021fdec8
    add r0, r4, #0xf0
    bl func_ov025_021fdec8
    add r0, r4, #0xa4
    bl AnimationResourceState_Destroy
    add r0, r4, #0x98
    bl AnimationResourceState_Destroy
    add r0, r4, #0x8c
    bl AnimationResourceState_Destroy
    add r0, r4, #0x80
    bl AnimationResourceState_Destroy
    add r0, r4, #0x74
    bl AnimationResourceState_Destroy
    add r0, r4, #0x68
    bl AnimationResourceState_Destroy
    add r0, r4, #0x5c
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021ffc14: .word data_ov025_02203370
L_021ffc18: .word gSoundContext
L_021ffc1c: .word 0x16f
L_021ffc20: .word 0x4000050
L_021ffc24: .word data_020f4e14
L_021ffc28: .word data_ov025_02203318
L_021ffc2c: .word func_ov025_021ff1c8
.size func_ov025_021ffa6c, .-func_ov025_021ffa6c

