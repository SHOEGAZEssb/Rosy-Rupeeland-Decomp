; Matching retail form; see src/game/actor_extended_type2_release_launch.c.
.text
.extern gFx32CosSinTable
.extern data_020df9e8
.extern data_020e6d3c
.extern Actor_SaveAndForceFlags
.extern Actor_GetCachedTerrainHeight
.extern Actor_PlayHorizontalSpatialSound
.extern genrand_int32
.global ActorExtendedType2_PrepareRelease
.type ActorExtendedType2_PrepareRelease, @function
ActorExtendedType2_PrepareRelease: ; 0x020423c8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xd0]
    ldr r1, .L_02042404
    orr r2, r2, #0x80
    str r2, [r4, #0xd0]
    ldr r2, [r1, #0x1e0]
    ldr r1, [r1, #0x1e4]
    str r2, [r4, #0x218]
    str r1, [r4, #0x21c]
    bl Actor_GetCachedTerrainHeight
    str r0, [r4, #0x24]
    mov r0, r4
    bl Actor_SaveAndForceFlags
    ldmia sp!, {r4, pc}
.L_02042404: .word data_020df9e8
.size ActorExtendedType2_PrepareRelease, . - ActorExtendedType2_PrepareRelease

.global ActorExtendedType2_LaunchRandomMotion
.type ActorExtendedType2_LaunchRandomMotion, @function
ActorExtendedType2_LaunchRandomMotion: ; 0x02042408
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_SaveAndForceFlags
    ldr r1, [r4, #0x14]
    mov r0, r4
    bic r1, r1, #0x46
    str r1, [r4, #0x14]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x40]
    blx r1
    ldr r1, [r4, #0x10]
    ldr r0, .L_02042504
    orr r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    ldr r1, [r0, #0x1d8]
    ldr r0, [r0, #0x1dc]
    str r1, [r4, #0x218]
    str r0, [r4, #0x21c]
    bl genrand_int32
    ldr r1, [r4, #0x260]
    mov r0, r0, lsl #0x10
    tst r1, #0x8000
    mov r0, r0, lsr #0x10
    bne .L_020424a0
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r1, .L_02042508
    mov r2, r0, lsl #0x1
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r1, [r1, r0]
    mov r0, #0x3800
    mov r2, r2, lsl #0x1
    str r2, [r4, #0x3c]
    mov r1, r1, lsl #0x1
    str r1, [r4, #0x40]
    str r0, [r4, #0x44]
.L_020424a0:
    ldr r1, [r4, #0x54]
    mov r0, #0x100
    strh r0, [r1, #0x32]
    strh r0, [r1, #0x34]
    ldr r0, [r4, #0x54]
    mov r2, #0x0
    strh r2, [r0, #0x30]
    ldr r1, [r4, #0xd0]
    add r0, r4, #0x200
    orr r1, r1, #0x100
    str r1, [r4, #0xd0]
    ldr r3, [r4, #0x260]
    ldr r1, .L_0204250c
    bic r3, r3, #0x3
    str r3, [r4, #0x260]
    strh r2, [r0, #0x5a]
    ldrh r3, [r4, #0x4e]
    ldr r0, .L_02042510
    mov r3, r3, lsl #0x1
    ldrh r1, [r1, r3]
    cmp r1, r0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl Actor_PlayHorizontalSpatialSound
    ldmia sp!, {r4, pc}
.L_02042504: .word data_020df9e8
.L_02042508: .word gFx32CosSinTable
.L_0204250c: .word data_020e6d3c
.L_02042510: .word 0xffff
.size ActorExtendedType2_LaunchRandomMotion, . - ActorExtendedType2_LaunchRandomMotion
