; Matching retail form; see src/game/debug_hud_state_lifecycle.c.
.text
.extern data_0210548c
.extern func_0200f38c

    .global func_0200f260
func_0200f260: ; 0x0200f260
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov lr, #0x0
    mov r4, r0
    str lr, [r4, #0x0]
    str lr, [r4, #0x4]
    str lr, [r4, #0x8]
    str lr, [r4, #0xc]
    str lr, [r4, #0x10]
    str lr, [r4, #0x14]
    str lr, [r4, #0x18]
    str lr, [r4, #0x1c]
    ldr r3, L_0200f310
    str lr, [r4, #0x20]
    mov r2, lr
    mov ip, lr
    mov r0, #0x22
L_0200f2a4:
    mla r6, lr, r0, r3
    mov r5, ip
L_0200f2ac:
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    strh r2, [r6, r1]
    cmp r5, #0x11
    blt L_0200f2ac
    add lr, lr, #0x1
    cmp lr, #0x8
    blt L_0200f2a4
    add r0, sp, #0x0
    bl func_0200f38c
    ldr r1, [sp, #0x0]
    mov r0, r4
    str r1, [r4, #0x10]
    ldr r1, [sp, #0x4]
    str r1, [r4, #0x14]
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0x0]
    sub r1, r2, r1
    str r1, [r4, #0x18]
    ldr r2, [sp, #0xc]
    ldr r1, [sp, #0x4]
    sub r1, r2, r1
    str r1, [r4, #0x1c]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
L_0200f310: .word data_0210548c
    .size func_0200f260, . - func_0200f260

