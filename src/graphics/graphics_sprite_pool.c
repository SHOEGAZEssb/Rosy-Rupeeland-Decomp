#include "tingle/graphics_sprite_pool.h"
#include "tingle/graphics_vram_allocator.h"

/*
 * Allocation, recycling, and resource replacement for fixed-pool sprite
 * states. The pool contains 384 stable objects and uses nextOrFree as its free
 * link while an object is not attached to a sprite group.
 */

typedef struct GraphicsSpriteStatePool {
    u32 liveCount;
    u32 interruptState;
    GraphicsSpriteState *freeHead;
} GraphicsSpriteStatePool;

typedef struct GraphicsSpritePoolOwner {
    u8 padding_000[0x448];
    GraphicsVramAllocator vramAllocator;
} GraphicsSpritePoolOwner;

typedef struct GraphicsSpriteResourceIdentity {
    u8 padding_00[0x24];
    u32 field_24;
} GraphicsSpriteResourceIdentity;

typedef struct GraphicsSpriteResource1c {
    u8 padding_00[0x20];
    GraphicsSpriteResourceIdentity *field_20;
} GraphicsSpriteResource1c;

#ifdef __cplusplus
extern "C" {
#endif

extern GraphicsSpriteStatePool gGraphicsSpriteStatePool;
extern GraphicsVramRangeNode *
GraphicsSpriteRenderer_AcquireGraphicsVramBinding(void *owner,
                                                  void *resource);
extern void GraphicsSpriteRenderer_ReleaseIndexedEntry(void *owner,
                                                       void *allocation);

#ifdef __cplusplus
}
#endif

/*
 * Pop one state from the global free list, reset it, bind its group and three
 * resource pointers, and optionally acquire the graphics VRAM binding when
 * graphicsBindingMode equals one. Returns the state. Retail performs no
 * exhaustion check;
 * an empty free list is outside the valid caller contract. Pool and optional
 * VRAM allocator state change, with no direct SDK or hardware access.
 */
GraphicsSpriteState *GraphicsSpriteStatePool_Allocate(
    void *owner, void *graphicsResource, void *paletteResource,
    void *animationResource, u8 graphicsBindingMode,
    GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = gGraphicsSpriteStatePool.freeHead;

    gGraphicsSpriteStatePool.freeHead = state->nextOrFree;
    gGraphicsSpriteStatePool.liveCount++;
    GraphicsSpriteState_Reset(state);
    state->group = group;
    state->graphicsResource = graphicsResource;
    state->paletteResource = paletteResource;
    state->animationResource = animationResource;
    if (graphicsBindingMode == 1) {
        state->graphicsVramBinding =
            GraphicsSpriteRenderer_AcquireGraphicsVramBinding(
                owner, graphicsResource);
        state->resourceControlFlags |= 1;
    }
    return state;
}

/*
 * Return a non-null state to the global pool. Release its offset-0x0c VRAM
 * range and indexed-palette binding first, then push it through nextOrFree and
 * decrement the live count. The state is invalid for caller use.
 */
void GraphicsSpriteStatePool_Release(void *ownerPointer,
                                     GraphicsSpriteState *state)
{
    GraphicsSpritePoolOwner *owner =
        (GraphicsSpritePoolOwner *)ownerPointer;

    if (state == 0) {
        return;
    }
    GraphicsVramAllocator_Release(&owner->vramAllocator,
                  (GraphicsVramRangeNode *)state->graphicsVramBinding);
    GraphicsSpriteRenderer_ReleaseIndexedEntry(
        owner, state->indexedPaletteBinding);
    state->nextOrFree = gGraphicsSpriteStatePool.freeHead;
    gGraphicsSpriteStatePool.freeHead = state;
    gGraphicsSpriteStatePool.liveCount--;
}

/*
 * Replace any changed resource pointers on state unless state is null or
 * resourceControlFlags bit 1 freezes replacement. A graphics-resource change always drops
 * the VRAM range and reacquires it when attachment bit 0 is set. A palette-
 * resource change releases and clears the indexed binding. For an unattached
 * state, an animation-resource change also drops the VRAM binding when the
 * nested offset-0x24 identities differ.
 * Returns no value; renderer allocator state may change through the helpers.
 */
