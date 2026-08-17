.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_sound_fade.c.
.extern Sound_PlayDirectSequence
.extern Sound_SetDirectSequenceVariable
.extern func_02059344
.extern gSoundContext

.global func_ov090_0221b7f8
func_ov090_0221b7f8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, .L_0221b8c0
    mov r4, r0
    ldr r0, [r2, #0x0]
    mov r5, r1
    mov r1, #0x54
    bl func_02059344
    cmp r0, #0x0
    bne .L_0221b848
    ldr r0, .L_0221b8c0
    mov r1, #0x55
    ldr r0, [r0, #0x0]
    bl func_02059344
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, .L_0221b8c0
    mov r1, #0x54
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl Sound_PlayDirectSequence
.L_0221b848:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x44]
    add r1, r1, r5
    strh r1, [r0, #0x44]
    ldrsh r1, [r0, #0x44]
    cmp r1, #0x0
    movlt r1, #0x0
    strlth r1, [r0, #0x44]
    blt .L_0221b878
    cmp r1, #0x7f
    movgt r1, #0x7f
    strgth r1, [r0, #0x44]
.L_0221b878:
    add r0, r4, #0x200
    ldr r1, .L_0221b8c0
    ldrh r3, [r0, #0x44]
    ldr r0, [r1, #0x0]
    ldr r2, .L_0221b8c4
    mov r1, #0x54
    bl Sound_SetDirectSequenceVariable
    add r0, r4, #0x200
    ldrsh r2, [r0, #0x44]
    ldr r0, .L_0221b8c0
    mov r1, #0x54
    rsb r2, r2, #0x7f
    mov r2, r2, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r3, r2, lsr #0x10
    mov r2, #0x7200
    bl Sound_SetDirectSequenceVariable
    ldmia sp!, {r3, r4, r5, pc}
.L_0221b8c0: .word gSoundContext
.L_0221b8c4: .word 0x2330
.size func_ov090_0221b7f8, . - func_ov090_0221b7f8
