; Matching retail form; see src/game/tracked_resource_actor_projectile_collision.c.
.extern data_02105310
.extern func_02004fe0
.extern func_02005058
.extern func_020050a4
.extern func_0200b04c
.extern func_0202d494
.extern Actor_GetCollection
.extern func_02050260
.extern func_02050560
.extern func_020ada8c
.extern genrand_int32
.text
    .global func_020515fc
func_020515fc:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, sp, #0x0
    mov r4, r1
    bl func_02004fe0
    bl genrand_int32
    bic r6, r0, #0x80000000
    mov r0, r6
    mov r1, #0x2000
    bl func_020ada8c
    sub r2, r0, #0x1000
    mov r0, r6, asr #0x4
    mov r1, #0x2000
    str r2, [sp, #0x4]
    bl func_020ada8c
    sub r1, r0, #0x1000
    ldr r0, .L_0205170c
    str r1, [sp, #0x8]
    bl func_0200b04c
    cmp r0, #0x0
    bne .L_02051674
    cmp r4, #0x0
    beq .L_02051674
    mov r0, r4
    ldr r3, [r0, #0x0]
    add r1, sp, #0x0
    ldr r3, [r3, #0xb8]
    mov r2, #0x1
    blx r3
.L_02051674:
    ldr r2, [sp, #0x4]
    mvn r0, #0x0
    mul r3, r2, r0
    ldr r1, [sp, #0x8]
    str r3, [sp, #0x4]
    mul r2, r1, r0
    add r1, sp, #0x0
    add r0, r5, #0x38
    str r2, [sp, #0x8]
    bl func_020050a4
    add r1, r5, #0x100
    mov r0, #0x8000
    ldrh r3, [r1, #0xf0]
    rsb r0, r0, #0x0
    mov r2, #0x0
    and r0, r3, r0
    orr r0, r0, #0x2
    strh r0, [r1, #0xf0]
    ldr r3, [r5, #0x10]
    mov r0, r5
    orr r3, r3, #0x1f0000
    str r3, [r5, #0x10]
    strh r2, [r1, #0xf8]
    ldr r1, [r5, #0x14]
    bic r1, r1, #0x800000
    str r1, [r5, #0x14]
    bl Actor_GetCollection
    mov r1, r5
    bl func_0202d494
    mov r0, r5
    bl func_02050260
    mov r0, r5
    mov r1, r4
    bl func_02050560
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0205170c: .word data_02105310
    .size func_020515fc, . - func_020515fc

