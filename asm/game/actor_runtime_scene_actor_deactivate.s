; Matching retail form; see src/game/actor_runtime_scene_actor_sets.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_02007f0c
.extern func_02032c4c
.extern func_02032cac
.extern data_021052fc
.global func_0200b8cc
func_0200b8cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r0, L_0200b9fc
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r6, #0x0
    mov r4, r0
    add r7, r4, #0x2000
    mov r8, r6
    mov r9, r6
    b L_0200b958
L_0200b8f8:
    ldr r5, [r4, r6, lsl #0x2]
    cmp r5, #0x0
    ldrneb r0, [r5, #0x4d]
    cmpne r0, #0x1
    beq L_0200b954
    cmp r0, #0x3
    bne L_0200b948
    ldr r0, [r5, #0x10]
    tst r0, #0x100
    beq L_0200b938
    tst r0, #0x1
    beq L_0200b938
    tst r0, #0x40
    beq L_0200b938
    mov r0, r5
    bl func_02032c4c
L_0200b938:
    mov r0, r5
    mov r1, r9
    bl func_02032cac
    b L_0200b954
L_0200b948:
    mov r0, r5
    mov r1, r8
    bl func_02032cac
L_0200b954:
    add r6, r6, #0x1
L_0200b958:
    ldr r0, [r7, #0xe74]
    cmp r6, r0
    blt L_0200b8f8
    ldr r0, L_0200b9fc
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r5, #0x0
    mov r6, r0
    add r7, r6, #0x2000
    mov r8, r5
    mov r9, r5
    b L_0200b9ec
L_0200b98c:
    ldr r4, [r6, r5, lsl #0x2]
    cmp r4, #0x0
    ldrneb r0, [r4, #0x4d]
    cmpne r0, #0x1
    beq L_0200b9e8
    cmp r0, #0x3
    bne L_0200b9dc
    ldr r0, [r4, #0x10]
    tst r0, #0x100
    beq L_0200b9cc
    tst r0, #0x1
    beq L_0200b9cc
    tst r0, #0x40
    beq L_0200b9cc
    mov r0, r4
    bl func_02032c4c
L_0200b9cc:
    mov r0, r4
    mov r1, r9
    bl func_02032cac
    b L_0200b9e8
L_0200b9dc:
    mov r0, r4
    mov r1, r8
    bl func_02032cac
L_0200b9e8:
    add r5, r5, #0x1
L_0200b9ec:
    ldr r0, [r7, #0xe74]
    cmp r5, r0
    blt L_0200b98c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_0200b9fc: .word data_021052fc
.size func_0200b8cc, . - func_0200b8cc

