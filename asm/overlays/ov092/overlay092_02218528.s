.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_020593ac
.extern gSoundContext

.global func_ov092_02218528
func_ov092_02218528:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    sub r0, r2, #0x180
    add r0, r0, r0, lsr #0x1f
    mov r2, r0, asr #0x1
    cmp r2, #0x7f
    mov ip, r1
    movgt r2, #0x7f
    bgt .L_02218558
    mvn r0, #0x7e
    cmp r2, r0
    movlt r2, r0
.L_02218558:
    str r2, [sp, #0x0]
    mov r1, #0x0
    ldr r0, .L_02218580
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, ip, asr #0x7
    and r2, ip, #0x7f
    bl func_020593ac
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_02218580: .word gSoundContext
.size func_ov092_02218528, . - func_ov092_02218528
