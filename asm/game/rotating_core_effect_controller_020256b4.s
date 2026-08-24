; Matching retail form; see src/game/rotating_core_effect_controller.c.
.text
.extern Heap_Alloc
.extern gFx32CosSinTable
.extern data_020d6aa0
.extern gGamePhaseRuntime
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Object_InitSum
.extern ActorMotionAreaFollower_GetPosition
.extern TimedSpritePresentation_SetVisible
.extern func_0201ebac
.extern AuxiliaryCore_UpdateMotion
.extern AuxiliaryCore_ApplyScale
.extern func_020bf1f8
.extern gHeapContext
.extern genrand_int32

    .global func_020256b4
    .type func_020256b4, @function
func_020256b4: ; 0x020256b4
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x70
    mov r5, r0
    ldrsh r1, [r5, #0x36]
    mov r0, r1, lsl #0x11
    movs r0, r0, asr #0x11
    beq .L_020256dc
    cmp r0, #0x1
    beq .L_020258f8
    b .L_02025918
.L_020256dc:
    ldrsh r0, [r5, #0x34]
    cmp r0, #0x0
    ble .L_020258a8
    sub r0, r0, #0x1
    strh r0, [r5, #0x34]
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    beq .L_02025918
    ldr r0, [r5, #0x28]
    cmp r0, #0x0
    bne .L_02025918
    add r0, sp, #0x48
    bl VecFx32Object_Init
    add r0, sp, #0x58
    bl VecFx32Object_Init
    ldr r1, [r5, #0x8]
    add r0, sp, #0x48
    ldr r2, [r1, #0x4]
    add r1, r5, #0x18
    ldr r4, [r2, #0x34]
    ldr r2, [r4, #0x0]
    str r2, [sp, #0x38]
    ldr r2, [r5, #0x2c]
    ldr r2, [r2, #0x4]
    str r2, [sp, #0x3c]
    ldr r2, [r5, #0x2c]
    ldr r2, [r2, #0x8]
    str r2, [sp, #0x40]
    ldr r2, [r5, #0x2c]
    ldr r2, [r2, #0xc]
    str r2, [sp, #0x44]
    bl VecFx32Object_Assign
    ldr r1, [r5, #0x8]
    ldr r3, .L_02025a2c
    ldr r1, [r1, #0x2d8]
    ldr r0, [sp, #0x4c]
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r6, [r3, r1]
    ldr r2, [sp, #0x50]
    mov r1, #0x0
    add r0, r0, r6, lsl #0x4
    str r0, [sp, #0x4c]
    ldr r0, [r5, #0x8]
    mov lr, #0x2
    ldr r6, [r0, #0x2d8]
    mov ip, #0x23
    mov r6, r6, asr #0x4
    mov r6, r6, lsl #0x2
    ldrsh r3, [r3, r6]
    add r0, sp, #0x8
    str lr, [sp, #0x6c]
    mov r3, r3, lsl #0x4
    sub r3, r3, #0x18000
    add r2, r2, r3
    str r2, [sp, #0x50]
    sub r2, r1, #0x18000
    mov r3, r1
    str ip, [sp, #0x68]
    str r1, [sp, #0x60]
    str r1, [sp, #0x5c]
    bl VecFx32Object_InitComponents
    add r0, sp, #0x28
    add r1, r5, #0x18
    add r2, sp, #0x8
    bl VecFx32Object_InitSum
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    ldr r1, .L_02025a30
    ldr r3, .L_02025a34
    mov r0, #0x50
    mov r2, #0x4
    bl Heap_Alloc
    movs r6, r0
    beq .L_02025848
    bl genrand_int32
    mov r1, #0x5
    bl func_020bf1f8
    mvn r0, #0x3f
    str r0, [sp, #0x0]
    ldrb r3, [r4, #0x3a]
    mov ip, r1
    add r1, sp, #0x28
    str r3, [sp, #0x4]
    add r2, sp, #0x38
    mov r0, r6
    and r3, ip, #0xff
    bl func_0201ebac
    mov r6, r0
.L_02025848:
    str r6, [r5, #0x28]
    bl genrand_int32
    tst r0, #0x1
    ldrne r1, [r5, #0x28]
    ldrne r2, [r1, #0x4]
    ldrneh r1, [r2, #0x24]
    orrne r1, r1, #0x80
    strneh r1, [r2, #0x24]
    tst r0, #0x2
    ldrne r0, [r5, #0x28]
    ldrne r1, [r0, #0x4]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x40
    strneh r0, [r1, #0x24]
    ldr r0, [r5, #0x28]
    mov r1, #0x1
    bl TimedSpritePresentation_SetVisible
    add r0, sp, #0x28
    bl VecFx32Object_Destroy
    add r0, sp, #0x58
    bl VecFx32Object_Destroy
    add r0, sp, #0x48
    bl VecFx32Object_Destroy
    b .L_02025918
.L_020258a8:
    mov r0, #0x8000
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x1
    strh r0, [r5, #0x36]
    ldr r0, [r5, #0x8]
    add r0, r0, #0x200
    ldrh r1, [r0, #0xee]
    orr r1, r1, #0x2
    strh r1, [r0, #0xee]
    ldr r0, [r5, #0x28]
    cmp r0, #0x0
    beq .L_02025918
    beq .L_020258ec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020258ec:
    mov r0, #0x0
    str r0, [r5, #0x28]
    b .L_02025918
.L_020258f8:
    mov r0, #0x8
    strh r0, [r5, #0x30]
    ldr r0, [r5, #0x8]
    add r0, r0, #0x200
    ldrsh r0, [r0, #0xde]
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_02025a24
.L_02025918:
    ldr r0, [r5, #0x28]
    cmp r0, #0x0
    beq .L_02025984
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    cmp r0, #0x0
    beq .L_0202595c
    ldr r0, [r5, #0x28]
    cmp r0, #0x0
    beq .L_02025950
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02025950:
    mov r0, #0x0
    str r0, [r5, #0x28]
    b .L_02025984
.L_0202595c:
    ldr r0, .L_02025a38
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    ldr r0, [r5, #0x28]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x10]
    blx r2
.L_02025984:
    ldrsh r1, [r5, #0x30]
    ldr r0, [r5, #0x8]
    mvn r2, #0x0
    bl AuxiliaryCore_ApplyScale
    ldr r4, [r5, #0x8]
    add r0, sp, #0x18
    ldr r2, [r4, #0x2d8]
    add r1, r5, #0x18
    add r2, r2, #0x180
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x10
    add r2, r3, r2, ror #0x10
    str r2, [r4, #0x2d8]
    bl VecFx32Object_InitCopy
    ldrsh r0, [r5, #0x32]
    cmp r0, #0x0
    ble .L_02025a0c
    bl genrand_int32
    mov r1, #0x9
    bl func_020bf1f8
    ldr r2, [sp, #0x1c]
    rsb r0, r1, #0x4
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x1c]
    bl genrand_int32
    mov r1, #0x9
    bl func_020bf1f8
    ldr r2, [sp, #0x20]
    rsb r0, r1, #0x4
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x20]
    ldrsh r0, [r5, #0x32]
    sub r0, r0, #0x1
    strh r0, [r5, #0x32]
.L_02025a0c:
    ldr r0, [r5, #0x8]
    add r1, sp, #0x18
    bl AuxiliaryCore_UpdateMotion
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_02025a24:
    add sp, sp, #0x70
    ldmia sp!, {r4, r5, r6, pc}
.L_02025a2c: .word gFx32CosSinTable
.L_02025a30: .word data_020d6aa0
.L_02025a34: .word gHeapContext
.L_02025a38: .word gGamePhaseRuntime
    .size func_020256b4, . - func_020256b4
