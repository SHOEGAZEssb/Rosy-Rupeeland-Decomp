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

.global func_02023308
    .type func_02023308, @function
func_02023308: ; 0x02023308
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r2, [r4, #0x8]
    add r0, sp, #0x0
    add r1, r4, #0xc
    bl func_020066a4
    add r0, sp, #0x10
    add r1, sp, #0x0
    bl func_02056f00
    add r0, sp, #0x0
    bl func_02005058
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    ldr r2, [r4, #0x3c]
    mov r0, r0, asr #0xc
    strh r0, [r2, #0x2c]
    mov r3, r1, asr #0xc
    add r0, r4, #0xc
    add r1, r4, #0x1c
    strh r3, [r2, #0x2e]
    bl func_020050c8
    add r0, r4, #0x1c
    add r1, r4, #0x2c
    bl func_020050c8
    ldr r0, [r4, #0x40]
    add r0, r0, #0x1
    str r0, [r4, #0x40]
    cmp r0, #0x3c
    add r0, sp, #0x10
    blt .L_02023390
    bl func_02005058
    mov r0, #0x1
    b .L_02023398
.L_02023390:
    bl func_02005058
    mov r0, #0x0
.L_02023398:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
    .size func_02023308, .-func_02023308