#ifndef MATCHING
void GraphicsSpriteState_ReplaceResources(void *ownerPointer,
                                          GraphicsSpriteState *state,
                                          void *graphicsResource,
                                          void *paletteResource,
                                          void *animationResource)
{
    GraphicsSpritePoolOwner *owner =
        (GraphicsSpritePoolOwner *)ownerPointer;

    if (state == 0 || (state->resourceControlFlags & 2) != 0) {
        return;
    }
    if (state->graphicsResource != graphicsResource) {
        GraphicsVramAllocator_Release(&owner->vramAllocator,
                      (GraphicsVramRangeNode *)state->graphicsVramBinding);
        state->graphicsVramBinding = 0;
        state->graphicsResource = graphicsResource;
        if ((state->resourceControlFlags & 1) != 0) {
            state->graphicsVramBinding =
                GraphicsSpriteRenderer_AcquireGraphicsVramBinding(
                    owner, graphicsResource);
        }
    }
    if (state->paletteResource != paletteResource) {
        GraphicsSpriteRenderer_ReleaseIndexedEntry(
            owner, state->indexedPaletteBinding);
        state->indexedPaletteBinding = 0;
        state->paletteResource = paletteResource;
    }
    if (state->animationResource != animationResource) {
        if ((state->resourceControlFlags & 1) == 0 &&
            ((GraphicsSpriteResource1c *)state->animationResource)
                    ->field_20->field_24 !=
                ((GraphicsSpriteResource1c *)animationResource)
                    ->field_20->field_24) {
            GraphicsVramAllocator_Release(&owner->vramAllocator,
                          (GraphicsVramRangeNode *)state->graphicsVramBinding);
            state->graphicsVramBinding = 0;
        }
        state->animationResource = animationResource;
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteState_ReplaceResources(void *owner,
                                              GraphicsSpriteState *state,
                                              void *graphicsResource,
                                              void *paletteResource,
                                              void *animationResource)
{
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, [sp, #0x18]
    movs r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r0, [r7, #0x3b]
    and r0, r0, #2
    tst r0, #0xff
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r7, #0x14]
    cmp r0, r6
    beq sprite_replace_field18
    add r0, r8, #0x48
    ldr r1, [r7, #0xc]
    add r0, r0, #0x400
    bl GraphicsVramAllocator_Release
    mov r0, #0
    str r0, [r7, #0xc]
    str r6, [r7, #0x14]
    ldrb r0, [r7, #0x3b]
    and r0, r0, #1
    tst r0, #0xff
    beq sprite_replace_field18
    mov r0, r8
    mov r1, r6
    bl GraphicsSpriteRenderer_AcquireGraphicsVramBinding
    str r0, [r7, #0xc]
sprite_replace_field18:
    ldr r0, [r7, #0x18]
    cmp r0, r5
    beq sprite_replace_field1c
    ldr r1, [r7, #0x10]
    mov r0, r8
    bl GraphicsSpriteRenderer_ReleaseIndexedEntry
    mov r0, #0
    str r0, [r7, #0x10]
    str r5, [r7, #0x18]
sprite_replace_field1c:
    ldr r1, [r7, #0x1c]
    cmp r1, r4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r0, [r7, #0x3b]
    and r0, r0, #1
    tst r0, #0xff
    bne sprite_replace_store_field1c
    ldr r1, [r1, #0x20]
    ldr r0, [r4, #0x20]
    ldr r1, [r1, #0x24]
    ldr r0, [r0, #0x24]
    cmp r1, r0
    beq sprite_replace_store_field1c
    add r0, r8, #0x48
    ldr r1, [r7, #0xc]
    add r0, r0, #0x400
    bl GraphicsVramAllocator_Release
    mov r0, #0
    str r0, [r7, #0xc]
sprite_replace_store_field1c:
    str r4, [r7, #0x1c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
}
#endif
