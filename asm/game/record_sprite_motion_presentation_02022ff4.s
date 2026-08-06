; Matching retail form; see src/game/record_sprite_motion_presentation.c.
.text
.extern Heap_Free
.extern OS_Halt
.extern data_020d6630
.extern data_020f4e18
.extern data_021e9ac0
.extern func_02004fe0
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
.extern func_020066a4
.extern func_0201e250
.extern func_0201e28c
.extern func_02022fbc
.extern func_02030acc
.extern func_020337d4
.extern func_02056f00
.extern func_020627a0
.extern func_020627d0
.extern func_02062918
.extern func_02063014
.extern func_02063190
.extern func_02063658
.extern func_02071ea4
.extern func_02071eb8
.extern func_02072b68
.extern func_02073ffc
.extern func_02074038

.global func_02022ff4
    .type func_02022ff4, @function
func_02022ff4: ; 0x02022ff4
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x84
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_0201e250
    ldr r1, .L_02023254
    add r0, r4, #0xc
    str r1, [r4, #0x0]
    add r1, r6, #0x18
    str r7, [r4, #0x8]
    bl func_02005030
    add r0, r4, #0x1c
    bl func_02004fe0
    add r0, r4, #0x2c
    bl func_02004fe0
    mov r0, r6
    bl func_020337d4
    bl func_02030acc
    str r0, [r4, #0x44]
    add r0, r4, #0x48
    bl func_02071ea4
    ldr r0, [r4, #0x18]
    cmp r5, #0x2
    add r0, r0, #0x10000
    str r0, [r4, #0x18]
    cmpne r5, #0x3
    bne .L_02023124
    ldr r1, [sp, #0x98]
    ldr r0, .L_02023258
    mov r1, r1, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    bl func_02063658
    mov r5, r0
    add r0, sp, #0x60
    bl func_02022fbc
    cmp r5, #0x1
    bne .L_020230b4
    ldr r0, [sp, #0x98]
    mov r2, #0x1
    mov r1, r0, lsl #0x10
    add r0, sp, #0x60
    mov r3, r2
    mov r1, r1, lsr #0x10
    bl func_020627d0
    b .L_020230d4
.L_020230b4:
    ldr r1, [sp, #0x98]
    ldr r0, [sp, #0x9c]
    mov r1, r1, lsl #0x10
    mov r2, r0, lsl #0x10
    add r0, sp, #0x60
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_020627a0
.L_020230d4:
    add r0, sp, #0x60
    mov r1, #0x0
    bl func_02062918
    ldr r1, .L_0202325c
    add r2, r4, #0x48
    ldr r1, [r1, #0x0]
    bl func_02063014
    ldr r0, [r4, #0x44]
    add r1, r4, #0x48
    mov r2, #0x2
    bl func_02073ffc
    str r0, [r4, #0x3c]
    add r0, sp, #0x60
    mov r1, #0x0
    bl func_02062918
    bl func_02063190
    mov r1, r0
    ldr r0, [r4, #0x3c]
    bl func_02072b68
    b .L_02023128
.L_02023124:
    bl OS_Halt
.L_02023128:
    ldr r0, [sp, #0x9c]
    cmp r0, #0x0
    ldreq r1, [r4, #0x3c]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    ldr r2, [r4, #0x8]
    add r0, sp, #0x40
    add r1, r4, #0xc
    bl func_020066a4
    add r0, sp, #0x50
    add r1, sp, #0x40
    bl func_02056f00
    add r0, sp, #0x40
    bl func_02005058
    ldr r0, [sp, #0x54]
    ldr r2, [sp, #0x58]
    ldr r1, [r4, #0x3c]
    mov r0, r0, asr #0xc
    strh r0, [r1, #0x2c]
    mov r0, r2, asr #0xc
    strh r0, [r1, #0x2e]
    ldr r0, [sp, #0x58]
    mov r1, #0x0
    mov r0, r0, asr #0xc
    cmp r0, #0x40
    ble .L_020231e4
    ldr r3, [sp, #0xa0]
    add r0, sp, #0x30
    mov r2, r1
    bl func_0200500c
    add r1, sp, #0x30
    add r0, r4, #0x1c
    bl func_020050a4
    add r0, sp, #0x30
    bl func_02005058
    mov r1, #0x0
    ldr r3, [sp, #0xa4]
    add r0, sp, #0x20
    mov r2, r1
    bl func_0200500c
    add r0, r4, #0x2c
    add r1, sp, #0x20
    bl func_020050a4
    add r0, sp, #0x20
    bl func_02005058
    b .L_02023238
.L_020231e4:
    ldr r3, [sp, #0xa0]
    add r0, sp, #0x10
    mov r2, r1
    rsb r3, r3, #0x0
    bl func_0200500c
    add r1, sp, #0x10
    add r0, r4, #0x1c
    bl func_020050a4
    add r0, sp, #0x10
    bl func_02005058
    ldr r1, [sp, #0xa4]
    add r0, sp, #0x0
    rsb r3, r1, #0x0
    mov r1, #0x0
    mov r2, r1
    bl func_0200500c
    add r0, r4, #0x2c
    add r1, sp, #0x0
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
.L_02023238:
    mov r1, #0x0
    add r0, sp, #0x50
    str r1, [r4, #0x40]
    bl func_02005058
    mov r0, r4
    add sp, sp, #0x84
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02023254: .word data_020d6630
.L_02023258: .word data_021e9ac0
.L_0202325c: .word data_020f4e18
    .size func_02022ff4, .-func_02022ff4

