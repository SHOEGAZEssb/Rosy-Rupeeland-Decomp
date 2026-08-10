#include "tingle/graphics_sprite_pool.h"
#include "tingle/graphics_vram_allocator.h"

/*
 * Allocation, recycling, and resource replacement for fixed-pool sprite
 * states. The pool contains 384 stable objects and uses field_08 as its free
 * link while an object is not attached to a sprite group.
 */

typedef struct GraphicsSpriteStatePool {
    u32 count;
    u32 field_04;
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
 * resource pointers, and optionally acquire the offset-0x0c VRAM range when
 * attach equals one. Returns the state. Retail performs no exhaustion check;
 * an empty free list is outside the valid caller contract. Pool and optional
 * VRAM allocator state change, with no direct SDK or hardware access.
 */
GraphicsSpriteState *GraphicsSpriteStatePool_Allocate(
    void *owner, void *field14, void *field18, void *field1c,
    u8 attach, GraphicsSpriteGroup *group)
{
    GraphicsSpriteState *state = gGraphicsSpriteStatePool.freeHead;

    gGraphicsSpriteStatePool.freeHead = (GraphicsSpriteState *)state->field_08;
    gGraphicsSpriteStatePool.count++;
    GraphicsSpriteState_Reset(state);
    state->field_00 = group;
    state->field_14 = field14;
    state->field_18 = field18;
    state->animationResource = field1c;
    if (attach == 1) {
        state->field_0c =
            GraphicsSpriteRenderer_AcquireGraphicsVramBinding(owner, field14);
        state->field_3b |= 1;
    }
    return state;
}

/*
 * Return a non-null state to the global pool. Release its offset-0x0c VRAM
 * range and offset-0x10 renderer allocation first, then push it through
 * field_08 and decrement the live count. The state is invalid for caller use.
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
                  (GraphicsVramRangeNode *)state->field_0c);
    GraphicsSpriteRenderer_ReleaseIndexedEntry(owner, state->field_10);
    state->field_08 = gGraphicsSpriteStatePool.freeHead;
    gGraphicsSpriteStatePool.freeHead = state;
    gGraphicsSpriteStatePool.count--;
}

/*
 * Replace any changed resource pointers on state unless state is null or
 * field_3b bit 1 freezes replacement. A field_14 change always drops the VRAM
 * range and reacquires it when attachment bit 0 is set. A field_18 change
 * releases and clears offset 0x10. For an unattached state, a field_1c change
 * also drops offset 0x0c when the nested offset-0x24 identities differ.
 * Returns no value; renderer allocator state may change through the helpers.
 */
#ifndef MATCHING
void GraphicsSpriteState_ReplaceResources(void *ownerPointer,
                                          GraphicsSpriteState *state,
                                          void *field14, void *field18,
                                          void *field1c)
{
    GraphicsSpritePoolOwner *owner =
        (GraphicsSpritePoolOwner *)ownerPointer;

    if (state == 0 || (state->field_3b & 2) != 0) {
        return;
    }
    if (state->field_14 != field14) {
        GraphicsVramAllocator_Release(&owner->vramAllocator,
                      (GraphicsVramRangeNode *)state->field_0c);
        state->field_0c = 0;
        state->field_14 = field14;
        if ((state->field_3b & 1) != 0) {
            state->field_0c = GraphicsSpriteRenderer_AcquireGraphicsVramBinding(
                owner, field14);
        }
    }
    if (state->field_18 != field18) {
        GraphicsSpriteRenderer_ReleaseIndexedEntry(owner, state->field_10);
        state->field_10 = 0;
        state->field_18 = field18;
    }
    if (state->animationResource != field1c) {
        if ((state->field_3b & 1) == 0 &&
            ((GraphicsSpriteResource1c *)state->animationResource)
                    ->field_20->field_24 !=
                ((GraphicsSpriteResource1c *)field1c)->field_20->field_24) {
            GraphicsVramAllocator_Release(&owner->vramAllocator,
                          (GraphicsVramRangeNode *)state->field_0c);
            state->field_0c = 0;
        }
        state->animationResource = field1c;
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteState_ReplaceResources(void *owner,
                                              GraphicsSpriteState *state,
                                              void *field14, void *field18,
                                              void *field1c)
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
