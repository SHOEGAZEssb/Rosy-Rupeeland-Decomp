.text
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern Heap_Free
.extern OverlaySlot_Destroy
.extern OverlaySlot_UnloadOverlay
.extern VecFx32Object_Destroy
.extern data_020f4e14
.extern func_0209f088
.extern func_ov007_021fb768
.extern func_ov039_021fd71c
.extern func_ov039_02201118
.extern func_ov039_02205b94
.extern func_ov049_0220ba98
.extern func_ov069_0221193c
.extern gDebugFont

.global func_0209e198
func_0209e198:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r5, [r4, #0x20]
    cmp r5, #0x0
    beq .L_0209e1bc
    mov r0, r5
    bl func_ov007_021fb768
    mov r0, r5
    bl Heap_Free
.L_0209e1bc:
    ldr r5, [r4, #0x1c]
    cmp r5, #0x0
    beq .L_0209e1d8
    mov r0, r5
    bl func_ov069_0221193c
    mov r0, r5
    bl Heap_Free
.L_0209e1d8:
    ldr r5, [r4, #0x18]
    cmp r5, #0x0
    beq .L_0209e1f4
    mov r0, r5
    bl func_ov039_02201118
    mov r0, r5
    bl Heap_Free
.L_0209e1f4:
    ldr r5, [r4, #0x14]
    cmp r5, #0x0
    beq .L_0209e210
    mov r0, r5
    bl func_ov039_021fd71c
    mov r0, r5
    bl Heap_Free
.L_0209e210:
    ldr r5, [r4, #0x10]
    cmp r5, #0x0
    beq .L_0209e22c
    mov r0, r5
    bl func_0209f088
    mov r0, r5
    bl Heap_Free
.L_0209e22c:
    ldr r5, [r4, #0xc]
    cmp r5, #0x0
    beq .L_0209e248
    mov r0, r5
    bl func_ov049_0220ba98
    mov r0, r5
    bl Heap_Free
.L_0209e248:
    ldr r5, [r4, #0x8]
    cmp r5, #0x0
    beq .L_0209e264
    mov r0, r5
    bl func_ov039_02205b94
    mov r0, r5
    bl Heap_Free
.L_0209e264:
    add r0, r4, #0xb8
    bl OverlaySlot_UnloadOverlay
    add r0, r4, #0xac
    bl OverlaySlot_UnloadOverlay
    add r0, r4, #0xa0
    bl OverlaySlot_UnloadOverlay
    add r0, r4, #0x94
    bl OverlaySlot_UnloadOverlay
    ldr r0, .L_0209e2ec
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, .L_0209e2f0
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    add r0, r4, #0xb8
    bl OverlaySlot_Destroy
    add r0, r4, #0xac
    bl OverlaySlot_Destroy
    add r0, r4, #0xa0
    bl OverlaySlot_Destroy
    add r0, r4, #0x94
    bl OverlaySlot_Destroy
    add r0, r4, #0x60
    bl VecFx32Object_Destroy
    add r0, r4, #0x50
    bl VecFx32Object_Destroy
    add r0, r4, #0x34
    bl VecFx32Object_Destroy
    add r0, r4, #0x24
    bl VecFx32Object_Destroy
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0209e2ec: .word data_020f4e14
.L_0209e2f0: .word gDebugFont
.size func_0209e198, . - func_0209e198
