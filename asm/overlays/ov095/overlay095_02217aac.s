.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_0203e7c8
.extern func_0205940c
.extern func_020594a4
.extern gSoundContext

.global func_ov095_02217aac
func_ov095_02217aac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    tst r0, #0x100
    beq .L_02217af0
    ldr r0, .L_02217b1c
    ldr r1, .L_02217b20
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl func_020594a4
    cmp r0, #0x0
    beq .L_02217af0
    ldr r0, .L_02217b1c
    ldr r1, .L_02217b20
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl func_0205940c
.L_02217af0:
    mov r0, r4
    bl func_0203e7c8
    ldrb r0, [r4, #0x24c]
    cmp r0, #0x8
    mvneq r0, #0x47
    mvnne r0, #0x59
    strh r0, [r4, #0x6a]
    ldr r0, [r4, #0x10]
    orr r0, r0, #0x100000
    str r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.L_02217b1c: .word gSoundContext
.L_02217b20: .word 0x1ee
.size func_ov095_02217aac, . - func_ov095_02217aac
