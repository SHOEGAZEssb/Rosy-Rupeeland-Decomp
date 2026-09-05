.text
; Matching fallback for the portable implementation in src/game/modal_geometry.c.
.extern Graphics3dPresentation_BindImmediateTexture
.extern func_020b0a54

.global func_0209c7e8
func_0209c7e8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    ldr r2, .L_0209c878
    mov ip, #0x0
    str ip, [r2, #0x0]
    str ip, [r2, #0x14]
    str ip, [sp, #0x0]
    mov r2, #0x2000
    mov r4, r1
    mov r1, #0x60000
    str r2, [sp, #0x4]
    mov r2, #0x1000
    mov r5, r0
    str r2, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    sub r0, r2, #0x61000
    sub r2, r1, #0xe0000
    mov r3, #0x80000
    str ip, [sp, #0x10]
    bl func_020b0a54
    ldr ip, .L_0209c878
    mov r0, #0x2
    str r0, [ip, #0x0]
    mov r2, #0x0
    str r2, [ip, #0x14]
    mov r3, #0x1000000
    str r3, [ip, #0x2c]
    mov r0, r5
    mov r1, r4
    str r3, [ip, #0x2c]
    mov r3, #0x1000
    str r3, [ip, #0x2c]
    bl Graphics3dPresentation_BindImmediateTexture
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_0209c878: .word 0x4000440
.size func_0209c7e8, . - func_0209c7e8
