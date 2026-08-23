.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern Sound_Play
.extern ActorContactState_AddContact
.extern Fx32Vector2_Magnitude
.extern func_020adc90
.extern gSoundContext

.global func_ov079_02212f68
func_ov079_02212f68:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r1
    ldrb r1, [r6, #0x4d]
    mov r7, r0
    mov r5, r2
    cmp r1, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02212fa8
    mov r0, r7
    ldr r2, [r0, #0x0]
    mov r1, r6
    ldr r2, [r2, #0x1b4]
    blx r2
    b .L_0221304c
.L_02212fa8:
    cmp r1, #0x2
    bne .L_0221304c
    ldr r3, [r6, #0x1c]
    ldr r2, [r7, #0x1c]
    ldr r1, [r6, #0x20]
    ldr r0, [r7, #0x20]
    sub r4, r3, r2
    sub r9, r1, r0
    mov r0, r4
    mov r1, r9
    bl Fx32Vector2_Magnitude
    mov r8, r0
    cmp r8, #0x1000
    ble .L_0221304c
    mov r0, r4
    mov r1, r8
    bl func_020adc90
    mov r4, r0
    mov r0, r9
    mov r1, r8
    bl func_020adc90
    ldr r1, [r7, #0x8c]
    sub r1, r1, r4
    str r1, [r7, #0x8c]
    ldr r1, [r7, #0x90]
    sub r1, r1, r0
    str r1, [r7, #0x90]
    ldr r1, [r6, #0x8c]
    add r1, r1, r4
    str r1, [r6, #0x8c]
    ldr r1, [r6, #0x90]
    add r0, r1, r0
    str r0, [r6, #0x90]
    ldr r0, [r7, #0x10]
    tst r0, #0x4
    beq .L_0221304c
    ldr r0, .L_02213060
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl Sound_Play
.L_0221304c:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl ActorContactState_AddContact
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02213060: .word gSoundContext
.size func_ov079_02212f68, . - func_ov079_02212f68
