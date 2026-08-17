    .text
    .extern Heap_Free
    .extern __destroy_arr
    .extern data_ov015_021fec74
    .extern Sound_ReleaseGroup
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern func_020926f8
    .extern func_020927b8
    .extern func_ov001_021fb7d4
    .extern func_ov015_021fce14
    .extern gSoundContext

/* Exact fallback; see src/overlays/ov015/overlay015_scene_lifecycle.c. */
    .global func_ov015_021fd24c

func_ov015_021fd24c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd320
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0xec]
    cmp r0, #0x0
    beq L_021fd284
    ldr r0, L_021fd324
    mov r1, #0x82
    ldr r0, [r0, #0x0]
    bl Sound_ReleaseGroup
L_021fd284:
    ldr r0, L_021fd328
    mov r1, #0x0
    strh r1, [r0, #0x0]
    ldr r0, [r4, #0xf8]
    cmp r0, #0x0
    beq L_021fd2a8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd2a8:
    ldr r5, [r4, #0xf4]
    cmp r5, #0x0
    beq L_021fd2c4
    mov r0, r5
    bl func_ov001_021fb7d4 ; func_ov003_021fb7d4
    mov r0, r5
    bl Heap_Free
L_021fd2c4:
    ldr r0, [r4, #0xdc]
    cmp r0, #0x0
    beq L_021fd2dc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd2dc:
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteGroup_Destroy
    ldr r3, L_021fd32c
    add r0, r4, #0xfc
    mov r1, #0x3
    mov r2, #0xac
    bl __destroy_arr
    add r0, r4, #0x98
    bl func_020926f8
    add r0, r4, #0x74
    bl func_020927b8
    add r0, r4, #0x64
    bl AnimationResourceState_Destroy
    add r0, r4, #0x58
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd320: .word data_ov015_021fec74
L_021fd324: .word gSoundContext
L_021fd328: .word 0x4000050
L_021fd32c: .word func_ov015_021fce14
    .size func_ov015_021fd24c, . - func_ov015_021fd24c
