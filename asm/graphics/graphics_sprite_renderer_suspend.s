.text
; Matching fallback for the portable implementation in src/graphics/graphics_sprite_renderer.c.
.extern func_020ae678
.extern func_020ae6c8
.extern func_020ae754
.extern func_020ae79c

.global GraphicsSpriteRenderer_Suspend
GraphicsSpriteRenderer_Suspend:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x30]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    bne .L_02075270
    bl func_020ae79c
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    beq .L_02075284
    bl func_020ae754
    b .L_02075284
.L_02075270:
    bl func_020ae6c8
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    beq .L_02075284
    bl func_020ae678
.L_02075284:
    mov r0, #0x0
    str r0, [r4, #0x30]
    ldmia sp!, {r4, pc}
.size GraphicsSpriteRenderer_Suspend, . - GraphicsSpriteRenderer_Suspend
