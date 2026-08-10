; Matching retail form; see src/game/timed_sprite_record_presentation.c.
.text
.extern data_020d62b0
.extern data_021052fc
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern GamePhaseVisualEffect_Configure
.extern GamePhaseVisualEffect_SetBaseOffset
.extern func_0201e250
.extern func_020284e0

.global func_0201ff2c
    .type func_0201ff2c, @function
func_0201ff2c: ; 0x0201ff2c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    mov r5, r0
    mov r6, r1
    mov r4, r2
    bl func_0201e250
    ldr r0, .L_02020010
    str r0, [r5, #0x0]
    str r6, [r5, #0x8]
    ldrsh r0, [r4, #0x12]
    bl func_020284e0
    str r0, [r5, #0x10]
    ldr r0, [r4, #0x34]
    mov r2, #0x0
    str r0, [r5, #0x14]
    ldrsh r3, [r4, #0x38]
    ldr r0, .L_02020014
    add r1, r5, #0x14
    strh r3, [r5, #0x18]
    ldrsh r3, [r4, #0x3a]
    strh r3, [r5, #0x1a]
    ldrsh r3, [r4, #0x3c]
    strh r3, [r5, #0x1c]
    ldrsh r3, [r4, #0x3e]
    strh r3, [r5, #0x1e]
    str r2, [r5, #0xc]
    ldr r3, [r5, #0x10]
    ldr r0, [r0, #0x0]
    ldrh r2, [r3, #0x6]
    add r4, r0, #0x2d8
    add r0, r4, #0x2c00
    str r2, [sp, #0x0]
    ldrh r2, [r3, #0x8]
    str r2, [sp, #0x4]
    ldrh r2, [r3, #0xe]
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    ldrh r1, [r3, #0x0]
    ldrh r2, [r3, #0x2]
    ldrh r3, [r3, #0x4]
    bl GamePhaseVisualEffect_Configure
    ldr r2, [r5, #0x10]
    add r0, sp, #0x10
    ldrsh r1, [r2, #0xa]
    ldrsh r2, [r2, #0xc]
    mov r3, #0x0
    mov r1, r1, lsl #0x4
    mov r2, r2, lsl #0x4
    bl VecFx32Object_InitComponents
    add r0, r4, #0x2c00
    add r1, sp, #0x10
    bl GamePhaseVisualEffect_SetBaseOffset
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r0, r5
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_02020010: .word data_020d62b0
.L_02020014: .word data_021052fc
    .size func_0201ff2c, .-func_0201ff2c
