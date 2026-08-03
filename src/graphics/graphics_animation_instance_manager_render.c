#include "tingle/graphics_animation_instance.h"

/*
 * Manager-wide NDS 3D rendering pass for graphics animation instances. It
 * scopes the manager translation with geometry-engine matrix push/pop commands,
 * renders eligible nodes, and removes terminal auto-destroy nodes in place.
 */

#define REG_G3_MTX_PUSH (*(volatile u32 *)0x04000444)
#define REG_G3_MTX_POP (*(volatile u32 *)0x04000448)
#define REG_G3_MTX_TRANS (*(volatile u32 *)0x04000470)

#ifdef __cplusplus
extern "C" {
#endif

extern void func_02076db0(GraphicsAnimationInstance *instance,
                          void *renderContext);

#ifdef __cplusplus
}
#endif

/*
 * Return immediately when field_24 is zero. Otherwise push the current matrix,
 * submit field_18/1c/20 as the three raw translation components, and traverse
 * the list while caching next before callbacks. An instance with flags bits 5
 * and 0 both set is unlinked and destroyed; other instances render only when
 * bits 2 and 3 are both clear. Finally pop one matrix. The volatile geometry
 * writes and delegated renderer/destructor calls are externally observable.
 */
#ifndef MATCHING
void func_020773e4(GraphicsAnimationInstanceManager *manager,
                   void *renderContext)
{
    GraphicsAnimationInstance *instance;

    if (manager->field_24 == 0) {
        return;
    }

    REG_G3_MTX_PUSH = 0;
    REG_G3_MTX_TRANS = manager->field_18;
    REG_G3_MTX_TRANS = manager->field_1c;
    REG_G3_MTX_TRANS = manager->field_20;

    instance = manager->head;
    while (instance != 0) {
        GraphicsAnimationInstance *next =
            instance->field_08;
        u16 flags = instance->flags;

        if ((flags & 0x20) != 0 && (flags & 1) != 0) {
            func_020772d0(manager, instance);
            func_020777ac((struct Graphics3DResourceOwner *)manager->owner,
                           instance);
        } else if ((flags & 0x0c) == 0) {
            func_02076db0(instance, renderContext);
        }
        instance = next;
    }

    REG_G3_MTX_POP = 1;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_020773e4(GraphicsAnimationInstanceManager *manager,
                       void *renderContext)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, [r7, #0x24]
    mov r6, r1
    cmp r0, #0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    /* Load the trailing 0x04000444 matrix-push register literal. */
    DCD 0xE59F30A0
    mov r0, #0
    str r0, [r3]
    ldr r2, [r7, #0x20]
    ldr r1, [r7, #0x1c]
    ldr r0, [r7, #0x18]
    str r0, [r3, #0x2c]
    str r1, [r3, #0x2c]
    str r2, [r3, #0x2c]
    ldr r4, [r7, #0xc]
    b animation_manager_render_check
animation_manager_render_loop:
    ldrh r1, [r4, #0x50]
    ldr r5, [r4, #8]
    and r0, r1, #0x20
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq animation_manager_render_visible
    and r0, r1, #1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq animation_manager_render_visible
    mov r0, r7
    mov r1, r4
    bl func_020772d0
    ldr r0, [r7]
    mov r1, r4
    bl func_020777ac
    b animation_manager_render_next
animation_manager_render_visible:
    and r0, r1, #0xc
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne animation_manager_render_next
    mov r0, r4
    mov r1, r6
    bl func_02076db0
animation_manager_render_next:
    mov r4, r5
animation_manager_render_check:
    cmp r4, #0
    /* Hand encoded to avoid MWCC's backward-label fallthrough branch. */
    DCD 0x1AFFFFE4
    /* Load the trailing 0x04000448 matrix-pop register literal. */
    DCD 0xE59F000C
    mov r1, #1
    str r1, [r0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
animation_manager_render_mtx_push:
    DCD 0x04000444
animation_manager_render_mtx_pop:
    DCD 0x04000448
}
#endif
