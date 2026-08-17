.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */
.extern GraphicsSpriteState_SetFrameIndex
.extern func_020bf1f8
.extern func_ov032_021fe0c4
.extern func_ov032_021fe0e8
.extern genrand_int32

    .global Overlay032_UpdatePromptBlink
Overlay032_UpdatePromptBlink:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xbdc]
    cmp r0, #0x0
    ble L_021fe084
    sub r0, r0, #0x1
    str r0, [r4, #0xbdc]
    ldr r0, [r4, #0xbd8]
    cmp r0, #0x0
    ldmleia sp!, {r4, pc}
    subs r0, r0, #0x1
    str r0, [r4, #0xbd8]
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x64
    bl func_ov032_021fe0c4
    add r0, r4, #0x94
    bl func_ov032_021fe0c4
    ldr r0, [r4, #0x64]
    mov r1, #0x0
    bl GraphicsSpriteState_SetFrameIndex
    ldr r0, [r4, #0x94]
    mov r1, #0x0
    bl GraphicsSpriteState_SetFrameIndex
    ldmia sp!, {r4, pc}
L_021fe084:
    bl genrand_int32
    mov r1, #0x3c
    bl func_020bf1f8
    add r0, r1, r1, lsl #0x2
    add r0, r0, #0xb4
    str r0, [r4, #0xbdc]
    bl genrand_int32
    mov r1, #0x3c
    bl func_020bf1f8
    add r1, r1, #0x1e
    add r0, r4, #0x64
    str r1, [r4, #0xbd8]
    bl func_ov032_021fe0e8
    add r0, r4, #0x94
    bl func_ov032_021fe0e8
    ldmia sp!, {r4, pc}
.size Overlay032_UpdatePromptBlink, .-Overlay032_UpdatePromptBlink

