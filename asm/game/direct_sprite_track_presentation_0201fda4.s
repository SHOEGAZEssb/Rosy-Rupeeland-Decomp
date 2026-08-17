; Matching retail form; see src/game/direct_sprite_track_presentation.c.
.text
.extern Heap_Free
.extern gDirectSpriteTrackPresentationVtable
.extern VecFx32Object_Destroy
.extern AnimationResourceState_Destroy
.extern AnimationResourceState_ReleaseResources
.extern GraphicsSpriteGroup_ReleaseState

.global DirectSpriteTrackPresentation_DestroyAndFree
    .type DirectSpriteTrackPresentation_DestroyAndFree, @function
DirectSpriteTrackPresentation_DestroyAndFree: ; 0x0201fda4
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201fde8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x14]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    add r0, r4, #0x8
    bl AnimationResourceState_ReleaseResources
    add r0, r4, #0x1c
    bl VecFx32Object_Destroy
    add r0, r4, #0x8
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201fde8: .word gDirectSpriteTrackPresentationVtable
    .size DirectSpriteTrackPresentation_DestroyAndFree, .-DirectSpriteTrackPresentation_DestroyAndFree
