; Matching retail form; see src/game/overlay34_runtime_scene.c.
.text
.extern Scene_Init
.extern OverlaySlot_Init
.extern OverlaySlot_LoadOverlay
.extern Heap_Alloc
.extern func_ov034_021fdae8
.extern Sound_SetModalEnvelopeEnabled
.extern GridEffectActorRegistry_FinalizeDepartingActors
.extern Scene_SetFlags03
.extern data_020e5890
.extern data_020e58f0
.extern gHeapContext
.extern gSoundContext

.global Overlay34RuntimeScene_Init
Overlay34RuntimeScene_Init:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl Scene_Init
    ldr r1, .L_0206ed00
    add r0, r4, #0x28
    str r1, [r4, #0x0]
    mvn r1, #0x0
    str r1, [r4, #0x24]
    bl OverlaySlot_Init
    mov r2, #0x15
    ldr r1, .L_0206ed04
    add r0, r4, #0x28
    str r2, [r4, #0x4]
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_0206ed08
    mov r0, #0x1c8
    mov r2, #0x4
    ldr r3, .L_0206ed0c
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0206ecc4
    bl func_ov034_021fdae8
.L_0206ecc4:
    str r0, [r4, #0x34]
    mov r1, #0x1e
    ldr r0, .L_0206ed10
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x0
    mov r3, #0x14
    bl Sound_SetModalEnvelopeEnabled
    bl GridEffectActorRegistry_FinalizeDepartingActors
    mov r0, r4
    bl Scene_SetFlags03
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0206ed00: .word data_020e5890
.L_0206ed04: .word 0x22
.L_0206ed08: .word data_020e58f0
.L_0206ed0c: .word gHeapContext
.L_0206ed10: .word gSoundContext
.size Overlay34RuntimeScene_Init, . - Overlay34RuntimeScene_Init
