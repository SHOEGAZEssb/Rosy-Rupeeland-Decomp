.text
; Matching fallback for the portable implementation in src/game/modal_sprite_effects.c.
.extern data_020f3184
.extern func_0209a208
.extern func_0209eee4

.global func_0209ef24
func_0209ef24:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r9, r1
    bl func_0209eee4
    ldr r1, .L_0209f07c
    mov r0, #0x8
    mov r6, #0x0
    ldr r11, .L_0209f080
    str r1, [r10, #0x0]
    sub r8, r0, #0x1
    mov r7, #0x2
    mov r5, r6
    mov r4, #0x46000
.L_0209ef5c:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r11
    add r2, r11, #0x1
    add r3, r11, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x48]
    mul r2, r8, r4
    str r6, [sp, #0x0]
    str r6, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0x48]
    ldr ip, [ip, #0x0]
    add r2, r2, #0x168000
    mov r3, #0x258000
    blx ip
    add r1, r10, r8, lsl #0x2
    ldr r0, [r1, #0x48]
    subs r8, r8, #0x1
    ldr r0, [r0, #0xc]
    strb r5, [r0, #0x3a]
    ldr r1, [r1, #0x48]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl .L_0209ef5c
    mov r0, #0x9
    sub r8, r0, #0x1
    mov r7, #0x2
    mov r6, #0x0
    mov r5, #0x1
    mov r4, #0x64
    mov r11, #0x46000
.L_0209efec:
    ldr r1, .L_0209f084
    str r9, [sp, #0x0]
    mov r2, r1
    mov r3, r1
    mov r0, r10
    add r2, r2, #0x1
    add r3, r3, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x68]
    mul r2, r8, r11
    str r6, [sp, #0x0]
    str r6, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0x68]
    ldr ip, [ip, #0x0]
    add r2, r2, #0x168000
    mov r3, #0x258000
    blx ip
    add r1, r10, r8, lsl #0x2
    ldr r0, [r1, #0x68]
    subs r8, r8, #0x1
    ldr r0, [r0, #0xc]
    strb r5, [r0, #0x3a]
    ldr r0, [r1, #0x68]
    str r4, [r0, #0x44]
    ldr r1, [r1, #0x68]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl .L_0209efec
    mov r0, r10
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0209f07c: .word data_020f3184
.L_0209f080: .word 0x1622
.L_0209f084: .word 0x162b
.size func_0209ef24, . - func_0209ef24
