#include "tingle/graphics_sprite_create.h"

/*
 * Sprite creation and initial-state configuration helpers. They bind three
 * resource pointers through the recovered sprite-group allocator, select an
 * animation, and initialize ordering and flag fields without directly
 * touching OAM or other graphics hardware.
 */

#ifndef MATCHING
/*
 * Select animationIndex, write field_3a and field_28, then OR flagsToSet and
 * clear flagsToClear in that order. The animation selector may reset frame
 * state and attached metadata; this function returns no value.
 */
void GraphicsSpriteState_Configure(GraphicsSpriteState *state, u8 animationIndex,
                   u8 field3a, u16 field28, u16 flagsToSet,
                   u16 flagsToClear)
{
    GraphicsSpriteState_SetAnimationIndex(state, animationIndex);
    state->field_3a = field3a;
    state->field_28 = field28;
    state->flags = (state->flags | flagsToSet) & (u16)~flagsToClear;
}

/*
 * Allocate and attach a sprite state using resources at descriptor offsets
 * 4/8/0xc and attach mode 2, then initialize it through GraphicsSpriteState_Configure. Returns
 * the allocated state; allocation failure behavior belongs to GraphicsSpriteGroup_CreateState.
 */
GraphicsSpriteState *GraphicsSpriteState_Create(
    GraphicsSpriteGroup *group,
    const GraphicsSpriteResourceDescriptor *resources,
    u8 animationIndex, u8 field3a, u16 field28,
    u16 flagsToSet, u16 flagsToClear)
{
    GraphicsSpriteState *state =
        GraphicsSpriteGroup_CreateState(group, resources->field_04, resources->field_08,
                      resources->field_0c, 2);
    GraphicsSpriteState_Configure(state, animationIndex, field3a, field28,
                  flagsToSet, flagsToClear);
    return state;
}
#else
/* Matching forms implement the documented portable C above. */
asm void GraphicsSpriteState_Configure(GraphicsSpriteState *, u8, u8, u16, u16, u16)
{
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r2
    and r1, r1, #0xff
    mov r5, r3
    bl GraphicsSpriteState_SetAnimationIndex
    strb r6, [r4, #0x3a]
    strh r5, [r4, #0x28]
    ldrh r0, [sp, #0x14]
    ldrh r2, [r4, #0x24]
    ldrh r1, [sp, #0x10]
    mvn r0, r0
    orr r1, r2, r1
    and r0, r1, r0
    strh r0, [r4, #0x24]
    ldmia sp!, {r4, r5, r6, pc}
}

asm GraphicsSpriteState *GraphicsSpriteState_Create(
    GraphicsSpriteGroup *, const GraphicsSpriteResourceDescriptor *,
    u8, u8, u16, u16, u16)
{
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #8
    mov r4, #2
    str r4, [sp]
    mov ip, r1
    mov r5, r2
    mov r4, r3
    ldmib ip, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    ldrh r1, [sp, #0x1c]
    mov r2, r4
    ldrh ip, [sp, #0x20]
    str r1, [sp]
    ldr r3, [sp, #0x18]
    mov r1, r5
    mov r4, r0
    str ip, [sp, #4]
    bl GraphicsSpriteState_Configure
    mov r0, r4
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, pc}
}
#endif
