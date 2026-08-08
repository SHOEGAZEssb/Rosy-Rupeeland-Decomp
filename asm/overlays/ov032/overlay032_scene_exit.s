.text

/* Exact fallback; see src/overlays/ov032/overlay032_scene_transitions.c for documented portable C. */
.extern GameWork_TestFlag
.extern func_02002ac0
.extern func_02002cd0
.extern func_02002d54
.extern func_02002d74
.extern func_02002d94
.extern func_02002db0
.extern func_0205958c
.extern func_020595ec
.extern func_ov032_021fde38
.extern gGameWork
.extern gSoundContext

    .global func_ov032_021fed8c
func_ov032_021fed8c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xb64]
    cmp r0, #0x0
    beq L_021fedb4
    cmp r0, #0x1
    beq L_021fee18
    cmp r0, #0x2
    beq L_021fee48
    b L_021fee8c
L_021fedb4:
    ldr r0, [r4, #0xbc8]
    cmp r0, #0x0
    beq L_021fede0
    ldr r0, [r4, #0xbe0]
    bl func_02002cd0
    mov r1, r0
    ldr r0, [r4, #0xbe0]
    mvn r2, #0xf
    mov r3, #0x10
    bl func_02002ac0
    b L_021fedec
L_021fede0:
    mov r0, #0x2
    mov r1, #0x10
    bl func_02002d54
L_021fedec:
    mov r0, #0x2
    mov r1, #0x10
    bl func_02002d74
    ldr r0, L_021fee94
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_0205958c
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021fee8c
L_021fee18:
    bl func_02002d94
    cmp r0, #0x0
    beq L_021fee8c
    bl func_02002db0
    cmp r0, #0x0
    beq L_021fee8c
    mov r0, r4
    bl func_ov032_021fde38
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_021fee8c
L_021fee48:
    ldr r0, L_021fee98
    ldr r1, L_021fee9c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_021fee78
    mov r0, #0x1
    mov r1, #0x10
    bl func_02002d54
    mov r0, #0x1
    mov r1, #0x10
    bl func_02002d74
L_021fee78:
    ldr r0, L_021fee94
    ldr r0, [r0, #0x0]
    bl func_020595ec
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fee8c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fee94: .word gSoundContext
L_021fee98: .word gGameWork
L_021fee9c: .word 0x3fb
.size func_ov032_021fed8c, .-func_ov032_021fed8c

