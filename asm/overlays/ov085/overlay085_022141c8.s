.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern Sound_PlayOwnedEffect
.extern func_ov085_02213bf8
.extern gSoundContext

.global func_ov085_022141c8
func_ov085_022141c8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    bl func_ov085_02213bf8
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_0221423c
    ldr r1, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r1, r0
    movlt r0, #0x7
    movge r0, #0x8
    strh r0, [r4, #0xd6]
    ldr r1, [r4, #0x54]
    ldrb r0, [r1, #0x38]
    cmp r0, #0x37
    ldreq r0, [r1, #0x20]
    cmpeq r0, #0x0
    bne .L_02214238
    mov r2, #0x0
    mov r1, #0x100
    str r2, [sp, #0x0]
    ldr r0, .L_02214244
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    add r1, r1, #0x33
    bl Sound_PlayOwnedEffect
.L_02214238:
    mov r0, #0x0
.L_0221423c:
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_02214244: .word gSoundContext
.size func_ov085_022141c8, . - func_ov085_022141c8
