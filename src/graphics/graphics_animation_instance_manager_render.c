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

#ifndef MATCHING
extern const s16 data_020c9670[];
extern u8 data_021f38a0[];
extern void *memcpy(void *destination, const void *source, u32 size);
extern void Graphics3DCommand_SetPolygonAttr(u32 lightMask, u32 polygonMode,
                                              u32 cullMode, u32 polygonId,
                                              u32 alpha, u32 miscFlags);
extern void func_020b00f0(const s32 *matrix);
extern void func_020b0808(s32 sine, s32 cosine);
extern void func_020b0844(s32 sine, s32 cosine);
extern void func_020b0880(s32 sine, s32 cosine);
extern s32 func_020b01a0(s32 *position, s32 *w);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern void func_020b4554(void *address, u32 size);
extern s32 func_01ff88c4(s32 dma_channel, const void *commands, u32 size);
#endif

#ifdef __cplusplus
}
#endif

#ifndef MATCHING
/* Render one animation instance through its current 0x38-byte geometry-command
 * records. The instance and render matrix are borrowed; command bytes are
 * copied into the fixed scratch buffer before texture/palette offsets are
 * patched and synchronously submitted. Flags control matrix load, mirroring,
 * polygon attributes, position testing, and post-submit resets exactly as in
 * retail. Position-test results update instance fields +0x3C/+0x40. */
void func_02076db0(GraphicsAnimationInstance *instance, void *render_context)
{
    u8 *resource = (u8 *)instance->resource;
    u8 *sequence_table = *(u8 **)(resource + 0x24);
    u8 *frame_table = *(u8 **)(resource + 0x28);
    u8 *record_table = *(u8 **)(resource + 0x2c);
    u8 *command_table = *(u8 **)(resource + 0x30);
    u16 sequence_first = *(u16 *)(sequence_table + instance->animationIndex * 8);
    u16 frame_record = *(u16 *)(frame_table +
                                (sequence_first + instance->frameIndex) * 4);
    u8 *frame = record_table + frame_record * 4;
    u16 first_command = *(u16 *)frame;
    u16 command_count = *(u16 *)(frame + 2);
    u8 *command = command_table + first_command * 0x38;
    u8 *palette_resource = (u8 *)instance->paletteRegion->owner;
    u8 *palette_descriptor = *(u8 **)(palette_resource + 0x20);
    s32 texture_width = *(u16 *)(palette_descriptor + 4) * 2;
    u32 texture_offset = instance->textureRegion->offset;
    u32 palette_offset = instance->paletteRegion->offset;
    s32 scale_x = instance->scaleX << 4;
    s32 scale_y = instance->scaleY << 4;
    GraphicsAnimationInstanceManager *manager =
        (GraphicsAnimationInstanceManager *)instance->owner;
    volatile s32 *translation = (volatile s32 *)0x04000470;
    volatile s32 *scale = (volatile s32 *)0x0400046c;
    volatile u32 *begin_vertices = (volatile u32 *)0x04000500;
    volatile u32 *end_vertices = (volatile u32 *)0x04000504;
    volatile u32 *matrix_push = (volatile u32 *)0x04000444;
    volatile u32 *matrix_pop = (volatile u32 *)0x04000448;
    u32 index;

    if ((instance->flags & 0x400) != 0)
        scale_x = -scale_x;
    if ((instance->flags & 0x800) != 0)
        scale_y = -scale_y;

    *matrix_push = 0;
    Graphics3DCommand_SetPolygonAttr(
        instance->field_57, instance->field_58, instance->field_59,
        instance->field_5a, instance->field_5b, instance->field_44);
    *translation = manager->translationX + instance->field_20;
    *translation = manager->translationY + instance->field_24;
    *translation = manager->translationZ + instance->field_28;

    if ((instance->flags & 0x80) != 0) {
        *(volatile u32 *)0x04000598 = 0;
        *(volatile u32 *)0x04000598 = 0;
    }
    if ((instance->flags & 0x40) != 0)
        func_020b00f0((const s32 *)render_context);

    index = (u16)instance->field_48 >> 4;
    func_020b0880(data_020c9670[index * 2],
                  data_020c9670[index * 2 + 1]);
    index = (u16)instance->field_4a >> 4;
    func_020b0844(data_020c9670[index * 2],
                  data_020c9670[index * 2 + 1]);
    index = (u16)instance->field_4c >> 4;
    func_020b0808(data_020c9670[index * 2],
                  data_020c9670[index * 2 + 1]);
    *scale = scale_x;
    *scale = scale_y;
    *scale = 0x1000;

    for (index = 0; index < command_count; ++index, command += 0x38) {
        u32 texture_parameter;

        if ((instance->flags & 0x200) != 0) {
            Graphics3DCommand_SetPolygonAttr(
                instance->field_57, instance->field_58, instance->field_59,
                instance->field_5a + index, instance->field_5b,
                instance->field_44);
        }
        memcpy(data_021f38a0, command, 0x38);
        texture_parameter = *(u32 *)(data_021f38a0 + 4) & 0xffff0000u;
        texture_parameter |=
            ((texture_offset + ((*(u32 *)(command + 4) & 0xffffu) << 5)) >> 3) &
            0xffffu;
        *(u32 *)(data_021f38a0 + 4) = texture_parameter;
        *(u32 *)(data_021f38a0 + 8) =
            (*(u32 *)(command + 8) * texture_width + palette_offset) >> 4;
        *begin_vertices = 1;
        if (instance->field_57 != 0)
            *(u32 *)(data_021f38a0 + 0x18) = 0x1ff00000;
        else
            *(u32 *)(data_021f38a0 + 0x14) = instance->field_4e;
        func_020b4554(data_021f38a0, 0x38);
        func_01ff88c4(3, data_021f38a0, 0x38);
        *end_vertices = 0;
        if ((instance->flags & 0x100) != 0) {
            *(u32 *)(data_021f38a0 + 4) = 0;
            *(u32 *)(data_021f38a0 + 4) = 0;
            *(u32 *)(data_021f38a0 + 4) = 0xfffffff0u;
        }
    }

    if ((instance->flags & 0x80) != 0) {
        s32 position[3];
        s32 w;

        while (func_020b01a0(position, &w) != 0) {
        }
        {
            s32 projected_x = func_020adc90(position[0] << 7, w);
            s32 projected_y = func_020adc90(position[2] * 0x60, w);

            /* Retail converts signed fx32 toward zero by adding 0xFFF only
             * for negative inputs before the arithmetic right shift. */
            projected_x = (projected_x + (s32)((u32)(projected_x >> 11) >> 20)) >> 12;
            projected_y = (projected_y + (s32)((u32)(projected_y >> 11) >> 20)) >> 12;
            instance->field_3c = (u32)(projected_x + 0x80);
            instance->field_40 = (u32)(0x60 - projected_y);
        }
    }
    *matrix_pop = 1;
}
#endif

