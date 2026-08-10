; Matching retail form; see src/game/rising_sprite_motion_controller.c.
.text
.extern func_0200500c
.extern func_02005058
.extern VecFx32Triple_Init
.extern VecFx32Triple_Destroy
.extern func_02006918
.extern func_02006a2c
.extern func_02008378
.extern func_02009044
.extern func_0200919c
.extern func_0200964c
.extern func_02020364
.extern func_02020374
.extern func_020203b0
.extern func_02072b68
.extern func_02073fc4
.extern gSystemState

.global func_020203e4
    .type func_020203e4, @function
func_020203e4: ; 0x020203e4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x70
    mov r4, r0
    mov r2, #0x0
    mov r6, r1
    stmia r4, {r2, r6}
    add r0, r4, #0xc
    mov r5, r3
    str r2, [r4, #0x8]
    bl func_02009044
    mov r1, #0x0
    add r0, r4, #0x1c
    str r1, [r4, #0x18]
    bl VecFx32Triple_Init
    add r0, r4, #0x4c
    bl func_02020364
    mov r1, #0x0
    ldr r2, .L_02020554
    str r1, [r4, #0x5c]
    ldr r3, [r2, #0x64]
    add r0, sp, #0x60
    str r3, [r4, #0x60]
    mov r2, r1
    mov r3, #0x46000
    bl func_0200500c
    ldr r1, [sp, #0x88]
    add r0, sp, #0x50
    add r2, sp, #0x60
    bl func_02008378
    ldr r1, [sp, #0x88]
    add r0, sp, #0x20
    add r2, sp, #0x50
    mov r3, r1
    bl func_02006918
    add r0, r4, #0x1c
    add r1, sp, #0x20
    bl func_02006a2c
    add r0, sp, #0x20
    bl VecFx32Triple_Destroy
    add r0, sp, #0x50
    bl func_02005058
    add r0, sp, #0x60
    bl func_02005058
    add r0, sp, #0x10
    mov r1, #0x100000
    mov r2, #0x2000
    mov r3, #0x78
    bl func_02020374
    add r0, r4, #0x4c
    add r1, sp, #0x10
    bl func_020203b0
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmia r5, {r1, r2, r3}
    mov r0, r6
    bl func_02073fc4
    mov r1, #0x0
    str r0, [r4, #0x0]
    bl func_02072b68
    ldr r2, [r4, #0x0]
    mov r6, #0x40
    ldrh r0, [r2, #0x24]
    mov ip, #0x2
    mov r1, #0x10000
    bic r0, r0, #0x8
    strh r0, [r2, #0x24]
    ldr r5, [r4, #0x0]
    add r0, sp, #0x4
    ldrh r3, [r5, #0x24]
    sub r2, r1, #0x20000
    mov lr, #0x1
    orr r3, r3, #0x4
    strh r3, [r5, #0x24]
    ldr r7, [r4, #0x0]
    mov r3, #0x3c
    ldrh r5, [r7, #0x24]
    orr r5, r5, #0x2
    strh r5, [r7, #0x24]
    ldr r5, [r4, #0x0]
    strh r6, [r5, #0x36]
    ldr r5, [r4, #0x0]
    strh ip, [r5, #0x32]
    strh ip, [r5, #0x34]
    ldr ip, [r4, #0x0]
    strb lr, [ip, #0x3a]
    bl func_0200964c
    add r1, sp, #0x4
    add r0, r4, #0xc
    bl func_0200919c
    mov r0, r4
    add sp, sp, #0x70
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02020554: .word gSystemState
    .size func_020203e4, .-func_020203e4
