; Matching retail form; see src/game/actor_extended_type2_candidate_track.c.
.text
.extern data_020e8380
.global func_0204322c
.type func_0204322c, @function
func_0204322c: ; 0x0204322c
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    streq r0, [r5, #0x264]
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x148]
    blx r2
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r5, #0x264]
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r0, [r5, #0x269]
    ldr r1, .L_02043308
    cmp r0, #0x20
    addlo r0, r0, #0x1
    strlob r0, [r5, #0x269]
    ldrh r2, [r5, #0x4e]
    mov r0, #0x30
    mla r0, r2, r0, r1
    ldrh r0, [r0, #0x1e]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x12
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_020432c4
.L_0204329c: ; jump table
    b .L_020432ac ; case 0
    b .L_020432b4 ; case 1
    b .L_020432bc ; case 2
    b .L_020432c4 ; case 3
.L_020432ac:
    mov r1, #0x2
    b .L_020432c8
.L_020432b4:
    mov r1, #0x4
    b .L_020432c8
.L_020432bc:
    mov r1, #0x8
    b .L_020432c8
.L_020432c4:
    mov r1, #0x10
.L_020432c8:
    cmp r0, #0x2
    bgt .L_020432f4
    ldrb r0, [r5, #0x269]
    cmp r0, r1
    blt .L_020432f4
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0xf4]
    blx r2
    b .L_02043300
.L_020432f4:
    str r4, [r5, #0x264]
    mov r0, #0xc
    strb r0, [r5, #0x268]
.L_02043300:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02043308: .word data_020e8380

    .global func_0204330c
.size func_0204322c, . - func_0204322c
