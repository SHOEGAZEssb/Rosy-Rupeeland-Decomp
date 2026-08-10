; Matching retail form; see src/game/overlay33_runtime_scene.c.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern Scene_Destroy
.extern Heap_Alloc
.extern Heap_Free
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern OverlaySlot_LoadOverlay
.extern OverlaySlot_UnloadOverlay
.extern func_ov033_021fd070
.extern func_ov030_021fd260
.extern func_ov014_021fd2f8
.extern func_ov033_021fd37c
.extern func_ov033_021fd324
.extern func_02008b50
.extern func_02007908
.extern func_02007a24
.extern func_02008148
.extern func_0201dcec
.extern func_02009d78
.extern func_02010e68
.extern data_020d5dcc
.extern data_020d5df8
.extern data_020d36e1
.extern data_021052fc
.extern gLupyContext
.extern gHeapContext
.global func_0201d7e8
func_0201d7e8: ; 0x0201d7e8
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_0201d880
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r2, [r4, #0x2c]
    mov r1, #0x0
    ldr r0, [r2, #0x14]
    bic r0, r0, #0x40
    str r0, [r2, #0x14]
    ldr r0, [r4, #0x2c]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
    ldr r1, [r4, #0x2c]
    ldr r0, [r1, #0x10]
    bic r0, r0, #0x8
    str r0, [r1, #0x10]
    ldr r1, [r4, #0x2c]
    ldr r0, [r1, #0x10]
    bic r0, r0, #0x1000000
    str r0, [r1, #0x10]
    ldr r5, [r4, #0x3c]
    cmp r5, #0x0
    beq L_0201d858
    mov r0, r5
    bl func_ov030_021fd260 ; func_ov033_021fd260
    mov r0, r5
    bl Heap_Free
L_0201d858:
    add r0, r4, #0x30
    bl OverlaySlot_UnloadOverlay
    add r0, r4, #0x30
    bl OverlaySlot_Destroy
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_0201d880: .word data_020d5dcc


.size func_0201d7e8, . - func_0201d7e8
