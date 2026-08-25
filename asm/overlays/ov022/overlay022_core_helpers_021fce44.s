    .text
/* Exact fallback; see src/overlays/ov022/overlay022_core_helpers.c. */
    .extern SpritePresentation_Destroy
    .extern Heap_Free

.global Overlay022_MovingSprite_Delete
Overlay022_MovingSprite_Delete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl SpritePresentation_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size Overlay022_MovingSprite_Delete, . - Overlay022_MovingSprite_Delete
