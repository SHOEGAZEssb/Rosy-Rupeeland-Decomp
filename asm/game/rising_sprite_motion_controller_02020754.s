; Matching retail form; see src/game/rising_sprite_motion_controller.c.
.text
.extern func_02020374
.extern func_020203b0

.global func_02020754
    .type func_02020754, @function
func_02020754: ; 0x02020754
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    str r1, [r4, #0x8]
    cmp r1, #0x2
    bne .L_0202078c
    ldr r2, [r4, #0x50]
    add r0, sp, #0x0
    mov r1, #0x0
    mov r3, #0x78
    bl func_02020374
    add r1, sp, #0x0
    add r0, r4, #0x4c
    bl func_020203b0
.L_0202078c:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size func_02020754, .-func_02020754
