; Matching retail form; see src/game/reversed_frame_sprite_overlay_presentation.c.
.text
.extern Heap_Free
.extern data_020d6bd0
.extern func_0201e28c
.extern func_02071eb8
.extern func_0207419c

    .global func_02027420
    .type func_02027420, @function
func_02027420: ; 0x02027420
    stmdb sp!, {r4, lr}
    ldr r1, .L_02027470
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_02027448
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02027448:
    ldr r0, [r4, #0x14]
    bl func_0207419c
    add r0, r4, #0x8
    bl func_02071eb8
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02027470: .word data_020d6bd0
    .size func_02027420, . - func_02027420
