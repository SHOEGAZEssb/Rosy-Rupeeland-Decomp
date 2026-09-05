.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.

.global func_020a68fc
func_020a68fc:
    stmdb sp!, {r3, lr}
    mov lr, #0x0
    mvn r3, #0x0
    b .L_020a6934
.L_020a690c:
    add ip, r0, lr, lsl #0x2
    ldr ip, [ip, #0x4a8]
    cmp ip, r3
    bne .L_020a6930
    cmp r2, #0x0
    orrne r1, r1, #0x100
    add r0, r0, lr, lsl #0x2
    str r1, [r0, #0x4a8]
    ldmia sp!, {r3, pc}
.L_020a6930:
    add lr, lr, #0x1
.L_020a6934:
    cmp lr, #0x4
    blt .L_020a690c
    ldmia sp!, {r3, pc}
.size func_020a68fc, . - func_020a68fc
