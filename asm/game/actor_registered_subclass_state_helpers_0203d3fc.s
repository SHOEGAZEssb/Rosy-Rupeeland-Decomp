; Matching retail form; see src/game/actor_registered_subclass_state_helpers.c.
.text
.extern data_021052fc
.extern func_020349b8
.extern func_02034b60
.extern func_02038ecc
.extern func_0203d48c
    .global func_0203d3fc
    .type func_0203d3fc, @function
func_0203d3fc: ; 0x0203d3fc
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrsh r1, [r4, #0xd6]
    cmp r1, #0x0
    bne .L_0203d434
    add r2, r4, #0x200
    mov r3, #0x0
    mov r1, #0x78
    strh r3, [r2, #0x18]
    bl func_0203d48c
    ldr r1, .L_0203d484
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
.L_0203d434:
    ldr r0, .L_0203d488
    mov r1, #0x7e
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea4]
    mov r0, r5
    bl func_02038ecc
    ldr ip, [r4, #0x1c]
    ldr r1, [r5, #0x1c]
    ldr r3, [r4, #0x20]
    ldr r2, [r5, #0x20]
    mov r0, r5
    sub r1, ip, r1
    sub r2, r3, r2
    bl func_02034b60
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.L_0203d484: .word 0xe204
.L_0203d488: .word data_021052fc
    .size func_0203d3fc, . - func_0203d3fc
