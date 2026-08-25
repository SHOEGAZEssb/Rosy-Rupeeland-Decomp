; Matching retail form; see src/game/rotating_core_effect_controller.c.
.text
.extern Heap_Alloc
.extern data_020d6a98
.extern AnimationResource_Init
.extern gHeapContext

    .global RotatingCoreEffectController_ConfigureOrbitSpriteResourceOnce
    .type RotatingCoreEffectController_ConfigureOrbitSpriteResourceOnce, @function
RotatingCoreEffectController_ConfigureOrbitSpriteResourceOnce: ; 0x0202564c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldrh r0, [r7, #0x36]
    mov r6, r1
    mov r5, r2
    mov r1, r0, lsl #0x10
    mov r4, r3
    movs r1, r1, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, .L_020256ac
    orr ip, r0, #0x8000
    ldr r3, .L_020256b0
    mov r0, #0x10
    mov r2, #0x4
    strh ip, [r7, #0x36]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020256a4
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl AnimationResource_Init
.L_020256a4:
    str r0, [r7, #0x2c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_020256ac: .word data_020d6a98
.L_020256b0: .word gHeapContext
    .size RotatingCoreEffectController_ConfigureOrbitSpriteResourceOnce, . - RotatingCoreEffectController_ConfigureOrbitSpriteResourceOnce
