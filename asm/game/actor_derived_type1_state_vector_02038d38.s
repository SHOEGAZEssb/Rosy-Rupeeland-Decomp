; Matching retail form; see src/game/actor_derived_type1_state_vector.c.
.text
.extern Sound_Play
.extern func_020050a4
.extern Actor_IsAtCachedTerrainHeight
.extern gSoundContext

    .global func_02038d38
    .type func_02038d38, @function
func_02038d38: ; 0x02038d38
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr ip, [r7, #0x26c]
    mov r6, r1
    mov r5, r2
    mov r4, r3
    cmp ip, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r7, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1c
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r1, r7, #0x200
    ldrh r2, [r1, #0x4]
    cmp r2, #0x0
    ldreqh r1, [r1, #0xa2]
    cmpeq r1, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, r7, #0x200
    ldrsh r1, [r0, #0x64]
    cmp r1, #0x0
    ldreqsh r0, [r0, #0x66]
    cmpeq r0, #0x0
    bne .L_02038e00
    mov r2, #0x0
    cmp r4, #0x2
    moveq r2, #0x28
    beq .L_02038de0
    cmp r4, #0x0
    moveq r2, #0x58
    beq .L_02038de0
    cmp r4, #0x3
    moveq r2, #0x61
    beq .L_02038de0
    sub r0, r2, #0x2
    cmp r4, r0
    moveq r2, #0x58
.L_02038de0:
    cmp r2, #0x0
    beq .L_02038e08
    ldr r0, .L_02038e34
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
    b .L_02038e08
.L_02038e00:
    cmp r4, #0x3
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_02038e08:
    mov r1, r6
    add r0, r7, #0x254
    strb r4, [r7, #0x26a]
    bl func_020050a4
    add r0, r7, #0x200
    strh r5, [r0, #0x64]
    mov r1, #0x5
    strh r1, [r0, #0x66]
    mov r1, #0xf
    strh r1, [r0, #0x52]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02038e34: .word gSoundContext
    .size func_02038d38, . - func_02038d38
