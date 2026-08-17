.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern Scene_GetEmbedded10
.extern Sound_Play
.extern TouchRegionManager_SetEnabled
.extern Sound_PlayDirectSequence
.extern Sound_FadeDirectSequence
.extern gGameWork
.extern gSoundContext

.global func_ov060_02210470
func_ov060_02210470:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    cmp r4, #0x64
    mov r2, #0x7f
    bne .L_022104f0
    ldr r0, .L_02210578
    mov r1, #0xbc
    ldr r0, [r0, #0x0]
    bl Sound_PlayDirectSequence
    ldr r0, .L_02210578
    mov r1, #0xbc
    ldr r0, [r0, #0x0]
    mov r2, #0x3c
    mov r3, #0x0
    bl Sound_FadeDirectSequence
    ldr r2, [r5, #0x38]
    mvn r0, #0x0
    cmp r2, r0
    beq .L_022104dc
    ldr r1, .L_02210578
    mov r0, r2, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_Play
.L_022104dc:
    ldr r0, .L_0221057c
    ldr r1, .L_02210580
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    b .L_02210554
.L_022104f0:
    ldr r0, .L_02210578
    mov r1, #0xbd
    ldr r0, [r0, #0x0]
    bl Sound_PlayDirectSequence
    ldr r0, .L_02210578
    mov r1, #0xbd
    ldr r0, [r0, #0x0]
    mov r2, #0x3c
    mov r3, #0x0
    bl Sound_FadeDirectSequence
    ldr r2, [r5, #0x3c]
    mvn r0, #0x0
    cmp r2, r0
    beq .L_02210544
    ldr r1, .L_02210578
    mov r0, r2, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_Play
.L_02210544:
    ldr r0, .L_0221057c
    ldr r1, .L_02210580
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
.L_02210554:
    mov r0, r5
    bl Scene_GetEmbedded10
    mov r1, #0x0
    bl TouchRegionManager_SetEnabled
    str r4, [r5, #0x28]
    mov r0, #0x3c
    str r0, [r5, #0x2c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02210578: .word gSoundContext
.L_0221057c: .word gGameWork
.L_02210580: .word 0x3ea
.size func_ov060_02210470, . - func_ov060_02210470
