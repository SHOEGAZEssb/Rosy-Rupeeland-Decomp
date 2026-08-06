; Matching retail form; see src/game/reversed_frame_sprite_overlay_presentation.c.
.text
.extern data_020d6bd0
.extern func_0201e28c
.extern func_02071eb8
.extern func_0207419c

    .global func_020273d4
    .type func_020273d4, @function
func_020273d4: ; 0x020273d4
    stmdb sp!, {r4, lr}
    ldr r1, .L_0202741c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_020273fc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020273fc:
    ldr r0, [r4, #0x14]
    bl func_0207419c
    add r0, r4, #0x8
    bl func_02071eb8
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202741c: .word data_020d6bd0
    .size func_020273d4, . - func_020273d4
