; Matching retail form; portable equivalent calls src/game/type7_actor_destructor.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020e16b0
.extern data_020e1c38
.extern data_021052fc
.extern data_0210577c
.extern func_02005058
.extern func_02039d54
.extern func_0203b61c
.extern func_0204cd7c
.extern func_0206c978
.extern gGameWork
.global func_02045878
.type func_02045878, @function
func_02045878: ; 0x02045878
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_020459bc
    mov r4, r0
    ldr r0, .L_020459c0
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    cmp r0, #0x0
    beq .L_020458a8
    mov r1, #0x0
    bl func_02039d54
.L_020458a8:
    mov r2, #0x0
    ldr r1, .L_020459c4
    b .L_020458cc
.L_020458b4:
    ldr r0, [r1, r2, lsl #0x2]
    cmp r0, r4
    moveq r0, #0x0
    streq r0, [r1, r2, lsl #0x2]
    beq .L_020458d4
    add r2, r2, #0x1
.L_020458cc:
    cmp r2, #0x3
    blt .L_020458b4
.L_020458d4:
    ldr r5, [r4, #0x234]
    cmp r5, #0x0
    beq .L_020458f0
    mov r0, r5
    bl func_0206c978
    mov r0, r5
    bl Heap_Free
.L_020458f0:
    ldr r0, .L_020459c8
    ldr r1, .L_020459cc
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldrsb r0, [r4, #0x48]
    cmp r0, #0x1
    bne .L_0204597c
    ldr r0, [r4, #0x268]
    tst r0, #0x10000
    beq .L_02045930
    ldr r0, .L_020459d0
    mvn r1, #0x0
    str r1, [r0, #0x2b4]
    mov r1, #0x0
    str r1, [r0, #0x2b8]
    b .L_02045950
.L_02045930:
    ldr r1, [r4, #0x1fc]
    ldr r0, .L_020459d0
    str r1, [r0, #0x2bc]
    ldr r0, [r4, #0x268]
    tst r0, #0x10
    movne r1, #0x1
    ldr r0, .L_020459d0
    moveq r1, #0x0
.L_02045950:
    str r1, [r0, #0x2d0]
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x7e]
    ldr r0, .L_020459d0
    str r1, [r0, #0x2c0]
    ldr r1, [r4, #0x1c]
    mov r1, r1, asr #0xc
    str r1, [r0, #0x2c4]
    ldr r1, [r4, #0x20]
    mov r1, r1, asr #0xc
    str r1, [r0, #0x2c8]
.L_0204597c:
    add r0, r4, #0x2a8
    bl func_0204cd7c
    add r0, r4, #0x284
    bl func_02005058
    add r0, r4, #0x26c
    bl func_02005058
    add r0, r4, #0x224
    bl func_02005058
    add r0, r4, #0x214
    bl func_02005058
    mov r0, r4
    bl func_0203b61c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_020459bc: .word data_020e1c38
.L_020459c0: .word data_021052fc
.L_020459c4: .word data_0210577c
.L_020459c8: .word gGameWork
.L_020459cc: .word 0x3fd
.L_020459d0: .word data_020e16b0
.size func_02045878, . - func_02045878
