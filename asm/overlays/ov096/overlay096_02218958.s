.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern VecFx32Object_GetMagnitude
.extern ActorExtendedType2_UpdateTargetValidationMotion
.extern Sound_PlayOwnedEffect
.extern func_ov096_0221880c
.extern func_ov096_0221881c
.extern gSoundContext

.global func_ov096_02218958
func_ov096_02218958:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r3, [r4, #0x228]
    cmp r3, #0x0
    ldrnesh r2, [r4, #0xda]
    cmpne r2, #0x0
    beq .L_02218a8c
    ldr r2, [r0, #0x0]
    add r1, r3, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    ldr r0, [r4, #0x260]
    tst r0, #0x8
    orreq r0, r0, #0x1
    streq r0, [r4, #0x260]
    moveq r0, #0x3
    streqb r0, [r4, #0x24c]
    ldrb r0, [r4, #0x4b]
    cmp r0, #0x0
    beq .L_02218a84
    add r0, r4, #0x200
    ldrh r1, [r0, #0xae]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    bne .L_02218a70
    ldrsh r0, [r0, #0xac]
    cmp r0, #0xa
    ble .L_02218a70
    add r0, r4, #0x29c
    bl VecFx32Object_GetMagnitude
    ldr r1, .L_02218a9c
    cmp r0, r1
    ble .L_02218a70
    ldr r2, [r4, #0x3c]
    ldr r1, [r4, #0x8c]
    mov r0, r4
    add r1, r2, r1
    rsb r1, r1, #0x0
    str r1, [r4, #0x8c]
    ldr r2, [r4, #0x40]
    ldr r1, [r4, #0x90]
    add r1, r2, r1
    rsb r1, r1, #0x0
    str r1, [r4, #0x90]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10c]
    blx r1
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, #0x100
    str r1, [sp, #0x4]
    ldr r0, .L_02218aa0
    mov r3, r4
    ldr r0, [r0, #0x0]
    add r1, r1, #0xc7
    mov r2, #0x2
    bl Sound_PlayOwnedEffect
    mov r0, r4
    bl func_ov096_0221881c
    mov r1, #0x0
    cmp r0, #0x0
    movne r0, #0x2000
    strne r0, [r4, #0x44]
    add ip, r4, #0x200
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x29c
    strh r1, [ip, #0x98]
    bl func_ov096_0221880c
.L_02218a70:
    add r0, r4, #0x200
    ldrh r1, [r0, #0xae]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    strh r1, [r0, #0xae]
.L_02218a84:
    mov r0, #0x0
    b .L_02218a94
.L_02218a8c:
    mov r0, r4
    bl ActorExtendedType2_UpdateTargetValidationMotion
.L_02218a94:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_02218a9c: .word 0x666
.L_02218aa0: .word gSoundContext
.size func_ov096_02218958, . - func_ov096_02218958
