.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_020423c8
.extern func_0205940c
.extern func_020594a4
.extern gSoundContext

.global func_ov095_0221ac20
func_ov095_0221ac20:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221ac64
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0221ac68
    mov r2, #0x7
    bl func_020594a4
    cmp r0, #0x0
    beq .L_0221ac58
    ldr r0, .L_0221ac64
    ldr r1, .L_0221ac68
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl func_0205940c
.L_0221ac58:
    mov r0, r4
    bl func_020423c8
    ldmia sp!, {r4, pc}
.L_0221ac64: .word gSoundContext
.L_0221ac68: .word 0x1ee
.size func_ov095_0221ac20, . - func_ov095_0221ac20
