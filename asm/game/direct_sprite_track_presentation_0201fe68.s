; Matching retail form; see src/game/direct_sprite_track_presentation.c.
.text
.extern Heap_Alloc
.extern gDirectSpriteTrackPresentationAllocationTag
.extern gGamePhaseRuntime
.extern ActorMotionAreaFollower_GetPosition
.extern RuntimePresentationManager_AppendSecondListEffect
.extern DirectSpriteTrackPresentation_Init
.extern gHeapContext

.global DirectSpriteTrackPresentation_SpawnAndRegister
    .type DirectSpriteTrackPresentation_SpawnAndRegister, @function
DirectSpriteTrackPresentation_SpawnAndRegister: ; 0x0201fe68
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x20
    mov r7, r1
    mov r5, r3
    mov r8, r0
    mov r6, r2
    ldr r1, .L_0201ff20
    ldr r3, .L_0201ff24
    mov r0, #0x2c
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0201ff00
    ldr r0, .L_0201ff28
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r2, [sp, #0x38]
    str r5, [sp, #0x0]
    ldr r1, [sp, #0x3c]
    str r2, [sp, #0x4]
    ldr r2, [sp, #0x40]
    str r1, [sp, #0x8]
    ldr r1, [sp, #0x44]
    str r2, [sp, #0xc]
    ldr r2, [sp, #0x48]
    str r1, [sp, #0x10]
    ldr r1, [sp, #0x4c]
    str r2, [sp, #0x14]
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
    mov r0, r4
    mov r1, r8
    mov r2, r7
    mov r3, r6
    bl DirectSpriteTrackPresentation_Init
    mov r4, r0
.L_0201ff00:
    ldr r0, .L_0201ff28
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendSecondListEffect
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0201ff20: .word gDirectSpriteTrackPresentationAllocationTag
.L_0201ff24: .word gHeapContext
.L_0201ff28: .word gGamePhaseRuntime
    .size DirectSpriteTrackPresentation_SpawnAndRegister, .-DirectSpriteTrackPresentation_SpawnAndRegister
