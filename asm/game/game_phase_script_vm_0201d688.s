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
.extern GamePhaseRuntime_PrepareActorCollections
.extern GamePhaseRuntime_FinalizeActorCollections
.extern GamePhaseRuntime_SynchronizeActorPlacement
.extern func_0201dcec
.extern func_02009d78
.extern func_02010e68
.extern data_020d5dcc
.extern data_020d5df8
.extern data_020d36e1
.extern data_021052fc
.extern gLupyContext
.extern gHeapContext
.global func_0201d688
func_0201d688: ; 0x0201d688
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl Scene_Init
    ldr r1, L_0201d73c
    add r0, r4, #0x30
    str r1, [r4, #0x0]
    bl OverlaySlot_Init
    ldr r1, L_0201d740
    add r0, r4, #0x30
    str r5, [r4, #0x24]
    bl OverlaySlot_LoadOverlay
    mov r0, #0xd4
    ldr r1, L_0201d744
    mov r2, #0x4
    ldr r3, L_0201d748
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201d6dc
    mov r1, r5
    bl func_ov033_021fd070 ; func_ov039_021fd070
L_0201d6dc:
    ldr r1, L_0201d74c
    str r0, [r4, #0x3c]
    ldr r0, [r1, #0x0]
    ldr r1, L_0201d750
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r0, [r4, #0x2c]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
    ldr r3, [r4, #0x2c]
    ldr r1, L_0201d74c
    ldr r2, [r3, #0x14]
    mov r0, r4
    orr r2, r2, #0x40
    str r2, [r3, #0x14]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x3000
    ldr r1, [r1, #0xbc]
    ldr r1, [r1, #0x0]
    str r1, [r4, #0x28]
    bl Scene_SetFlags03
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_0201d73c: .word data_020d5dcc
L_0201d740: .word 0x21
L_0201d744: .word data_020d5df8
L_0201d748: .word gHeapContext
L_0201d74c: .word data_021052fc
L_0201d750: .word data_020d36e1


.size func_0201d688, . - func_0201d688
