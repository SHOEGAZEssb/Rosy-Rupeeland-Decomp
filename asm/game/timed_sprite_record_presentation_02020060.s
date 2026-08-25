; Matching retail form; see src/game/timed_sprite_record_presentation.c.
.text
.extern Heap_Alloc
.extern data_020d62d0
.extern gGamePhaseRuntime
.extern RuntimePresentationManager_AppendFirstListEffect
.extern TimedSpriteRecordPresentation_Init
.extern gHeapContext

.global TimedSpriteRecordPresentation_SpawnAndRegister
    .type TimedSpriteRecordPresentation_SpawnAndRegister, @function
TimedSpriteRecordPresentation_SpawnAndRegister: ; 0x02020060
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    ldr r1, .L_020200b0
    ldr r3, .L_020200b4
    mov r0, #0x20
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_02020098
    mov r1, r5
    mov r2, r4
    bl TimedSpriteRecordPresentation_Init
    mov r1, r0
.L_02020098:
    ldr r0, .L_020200b8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    ldmia sp!, {r3, r4, r5, pc}
.L_020200b0: .word data_020d62d0
.L_020200b4: .word gHeapContext
.L_020200b8: .word gGamePhaseRuntime
    .size TimedSpriteRecordPresentation_SpawnAndRegister, .-TimedSpriteRecordPresentation_SpawnAndRegister
