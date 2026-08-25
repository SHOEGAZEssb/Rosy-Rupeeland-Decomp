; Matching retail form; see src/game/rotating_core_effect_controller.c.
.text
.extern Heap_Alloc
.extern data_020d6a70
.extern data_020d6a90
.extern data_020d6a98
.extern VecFx32Object_InitCopy
.extern AnimationResource_Init
.extern FieldEffect_Init
.extern func_0206b628
.extern AuxiliaryCoreSprite_SetVisible
.extern gHeapContext

    .global RotatingCoreEffectController_Init
    .type RotatingCoreEffectController_Init, @function
RotatingCoreEffectController_Init: ; 0x02025300
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    mov r6, r0
    mov r7, r1
    mov r5, r2
    mov r4, r3
    bl FieldEffect_Init
    ldr r2, .L_02025484
    mov r1, r7
    add r0, r6, #0x18
    str r2, [r6, #0x0]
    bl VecFx32Object_InitCopy
    mov r0, #0x0
    str r0, [r6, #0x28]
    str r0, [r6, #0x2c]
    mov r0, #0x100
    strh r0, [r6, #0x30]
    sub r2, r0, #0x8100
    mov r0, #0x1e
    strh r0, [r6, #0x32]
    strh r4, [r6, #0x34]
    ldrsh r3, [r6, #0x36]
    mov r0, #0x10
    ldr r1, .L_02025488
    and r2, r3, r2
    strh r2, [r6, #0x36]
    ldrh r4, [r6, #0x36]
    mov r2, #0x4
    ldr r3, .L_0202548c
    bic r4, r4, #0x8000
    strh r4, [r6, #0x36]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02025398
    mov r2, #0x1140
    ldr r1, .L_02025490
    add r3, r2, #0x228
    bl AnimationResource_Init
.L_02025398:
    ldr r1, .L_02025494
    str r0, [r6, #0xc]
    ldr r3, .L_0202548c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020253c8
    ldr r1, .L_02025498
    ldr r2, .L_0202549c
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_020253c8:
    ldr r1, .L_02025494
    str r0, [r6, #0x10]
    ldr r3, .L_0202548c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020253f8
    ldr r1, .L_020254a0
    sub r2, r1, #0x358
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_020253f8:
    ldr r1, .L_02025488
    str r0, [r6, #0x14]
    ldr r3, .L_0202548c
    mov r0, #0x308
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0202546c
    ldr r1, [r6, #0x14]
    mov r4, #0x0
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x1c]
    sub r3, r4, #0x18000
    str r1, [sp, #0x4]
    ldr r1, [r6, #0x20]
    ldr r2, [sp, #0x38]
    str r1, [sp, #0x8]
    ldr ip, [r6, #0x24]
    ldr r1, [sp, #0x3c]
    str ip, [sp, #0xc]
    str r4, [sp, #0x10]
    str r4, [sp, #0x14]
    str r3, [sp, #0x18]
    str r2, [sp, #0x1c]
    str r1, [sp, #0x20]
    ldr r2, [r6, #0xc]
    ldr r3, [r6, #0x10]
    mov r1, r5
    bl func_0206b628
.L_0202546c:
    mov r1, #0x1
    str r0, [r6, #0x8]
    bl AuxiliaryCoreSprite_SetVisible
    mov r0, r6
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02025484: .word data_020d6a70
.L_02025488: .word data_020d6a90
.L_0202548c: .word gHeapContext
.L_02025490: .word 0x1367
.L_02025494: .word data_020d6a98
.L_02025498: .word 0x1357
.L_0202549c: .word 0x1001
.L_020254a0: .word 0x1359
    .size RotatingCoreEffectController_Init, . - RotatingCoreEffectController_Init
