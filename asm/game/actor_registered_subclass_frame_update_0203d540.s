; Matching retail form; see src/game/actor_registered_subclass_frame_update.c.
.text
.extern data_021052fc
.extern func_0201e0ec
.extern Actor_GetCachedTerrainHeight
.extern func_0203cf8c
.extern func_0203d86c
.extern func_020a28e0
.extern func_020befec
.extern genrand_int32
    .global func_0203d540
    .type func_0203d540, @function
func_0203d540: ; 0x0203d540
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_0203cf8c
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    cmp r0, #0x0
    bne .L_0203d58c
    ldr r1, [r5, #0x24]
    cmp r0, r1
    bge .L_0203d58c
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r5, #0x24]
    add r0, r0, #0x18000
    cmp r1, r0
    ldrlt r0, [r5, #0x14]
    orrlt r0, r0, #0x800000
    strlt r0, [r5, #0x14]
    blt .L_0203d598
.L_0203d58c:
    ldr r0, [r5, #0x14]
    bic r0, r0, #0x800000
    str r0, [r5, #0x14]
.L_0203d598:
    ldrsh r0, [r5, #0xd6]
    cmp r0, #0x0
    beq .L_0203d5b8
    cmp r0, #0x1
    beq .L_0203d5d0
    cmp r0, #0x2
    beq .L_0203d688
    ldmia sp!, {r3, r4, r5, pc}
.L_0203d5b8:
    ldr r0, [r5, #0x114]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0203d86c
    ldmia sp!, {r3, r4, r5, pc}
.L_0203d5d0:
    ldr r0, [r5, #0x114]
    cmp r0, #0x1
    bne .L_0203d5e8
    mov r0, r5
    bl func_0203d86c
    ldmia sp!, {r3, r4, r5, pc}
.L_0203d5e8:
    add r1, r5, #0x200
    ldrh r0, [r1, #0x18]
    add r0, r0, #0x1
    strh r0, [r1, #0x18]
    ldrh r0, [r1, #0x18]
    ldrh r1, [r1, #0x1a]
    cmp r0, r1
    bhs .L_0203d67c
    mov r1, #0xf
    bl func_020befec
    cmp r1, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    bl genrand_int32
    ldr r1, .L_0203d6dc
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r3, r4, lsr #0x4
    mov r1, #0x3c
    str r1, [sp, #0x0]
    ldr r2, [r5, #0x1c]
    ldr r1, [r5, #0x24]
    mov ip, r2, asr #0xc
    ldr r2, [r5, #0x20]
    mov r1, r1, asr #0xc
    rsb r1, r1, r2, asr #0xc
    and r4, r4, #0x3
    sub r2, ip, #0x2
    and r3, r3, #0x3
    sub r1, r1, #0x12
    add r3, r3, r1
    add r2, r4, r2
    mov r1, #0x1
    bl func_020a28e0
    ldmia sp!, {r3, r4, r5, pc}
.L_0203d67c:
    mov r0, r5
    bl func_0203d86c
    ldmia sp!, {r3, r4, r5, pc}
.L_0203d688:
    ldr r0, [r5, #0x114]
    cmp r0, #0x1
    ldreq r1, [r5, #0x54]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x10
    streqh r0, [r1, #0x24]
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, #0x0
    strh r1, [r5, #0xd6]
    add r0, r5, #0x200
    strh r1, [r0, #0x18]
    mov r1, #0x78
    strh r1, [r0, #0x1a]
    ldr r0, [r5, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r5, #0x14]
    ldr r0, [r5, #0xd0]
    orr r0, r0, #0x1000
    str r0, [r5, #0xd0]
    ldmia sp!, {r3, r4, r5, pc}
.L_0203d6dc: .word data_021052fc
    .size func_0203d540, . - func_0203d540
