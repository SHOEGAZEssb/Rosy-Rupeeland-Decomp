#include "tingle/graphics_sprite_position.h"

/*
 * World-to-sprite positioning and expanded-viewport culling helpers. These
 * routines convert 20.12 fixed-point coordinates relative to a retained
 * origin, query an unidentified global view object for a layer choice, and
 * update the sprite's screen coordinates, depth field, and caller-selected
 * visibility flag. The global object's semantic type is not yet confirmed.
 */

extern u8 *data_021052fc;
#ifdef __cplusplus
extern "C" {
#endif
extern GraphicsPositionSource *func_02009d78(void *object);
#ifdef __cplusplus
}
#endif

typedef u32 (*GraphicsLayerQuery)(void *self, s32 x, s32 y);

#ifndef MATCHING
static u32 queryLayer(s32 positionX, s32 positionY)
{
    void *object = *(void **)(data_021052fc + 0x2ed4);
    GraphicsLayerQuery query = *(GraphicsLayerQuery *)(*(u8 **)object + 0x2c);
    return query(object, positionX >> 16, positionY >> 16);
}

/*
 * Query the global view object with the integer parts of positionX/Y, set
 * field_3a to 2 when depth lies below the query's signed five-bit result (or
 * 1 otherwise), then convert X/Y relative to origin and depth into integer
 * sprite coordinates. GraphicsSpriteState_SetScreenPositionCulled performs
 * flag-controlled culling. No graphics register is accessed directly and no
 * value is returned.
 */
void GraphicsSpriteState_SetWorldPositionFromOrigin(GraphicsSpriteState *state,
                                                    const GraphicsPositionSource *origin,
                                                    s32 positionX,
                                                    s32 positionY, s32 depth,
                                                    u16 cullFlag)
{
    u32 result = queryLayer(positionX, positionY);
    s32 layer = (s32)(result << 27) >> 27;

    state->field_3a = depth < layer * 0x10000 ? 2 : 1;
    GraphicsSpriteState_SetScreenPositionCulled(state,
                  (positionX >> 12) - (origin->field_04 >> 12),
                  (positionY >> 12) - (depth >> 12) -
                      (origin->field_08 >> 12),
                  cullFlag);
}

/*
 * Obtain the default origin from the object at global offset 0x2fbc and pass
 * all coordinates and cullFlag to
 * GraphicsSpriteState_SetWorldPositionFromOrigin. State changes and return
 * behavior are exactly those of that callee.
 */
void GraphicsSpriteState_SetWorldPosition(GraphicsSpriteState *state,
                                          s32 positionX, s32 positionY,
                                          s32 depth, u16 cullFlag)
{
    GraphicsPositionSource *origin =
        func_02009d78(data_021052fc + 0x2fbc);
    GraphicsSpriteState_SetWorldPositionFromOrigin(
        state, origin, positionX, positionY, depth, cullFlag);
}

/*
 * When -32 <= x < 272 and -64 <= y < 256, store x/y in fields 0x2c/0x2e
 * and clear cullFlag from state->flags. Outside that expanded DS viewport,
 * set cullFlag and retain the previous coordinates. No value is returned.
 */
void GraphicsSpriteState_SetScreenPositionCulled(GraphicsSpriteState *state,
                                                 s32 x, s32 y, u16 cullFlag)
{
    if (x >= -32 && x < 272 && y >= -64 && y < 256) {
        state->field_2c = (s16)x;
        state->field_2e = (s16)y;
        state->flags &= (u16)~cullFlag;
    } else {
        state->flags |= cullFlag;
    }
}

/*
 * Variant of GraphicsSpriteState_SetWorldPositionFromOrigin that uses
 * positionY-origin.field_08 as the retained depth basis, subtracts depth only
 * from the displayed Y, and stores 0x7fff minus that basis in field_28 after
 * culling. The layer query and field_3a selection have the same effects as
 * GraphicsSpriteState_SetWorldPositionFromOrigin.
 */
void GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(
    GraphicsSpriteState *state, const GraphicsPositionSource *origin,
    s32 positionX, s32 positionY, s32 depth, u16 cullFlag)
{
    u32 result = queryLayer(positionX, positionY);
    s32 layer = (s32)(result << 27) >> 27;
    s32 relativeY = (positionY >> 12) - (origin->field_08 >> 12);

    state->field_3a = depth < layer * 0x10000 ? 2 : 1;
    GraphicsSpriteState_SetScreenPositionCulled(state,
                  (positionX >> 12) - (origin->field_04 >> 12),
                  relativeY - (depth >> 12), cullFlag);
    state->field_28 = (u16)(0x7fff - relativeY);
}

/*
 * Obtain the default origin from the object at global offset 0x2fbc and pass
 * all coordinates and cullFlag to
 * GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin. State changes
 * and return behavior are exactly those of that callee.
 */
