.text
; Matching fallback for the portable implementation in src/game/modal_sprite_effects.c.
.extern GraphicsSpriteState_SetAnimationIndex
.extern Sound_Play
.extern VecFx32Object_Destroy
.extern VecFx32Object_InitCopy
.extern func_0209f148
.extern gSoundContext

.global func_0209f09c
func_0209f09c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r2, #0x8
    mov r6, r0
    mov r5, r1
    sub r4, r2, #0x1
.L_0209f0b4:
    add r2, r6, r4, lsl #0x2
    ldr r1, [r2, #0x48]
    ldrh r0, [r1, #0x42]
    tst r0, #0x4
    beq .L_0209f134
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r2, #0x48]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r6, r4, lsl #0x2
    ldr r1, [r0, #0x48]
    add r0, sp, #0x0
    ldr r3, [r1, #0xc]
    mov r1, r5
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x2
    strh r2, [r3, #0x24]
    bl VecFx32Object_InitCopy
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x48]
    add r1, sp, #0x0
    bl func_0209f148
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r0, .L_0209f144
    mov r1, #0x63
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
    b .L_0209f13c
.L_0209f134:
    subs r4, r4, #0x1
    bpl .L_0209f0b4
.L_0209f13c:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0209f144: .word gSoundContext
.size func_0209f09c, . - func_0209f09c
