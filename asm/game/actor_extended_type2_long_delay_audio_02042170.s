; Matching retail form; see src/game/actor_extended_type2_long_delay_audio.c.
.text
.extern data_020df9e8
.extern ActorExtendedType2_GetDescriptorValue25
.extern func_020593dc
.extern func_020ada8c
.extern gSoundContext
.extern genrand_int32
.global func_02042170
.type func_02042170, @function
func_02042170: ; 0x02042170
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r0, r4, #0x200
    ldrsh r2, [r0, #0x5a]
    cmp r2, #0x0
    bne .L_02042234
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x1e0
    bl func_020ada8c
    add r1, r0, #0x1e0
    add r0, r4, #0x200
    strh r1, [r0, #0x58]
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020422d0
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    beq .L_020421dc
    cmp r0, #0x1
    beq .L_02042208
    b .L_020422d0
.L_020421dc:
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_020422ec
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x90
    mov r2, #0x2
    bl func_020593dc
    b .L_020422d0
.L_02042208:
    mov r0, #0x0
    mov r1, #0x100
    str r0, [sp, #0x0]
    ldr r0, .L_020422ec
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    add r1, r1, #0xc6
    mov r2, #0x2
    bl func_020593dc
    b .L_020422d0
.L_02042234:
    ldrh r1, [r0, #0x58]
    cmp r2, r1
    blt .L_020422b4
    ldr r1, .L_020422f0
    ldr r2, [r1, #0xe8]
    ldr r1, [r1, #0xec]
    str r2, [r4, #0x220]
    str r1, [r4, #0x224]
    ldr r1, [r4, #0x260]
    orr r1, r1, #0x400000
    str r1, [r4, #0x260]
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020422d0
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    bne .L_020422d0
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    ldr r0, .L_020422ec
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x90
    mov r2, #0x3
    bl func_020593dc
    b .L_020422d0
.L_020422b4:
    ldr r1, [r4, #0x260]
    mov r0, #0x4
    bic r1, r1, #0x1
    str r1, [r4, #0x260]
    strb r0, [r4, #0x24c]
    mov r0, #0xb
    strh r0, [r4, #0xd6]
.L_020422d0:
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x5a]
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r1, #0x5a]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_020422ec: .word gSoundContext
.L_020422f0: .word data_020df9e8
.size func_02042170, . - func_02042170