void GraphicsSpriteState_SetDepthOrderedWorldPosition(
    GraphicsSpriteState *state, s32 positionX, s32 positionY, s32 depth,
    u16 cullFlag)
{
    GraphicsPositionSource *origin =
        func_02009d78(data_021052fc + 0x2fbc);
    GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(
        state, origin, positionX, positionY, depth, cullFlag);
}
#else
/* Matching forms implement the documented portable C above. */
asm void GraphicsSpriteState_SetWorldPositionFromOrigin(
    GraphicsSpriteState *, const GraphicsPositionSource *, s32, s32, s32,
    u16)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #8
    ldr r4, =data_021052fc
    mov r7, r0
    ldr r0, [r4]
    mov r4, r3
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r5, r2
    ldr r3, [r0]
    mov r6, r1
    ldr r3, [r3, #0x2c]
    mov r1, r5, asr #16
    mov r2, r4, asr #16
    blx r3
    mov r1, r0, lsl #27
    ldr r2, [sp, #0x20]
    mov r1, r1, asr #27
    str r0, [sp]
    str r0, [sp, #4]
    cmp r2, r1, lsl #16
    movlt r0, #2
    movge r0, #1
    strb r0, [r7, #0x3a]
    ldr r0, [sp, #0x20]
    ldr r1, [r6, #4]
    mov r0, r0, asr #12
    mov r1, r1, asr #12
    rsb r4, r0, r4, asr #12
    ldr r2, [r6, #8]
    ldrh r3, [sp, #0x24]
    mov r0, r7
    rsb r1, r1, r5, asr #12
    sub r2, r4, r2, asr #12
    bl GraphicsSpriteState_SetScreenPositionCulled
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
}

asm void GraphicsSpriteState_SetWorldPosition(GraphicsSpriteState *, s32, s32,
                                              s32, u16)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #8
    ldr ip, =data_021052fc
    mov r4, r0
    ldr r0, [ip]
    mov r7, r1
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    mov r6, r2
    mov r5, r3
    bl func_02009d78
    ldrh ip, [sp, #0x20]
    mov r1, r0
    mov r0, r4
    mov r2, r7
    mov r3, r6
    stmia sp, {r5, ip}
    bl GraphicsSpriteState_SetWorldPositionFromOrigin
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
}

asm void GraphicsSpriteState_SetScreenPositionCulled(GraphicsSpriteState *,
                                                     s32, s32, u16)
{
    mvn ip, #0x1f
    cmp r1, ip
    blt outside
    cmp r1, #0x110
    bge outside
    sub ip, ip, #0x20
    cmp r2, ip
    blt outside
    cmp r2, #0x100
    bge outside
    strh r1, [r0, #0x2c]
    strh r2, [r0, #0x2e]
    ldrh r2, [r0, #0x24]
    mvn r1, r3
    and r1, r2, r1
    strh r1, [r0, #0x24]
    bx lr
outside:
    ldrh r1, [r0, #0x24]
    orr r1, r1, r3
    strh r1, [r0, #0x24]
    bx lr
}

asm void GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(
    GraphicsSpriteState *, const GraphicsPositionSource *, s32, s32, s32,
    u16)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #8
    ldr r4, =data_021052fc
    mov r7, r0
    ldr r0, [r4]
    mov r4, r3
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    mov r5, r2
    ldr r3, [r0]
    mov r6, r1
    ldr r3, [r3, #0x2c]
    mov r1, r5, asr #16
    mov r2, r4, asr #16
    blx r3
    mov r1, r0, lsl #27
    ldr r2, [sp, #0x20]
    mov r1, r1, asr #27
    cmp r2, r1, lsl #16
    str r0, [sp]
    str r0, [sp, #4]
    movlt r0, #2
    movge r0, #1
    strb r0, [r7, #0x3a]
    ldr r0, [r6, #8]
    ldr r1, [r6, #4]
    mov r0, r0, asr #12
    mov r1, r1, asr #12
    rsb r4, r0, r4, asr #12
    ldr r2, [sp, #0x20]
    ldrh r3, [sp, #0x24]
    mov r0, r7
    rsb r1, r1, r5, asr #12
    sub r2, r4, r2, asr #12
    bl GraphicsSpriteState_SetScreenPositionCulled
    ldr r0, =0x7fff
    sub r0, r0, r4
    strh r0, [r7, #0x28]
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
}

asm void GraphicsSpriteState_SetDepthOrderedWorldPosition(
    GraphicsSpriteState *, s32, s32, s32, u16)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #8
    ldr ip, =data_021052fc
    mov r4, r0
    ldr r0, [ip]
    mov r7, r1
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    mov r6, r2
    mov r5, r3
    bl func_02009d78
    ldrh ip, [sp, #0x20]
    mov r1, r0
    mov r0, r4
    mov r2, r7
    mov r3, r6
    stmia sp, {r5, ip}
    bl GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
}
#endif
