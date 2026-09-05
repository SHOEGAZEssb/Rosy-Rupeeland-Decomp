.text
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.
.extern Graphics3dPresentation_BeginFrame
.extern Overlay007_RenderItems
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Sound_FadeDirectSequence
.extern Sound_PlayDirectSequence
.extern VecFx32Object_Assign
.extern VecFx32Object_Destroy
.extern func_0209eb34
.extern func_0209f270
.extern func_020a6964
.extern func_020a6990
.extern func_020a6aa8
.extern func_020bf1f8
.extern func_ov039_0220076c
.extern func_ov039_022039b8
.extern func_ov039_02207f14
.extern func_ov049_0220c0b8
.extern func_ov069_022124c4
.extern gGamePhaseRuntime
.extern gSoundContext
.extern genrand_int32

.global func_0209ed08
func_0209ed08:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x74]
    cmp r0, #0x0
    bne .L_0209ed44
    add r0, sp, #0x0
    mov r1, r4
    bl func_0209eb34
    add r1, sp, #0x0
    add r0, r4, #0x24
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    b .L_0209ed98
.L_0209ed44:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    ble .L_0209ed98
    sub r0, r0, #0x1
    str r0, [r4, #0x44]
    ldr r5, [r4, #0x48]
    bl genrand_int32
    mov r1, r5, lsl #0x1
    bl func_020bf1f8
    ldr r2, [r4, #0x28]
    sub r0, r1, r5
    add r0, r2, r0, lsl #0xc
    str r0, [r4, #0x28]
    ldr r5, [r4, #0x48]
    bl genrand_int32
    mov r1, r5, lsl #0x1
    bl func_020bf1f8
    ldr r2, [r4, #0x2c]
    sub r0, r1, r5
    add r0, r2, r0, lsl #0xc
    str r0, [r4, #0x2c]
.L_0209ed98:
    ldr r0, .L_0209eed8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    add r1, r4, #0x24
    bl Graphics3dPresentation_BeginFrame
    ldr r0, [r4, #0x8]
    add r1, r4, #0x24
    bl func_ov039_02207f14
    ldr r0, [r4, #0xc]
    add r1, r4, #0x24
    bl func_ov049_0220c0b8
    ldr r0, [r4, #0x10]
    add r1, r4, #0x24
    bl func_0209f270
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_0209edec
    add r1, r4, #0x24
    bl func_ov039_0220076c
.L_0209edec:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_0209ee00
    add r1, r4, #0x24
    bl func_ov039_022039b8
.L_0209ee00:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_0209ee14
    add r1, r4, #0x24
    bl func_ov069_022124c4
.L_0209ee14:
    ldr r0, [r4, #0x74]
    cmp r0, #0x4
    cmpne r0, #0x2e
    bne .L_0209eec8
    ldr r1, .L_0209eedc
    add r0, r4, #0x50
    mov r2, #0x6
    bl func_020a6990
    cmp r0, #0x0
    ldr r0, [r4, #0x74]
    beq .L_0209eea4
    cmp r0, #0x2e
    mov r2, #0x7f
    bne .L_0209ee68
    mov r1, #0x30
    str r1, [r4, #0x74]
    ldr r0, .L_0209eee0
    mov r1, #0x58
    ldr r0, [r0, #0x0]
    bl Sound_PlayDirectSequence
    b .L_0209ee98
.L_0209ee68:
    mov r1, #0x7
    str r1, [r4, #0x74]
    ldr r0, .L_0209eee0
    mov r1, #0x60
    ldr r0, [r0, #0x0]
    bl Sound_PlayDirectSequence
    ldr r0, .L_0209eee0
    mov r1, #0x60
    ldr r0, [r0, #0x0]
    mov r2, #0x3c
    mov r3, #0x0
    bl Sound_FadeDirectSequence
.L_0209ee98:
    add r0, r4, #0x50
    bl func_020a6964
    b .L_0209eec8
.L_0209eea4:
    cmp r0, #0x2e
    add r0, r4, #0x50
    add r1, r4, #0x24
    bne .L_0209eec0
    mov r2, #0x1
    bl func_020a6aa8
    b .L_0209eec8
.L_0209eec0:
    mov r2, #0x0
    bl func_020a6aa8
.L_0209eec8:
    ldr r0, [r4, #0x20]
    bl Overlay007_RenderItems
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0209eed8: .word gGamePhaseRuntime
.L_0209eedc: .word 0x3186
.L_0209eee0: .word gSoundContext
.size func_0209ed08, . - func_0209ed08
