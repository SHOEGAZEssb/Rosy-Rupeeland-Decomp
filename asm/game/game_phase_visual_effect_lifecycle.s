; Matching retail form; see src/game/game_phase_visual_effect_lifecycle.c.
.text
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern Heap_Free
.extern data_020d55e0
.extern func_02004fe0
.extern func_02005058
.extern VecFx32Stepper_Init
.extern VecFx32Stepper_Destroy
.extern func_02072000

    .global func_0200fa40
func_0200fa40: ; 0x0200fa40
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, L_0200fb2c
    add r0, r4, #0x4
    str r1, [r4, #0x0]
    bl GraphicsResourceSet_Init
    mov r0, #0x0
    str r0, [r4, #0x10]
    str r0, [r4, #0x14]
    str r0, [r4, #0x18]
    strh r0, [r4, #0x1c]
    mov r1, #0x1f
    add r0, r4, #0x20
    strh r1, [r4, #0x1e]
    bl func_02004fe0
    add r0, r4, #0x30
    bl func_02004fe0
    add r0, r4, #0x40
    bl func_02004fe0
    add r0, r4, #0x50
    bl func_02004fe0
    add r0, r4, #0x60
    bl VecFx32Stepper_Init
    ldr r1, [r4, #0x94]
    mov r0, #0x0
    bic r3, r1, #0x1
    bic r1, r3, #0x2
    bic r2, r1, #0x4
    orr r1, r2, #0x8
    bic r1, r1, #0xf0
    str r1, [r4, #0x94]
    str r0, [r4, #0x98]
    ldrsh r0, [r4, #0x9c]
    ldr r1, L_0200fb30
    bic r0, r0, #0xf
    strh r0, [r4, #0x9c]
    ldrsh r0, [r4, #0x9c]
    and r0, r0, r1
    strh r0, [r4, #0x9c]
    ldrsh r0, [r4, #0x9e]
    bic r0, r0, #0xf
    strh r0, [r4, #0x9e]
    ldrsh r0, [r4, #0x9e]
    and r0, r0, r1
    strh r0, [r4, #0x9e]
    ldrsh r0, [r4, #0xa0]
    bic r0, r0, #0xf
    strh r0, [r4, #0xa0]
    ldrsh r2, [r4, #0xa0]
    mov r0, r4
    and r2, r2, r1
    strh r2, [r4, #0xa0]
    ldrsh r2, [r4, #0xa2]
    bic r2, r2, #0xf
    strh r2, [r4, #0xa2]
    ldrsh r2, [r4, #0xa2]
    and r1, r2, r1
    strh r1, [r4, #0xa2]
    ldmia sp!, {r4, pc}
L_0200fb2c: .word data_020d55e0
L_0200fb30: .word 0xffff000f
    .size func_0200fa40, . - func_0200fa40

    .global func_0200fb34
func_0200fb34: ; 0x0200fb34
    stmdb sp!, {r4, lr}
    ldr r1, L_0200fbc4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x94]
    add r0, r4, #0x4
    bic r1, r1, #0x1
    str r1, [r4, #0x94]
    mov r1, #0x0
    str r1, [r4, #0x18]
    bl func_02072000
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    mov r1, #0x0
    add r0, r4, #0x60
    strh r1, [r2, #0x50]
    bl VecFx32Stepper_Destroy
    add r0, r4, #0x50
    bl func_02005058
    add r0, r4, #0x40
    bl func_02005058
    add r0, r4, #0x30
    bl func_02005058
    add r0, r4, #0x20
    bl func_02005058
    add r0, r4, #0x4
    bl GraphicsResourceSet_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200fbc4: .word data_020d55e0
    .size func_0200fb34, . - func_0200fb34

    .global func_0200fbc8
func_0200fbc8: ; 0x0200fbc8
    stmdb sp!, {r4, lr}
    ldr r1, L_0200fc60
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x94]
    add r0, r4, #0x4
    bic r1, r1, #0x1
    str r1, [r4, #0x94]
    mov r1, #0x0
    str r1, [r4, #0x18]
    bl func_02072000
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    mov r1, #0x0
    add r0, r4, #0x60
    strh r1, [r2, #0x50]
    bl VecFx32Stepper_Destroy
    add r0, r4, #0x50
    bl func_02005058
    add r0, r4, #0x40
    bl func_02005058
    add r0, r4, #0x30
    bl func_02005058
    add r0, r4, #0x20
    bl func_02005058
    add r0, r4, #0x4
    bl GraphicsResourceSet_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200fc60: .word data_020d55e0
    .size func_0200fbc8, . - func_0200fbc8

