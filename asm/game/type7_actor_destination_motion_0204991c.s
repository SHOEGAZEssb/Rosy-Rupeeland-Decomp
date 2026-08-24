; Matching retail form; see src/game/type7_actor_destination_motion.c.
.extern gFx32CosSinTable
.extern VecFx32Object_Assign
.extern VecFx32Object_SetComponents
.extern Type7Actor_CompleteDestinationMotion
.extern Fx32Vector2_Magnitude
.extern func_020adae4
.extern func_020ae024
.text
    .global Type7Actor_UpdateDestinationMotion
.type Type7Actor_UpdateDestinationMotion, @function
Type7Actor_UpdateDestinationMotion: ; 0x0204991c
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    add r0, r4, #0x78
    bic r1, r1, #0x8000
    str r1, [r4, #0x268]
    ldr r2, [r4, #0xd0]
    add r1, r4, #0x284
    orr r2, r2, #0x2
    str r2, [r4, #0xd0]
    bl VecFx32Object_Assign
    ldr r3, [r4, #0x7c]
    ldr r2, [r4, #0x1c]
    ldr r1, [r4, #0x80]
    ldr r0, [r4, #0x20]
    sub r6, r3, r2
    sub r7, r1, r0
    mov r0, r6
    mov r1, r7
    bl Fx32Vector2_Magnitude
    mov r5, r0
    cmp r5, #0x1000
    bge .L_02049998
    mov r2, #0x2
    add r0, r4, #0x18
    add r1, r4, #0x78
    strh r2, [r4, #0xd6]
    bl VecFx32Object_Assign
    mov r0, r4
    bl Type7Actor_CompleteDestinationMotion
    b .L_02049a70
.L_02049998:
    mov r1, #0x0
    mov ip, #0xa
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    strh ip, [r4, #0xd6]
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl VecFx32Object_SetComponents
    mov r1, #0x0
    mov r2, r1
    add r0, r4, #0x98
    mov r3, r1
    bl VecFx32Object_SetComponents
    mov r0, r7
    mov r1, r6
    bl func_020ae024
    mov r6, r0
    ldr r0, [r4, #0x23c]
    mov r1, #0x2
    mov r0, r0, lsl #0x2
    bl func_020adae4
    mov r1, r6, asr #0x4
    mov ip, r1, lsl #0x1
    add r1, ip, #0x1
    cmp r0, r5
    ldr r3, .L_02049a78
    mov r1, r1, lsl #0x1
    ldrsh r2, [r3, r1]
    mov r1, ip, lsl #0x1
    ldrsh r1, [r3, r1]
    movge r0, r5
    smull ip, r3, r2, r0
    adds ip, ip, #0x800
    smull r2, r0, r1, r0
    adc r3, r3, #0x0
    adds r1, r2, #0x800
    mov r2, ip, lsr #0xc
    ldr ip, [r4, #0x1c]
    orr r2, r2, r3, lsl #0x14
    add r2, ip, r2
    str r2, [r4, #0x1c]
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    ldr r2, [r4, #0x20]
    add r0, r4, #0x28
    add r2, r2, r1
    add r1, r4, #0x18
    str r2, [r4, #0x20]
    bl VecFx32Object_Assign
.L_02049a70:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02049a78: .word gFx32CosSinTable
.size Type7Actor_UpdateDestinationMotion, . - Type7Actor_UpdateDestinationMotion

