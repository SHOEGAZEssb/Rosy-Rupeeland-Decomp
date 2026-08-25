; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern Heap_Alloc
.extern gBallisticSpriteEmitterAllocationTag
.extern gGamePhaseRuntime
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern RuntimePresentationManager_AppendFirstListEffect
.extern BallisticSpriteEmitter_Init
.extern gHeapContext

    .global BallisticSpriteEmitter_SpawnAndRegister
    .type BallisticSpriteEmitter_SpawnAndRegister, @function
BallisticSpriteEmitter_SpawnAndRegister: ; 0x02023ed4
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r8, r1
    mov r6, r3
    mov r9, r0
    mov r7, r2
    ldr r1, .L_02023f6c
    ldr r3, .L_02023f70
    mov r0, #0x4c
    mov r2, #0x4
    mov r4, #0x0
    bl Heap_Alloc
    movs r5, r0
    beq .L_02023f3c
    add r0, sp, #0x0
    mov r1, r9, lsl #0xc
    mov r2, r8, lsl #0xc
    mov r3, r4
    bl VecFx32Object_InitComponents
    add r1, sp, #0x0
    mov r0, r5
    mov r2, r7
    mov r3, r6
    mov r4, #0x1
    bl BallisticSpriteEmitter_Init
    mov r5, r0
.L_02023f3c:
    ldr r0, .L_02023f74
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    cmp r4, #0x0
    beq .L_02023f64
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02023f64:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02023f6c: .word gBallisticSpriteEmitterAllocationTag
.L_02023f70: .word gHeapContext
.L_02023f74: .word gGamePhaseRuntime
    .size BallisticSpriteEmitter_SpawnAndRegister, . - BallisticSpriteEmitter_SpawnAndRegister