/*
 * Return immediately when renderEnabled is zero. Otherwise push the current
 * matrix, submit translationX/Y/Z as the three raw translation components,
 * and traverse the list while caching next before callbacks. An instance with
 * flags bits 5 and 0 both set is unlinked and destroyed; other instances
 * render only when bits 2 and 3 are both clear. Finally pop one matrix. The
 * volatile geometry writes and delegated renderer/destructor calls are
 * externally observable.
 */
#ifndef MATCHING
void GraphicsAnimationInstanceManager_Render(GraphicsAnimationInstanceManager *manager,
                   void *renderContext)
{
    GraphicsAnimationInstance *instance;

    if (manager->renderEnabled == 0) {
        return;
    }

    REG_G3_MTX_PUSH = 0;
    REG_G3_MTX_TRANS = manager->translationX;
    REG_G3_MTX_TRANS = manager->translationY;
    REG_G3_MTX_TRANS = manager->translationZ;

    instance = manager->head;
    while (instance != 0) {
        GraphicsAnimationInstance *next =
            instance->next;
        u16 flags = instance->flags;

        if ((flags & 0x20) != 0 && (flags & 1) != 0) {
            GraphicsAnimationInstanceManager_Unlink(manager, instance);
            Graphics3DResourceOwner_DestroyAnimationInstance((struct Graphics3DResourceOwner *)manager->owner,
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
asm void GraphicsAnimationInstanceManager_Render(GraphicsAnimationInstanceManager *manager,
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
    bl GraphicsAnimationInstanceManager_Unlink
    ldr r0, [r7]
    mov r1, r4
    bl Graphics3DResourceOwner_DestroyAnimationInstance
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
