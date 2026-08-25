.text

/* Exact fallback; see src/overlays/ov036/overlay036_scene_lifecycle.c for documented portable C. */

    .extern Graphics3DResourceOwner_Destroy
    .extern Heap_Free
    .extern GraphicsSpriteRenderer_Resume
    .extern GraphicsBankStateSnapshot_Restore
    .extern GX_SetGraphicsMode
    .extern SoundPhaseManager_Update
    .extern func_ov048_0220b7b4
    .extern GraphicsBankStateSnapshot_Destroy
    .extern data_ov036_02206124
    .extern data_020f4e14
    .extern gDebugFont
    .extern gSoundContext

    .global func_ov036_022049c8
func_ov036_022049c8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_02204a8c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq L_022049fc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_022049fc:
    ldr r5, [r4, #0x5c]
    cmp r5, #0x0
    beq L_02204a18
    mov r0, r5
    bl Graphics3DResourceOwner_Destroy
    mov r0, r5
    bl Heap_Free
L_02204a18:
    ldr r0, L_02204a90
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Resume
    ldr r0, L_02204a94
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_Resume
    add r0, r4, #0x64
    bl GraphicsBankStateSnapshot_Restore
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
    ldr r0, L_02204a98
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x1000
    strh r1, [r0, #0x0]
    ldr r0, L_02204a9c
    mov r2, r1
    ldr r0, [r0, #0x0]
    bl SoundPhaseManager_Update
    add r0, r4, #0x98
    bl func_ov048_0220b7b4
    add r0, r4, #0x64
    bl GraphicsBankStateSnapshot_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_02204a8c: .word data_ov036_02206124
L_02204a90: .word data_020f4e14
L_02204a94: .word gDebugFont
L_02204a98: .word 0x4000050
L_02204a9c: .word gSoundContext
    .size func_ov036_022049c8, .-func_ov036_022049c8

