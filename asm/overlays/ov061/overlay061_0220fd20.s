.text
; Matching fallback for the portable implementation in src/overlays/ov061/overlay061_recovery.c.
.extern Scene_Init
.extern Scene_SetFlags03
.extern Sound_Play
.extern data_ov061_022102b0
.extern func_0200f38c
.extern func_0200f404
.extern func_0200f788
.extern func_0200f824
.extern func_ov061_0220fdd0
.extern gSoundContext

.global func_ov061_0220fd20
func_ov061_0220fd20:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl Scene_Init
    ldr r1, .L_0220fdc4
    mov r0, #0x0
    str r1, [r4, #0x0]
    str r7, [r4, #0x28]
    str r0, [r4, #0x2c]
    str r0, [r4, #0x30]
    add r0, sp, #0x0
    str r5, [r4, #0x38]
    bl func_0200f38c
    mov r1, #0x0
    add r0, sp, #0x0
    sub r2, r1, #0x40
    bl func_ov061_0220fdd0
    bl func_0200f824
    add r1, sp, #0x0
    bl func_0200f788
    bl func_0200f824
    mov r1, r7
    mov r2, r6
    mov r3, #0x1
    bl func_0200f404
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_0220fdb0
    ldr r0, .L_0220fdc8
    ldr r1, .L_0220fdcc
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
.L_0220fdb0:
    mov r0, r4
    bl Scene_SetFlags03
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220fdc4: .word data_ov061_022102b0
.L_0220fdc8: .word gSoundContext
.L_0220fdcc: .word 0x186
.size func_ov061_0220fd20, . - func_ov061_0220fd20
