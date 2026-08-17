; Matching retail form; see src/game/timed_sprite_free_orbit_variant.c.
.text
.extern Heap_Free
.extern data_020d5b10
.extern data_020d60f8
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Add
.extern func_0201e380
.extern TimedSpritePresentation_SetVisible
.extern func_0201e9d8

.global func_0201ebac
.type func_0201ebac, @function
func_0201ebac: ; 0x0201ebac
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldrsh lr, [sp, #0x18]
    ldrsh ip, [sp, #0x1c]
    mov r4, r1
    str lr, [sp, #0x0]
    mov r1, #0x0
    mov r5, r0
    str ip, [sp, #0x4]
    bl func_0201e9d8
    ldr r2, .L_0201ebf4
    mov r1, r4
    add r0, r5, #0x40
    str r2, [r5, #0x0]
    bl VecFx32Object_InitCopy
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_0201ebf4: .word data_020d60f8
    .size func_0201ebac, .-func_0201ebac

.global func_0201ebf8
.type func_0201ebf8, @function
func_0201ebf8: ; 0x0201ebf8
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x40
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_0201e380
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201ebf8, .-func_0201ebf8

.global func_0201ec18
.type func_0201ec18, @function
func_0201ec18: ; 0x0201ec18
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x40
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_0201e380
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201ec18, .-func_0201ec18

.global func_0201ec40
.type func_0201ec40, @function
func_0201ec40: ; 0x0201ec40
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r1, [r4, #0x28]
    subs r1, r1, #0x1
    str r1, [r4, #0x28]
    mov r1, #0x0
    bpl .L_0201ec6c
    bl TimedSpritePresentation_SetVisible
    mov r0, #0x1
    b .L_0201ecb0
.L_0201ec6c:
    ldr r2, .L_0201ecb8
    strh r1, [sp, #0x4]
    str r2, [sp, #0x0]
    strh r1, [sp, #0x6]
    ldr r3, [r0, #0x0]
    add r2, sp, #0x0
    ldr r3, [r3, #0x14]
    add r1, r4, #0x40
    blx r3
    add r0, r4, #0x8
    add r1, r4, #0x18
    bl VecFx32Object_Add
    ldrh r2, [r4, #0x38]
    ldrsh r1, [r4, #0x3a]
    mov r0, #0x0
    add r1, r2, r1
    strh r1, [r4, #0x38]
.L_0201ecb0:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_0201ecb8: .word data_020d5b10
    .size func_0201ec40, .-func_0201ec40
