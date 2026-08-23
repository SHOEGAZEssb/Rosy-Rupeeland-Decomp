.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221cba8
.extern Sound_PlayOwnedEffect
.extern gSoundContext

.global func_ov095_02218450
func_ov095_02218450:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r1, .L_022184ac
    mov r3, r0
    ldr ip, [r1, #0x48]
    ldr r0, [r1, #0x4c]
    mov r2, #0x0
    str ip, [r3, #0x2a4]
    str r0, [r3, #0x2a8]
    add r0, r3, #0x200
    strh r2, [r0, #0x98]
    strh r2, [r0, #0xdc]
    str r2, [r3, #0x2b4]
    str r2, [r3, #0x2b0]
    str r2, [sp, #0x0]
    mov r1, #0x100
    str r1, [sp, #0x4]
    ldr r0, .L_022184b0
    mov r1, #0x61
    ldr r0, [r0, #0x0]
    bl Sound_PlayOwnedEffect
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_022184ac: .word data_ov095_0221cba8
.L_022184b0: .word gSoundContext
.size func_ov095_02218450, . - func_ov095_02218450
