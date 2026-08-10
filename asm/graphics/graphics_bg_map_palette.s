.text
; Matching fallback for src/graphics/graphics_bg_map_palette.c.

.global func_02070f80
func_02070f80:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x24]
    mov r3, #0
    b .L_02070fb8
.L_02070f90:
    ldrh lr, [r2]
    add r3, r3, #1
    mov r12, lr, lsl #16
    add r12, r1, r12, lsr #28
    mov r12, r12, lsl #16
    mov r12, r12, lsr #16
    bic lr, lr, #0xf000
    mov r12, r12, lsl #28
    orr r12, lr, r12, lsr #16
    strh r12, [r2], #2
.L_02070fb8:
    ldr r12, [r0, #0x20]
    ldr lr, [r12, #0xc]
    ldr r12, [r12, #0x10]
    mul r12, lr, r12
    cmp r3, r12
    blt .L_02070f90
    ldmia sp!, {r3, pc}
.size func_02070f80, . - func_02070f80

