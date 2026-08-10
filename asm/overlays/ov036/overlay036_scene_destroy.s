.text

/* Exact fallback; see src/overlays/ov036/overlay036_scene_lifecycle.c for documented portable C. */

    .extern Graphics3DResourceOwner_Destroy
    .extern Heap_Free
    .extern func_02075020
    .extern func_02092418
    .extern GX_SetGraphicsMode
    .extern func_02059230
    .extern func_ov048_0220b7b4
    .extern func_020923a0
    .extern data_ov036_02206124
    .extern data_020f4e14
    .extern gDebugFont
    .extern gSoundContext

    .global func_ov036_022048d8
func_ov036_022048d8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_02204994
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq L_0220490c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0220490c:
    ldr r5, [r4, #0x5c]
    cmp r5, #0x0
    beq L_02204928
    mov r0, r5
    bl Graphics3DResourceOwner_Destroy
    mov r0, r5
    bl Heap_Free
L_02204928:
    ldr r0, L_02204998
    ldr r0, [r0, #0x0]
    bl func_02075020
    ldr r0, L_0220499c
    ldr r0, [r0, #0x0]
    bl func_02075020
    add r0, r4, #0x64
    bl func_02092418
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl GX_SetGraphicsMode
    ldr r0, L_022049a0
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x1000
    strh r1, [r0, #0x0]
    ldr r0, L_022049a4
    mov r2, r1
    ldr r0, [r0, #0x0]
    bl func_02059230
    add r0, r4, #0x98
    bl func_ov048_0220b7b4
    add r0, r4, #0x64
    bl func_020923a0
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_02204994: .word data_ov036_02206124
L_02204998: .word data_020f4e14
L_0220499c: .word gDebugFont
L_022049a0: .word 0x4000050
L_022049a4: .word gSoundContext
    .size func_ov036_022048d8, .-func_ov036_022048d8

