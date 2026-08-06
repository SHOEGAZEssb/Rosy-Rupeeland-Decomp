; Matching retail form; see src/game/type7_actor_reset.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020e1930
.extern func_02035518
.extern func_020481dc
.extern func_0206c978
.extern func_0206e590
.extern func_02072b68
.extern gGameWork
.global func_02047dd8
.global func_02047f08
.global func_02047f20
.type func_02047dd8, @function
.type func_02047f08, @function
.type func_02047f20, @function

func_02047dd8: ; 0x02047dd8
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, [r0, #0x0]
    mov r4, r0
    ldr r2, [r2, #0x54]
    mov r1, #0x1
    blx r2
    ldr ip, [r4, #0x54]
    ldr r2, .L_02047ef8
    ldrh r0, [ip, #0x24]
    add r3, r4, #0x200
    mov r1, #0x0
    bic r0, r0, #0x10
    strh r0, [ip, #0x24]
    ldr ip, [r4, #0x268]
    add r0, r4, #0x2a8
    and r2, ip, r2
    str r2, [r4, #0x268]
    strh r1, [r3, #0xa6]
    strh r1, [r3, #0x50]
    bl func_02035518
    ldr r0, [r4, #0x234]
    cmp r0, #0x0
    beq .L_02047e7c
    mov r1, #0x0
    bl func_0206e590
    ldr r5, [r4, #0x234]
    cmp r5, #0x0
    beq .L_02047e58
    mov r0, r5
    bl func_0206c978
    mov r0, r5
    bl Heap_Free
.L_02047e58:
    mov r1, #0x0
    ldr r0, .L_02047efc
    str r1, [r4, #0x234]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02047f00
    bl GameWork_ClearFlag
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x80
    str r0, [r4, #0xd0]
.L_02047e7c:
    mov r0, #0x0
    str r0, [r4, #0x210]
    mov r0, #0x2
    strh r0, [r4, #0xd6]
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, .L_02047f04
    mov r0, r4
    mov r3, #0x78
    ldmia r1, {r1, r2}
    bl func_020481dc
    ldr r1, [r4, #0x14]
    add r0, r4, #0x200
    bic r1, r1, #0x2
    bic r1, r1, #0x4
    str r1, [r4, #0x14]
    ldr r2, [r4, #0x10]
    mov r1, #0x0
    bic r2, r2, #0x1f0000
    str r2, [r4, #0x10]
    ldr r2, [r4, #0x268]
    bic r2, r2, #0x200
    str r2, [r4, #0x268]
    ldr r2, [r4, #0xd0]
    bic r2, r2, #0x4000
    str r2, [r4, #0xd0]
    strh r1, [r0, #0x46]
    ldmia sp!, {r3, r4, r5, pc}
.L_02047ef8: .word 0xfff7f753
.L_02047efc: .word gGameWork
.L_02047f00: .word 0x3fd
.L_02047f04: .word data_020e1930

func_02047f08: ; 0x02047f08
    cmp r1, #0x0
    ldr r1, [r0, #0x14]
    bicne r1, r1, #0x2
    orreq r1, r1, #0x2
    str r1, [r0, #0x14]
    bx lr

func_02047f20: ; 0x02047f20
    cmp r1, #0x0
    ldr r1, [r0, #0x14]
    bicne r1, r1, #0x4
    orreq r1, r1, #0x4
    str r1, [r0, #0x14]
    bx lr

.size func_02047dd8, func_02047f08 - func_02047dd8
.size func_02047f08, func_02047f20 - func_02047f08
.size func_02047f20, . - func_02047f20

