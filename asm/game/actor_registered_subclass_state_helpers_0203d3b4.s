; Matching retail form; see src/game/actor_registered_subclass_state_helpers.c.
.text
.extern data_02105718
.extern func_0203392c
    .global func_0203d3b4
    .type func_0203d3b4, @function
func_0203d3b4: ; 0x0203d3b4
    stmdb sp!, {r3, lr}
    ldrsh r2, [r0, #0xd6]
    cmp r2, #0x1
    bgt .L_0203d3ec
    mov ip, #0x0
    ldr r3, .L_0203d3f8
    b .L_0203d3e4
.L_0203d3d0:
    ldr r2, [r3, ip, lsl #0x2]
    cmp r2, #0x0
    streq r0, [r3, ip, lsl #0x2]
    beq .L_0203d3ec
    add ip, ip, #0x1
.L_0203d3e4:
    cmp ip, #0x4
    blt .L_0203d3d0
.L_0203d3ec:
    bl func_0203392c
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_0203d3f8: .word data_02105718
    .size func_0203d3b4, . - func_0203d3b4

