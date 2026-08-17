    .text
/* Exact fallback; see src/overlays/ov019/overlay019_scene_construct.c. */
    .extern GameWork_ClearFlag
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_ov019_021fd5f8
    .extern data_ov019_021fd638
    .extern data_ov019_021fd64c
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern SceneInputBase_Init
    .extern func_ov000_021fb6e0
    .extern func_ov019_021fce00
    .extern Overlay019_SetupGraphics
    .extern gDebugFont
    .extern gGameWork
    .extern gHeapContext

.global func_ov019_021fce28
func_ov019_021fce28:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl SceneInputBase_Init
    ldr r1, L_021fcf10
    ldr r0, L_021fcf14
    str r1, [r4, #0x0]
    str r6, [r4, #0x54]
    str r5, [r4, #0x58]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021fcf18
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl Overlay019_SetupGraphics
    mov r0, #0x0
    str r0, [r4, #0x60]
    ldr r0, [r4, #0x58]
    mov r2, #0x4
    cmp r0, #0x0
    mov r0, #0xb4
    bne L_021fceb4
    ldr r1, L_021fcf1c
    ldr r3, L_021fcf20
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fceac
    ldr r1, L_021fcf14
    mov r2, #0x0
    ldr r1, [r1, #0x0]
    bl func_ov000_021fb6e0 ; shared retail slot contains overlay 2 here
L_021fceac:
    str r0, [r4, #0x5c]
    b L_021fcedc
L_021fceb4:
    ldr r1, L_021fcf1c
    ldr r3, L_021fcf20
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fced8
    ldr r1, L_021fcf18
    mov r2, #0x0
    ldr r1, [r1, #0x0]
    bl func_ov000_021fb6e0 ; shared retail slot contains overlay 2 here
L_021fced8:
    str r0, [r4, #0x5c]
L_021fcedc:
    ldr r0, L_021fcf24
    mov r1, #0x390
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, [r4, #0x20]
    ldr r1, L_021fcf28
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov019_021fce00
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021fcf10: .word data_ov019_021fd638
L_021fcf14: .word data_020f4e14
L_021fcf18: .word gDebugFont
L_021fcf1c: .word data_ov019_021fd64c
L_021fcf20: .word gHeapContext
L_021fcf24: .word gGameWork
L_021fcf28: .word data_ov019_021fd5f8
    .size func_ov019_021fce28, . - func_ov019_021fce28
