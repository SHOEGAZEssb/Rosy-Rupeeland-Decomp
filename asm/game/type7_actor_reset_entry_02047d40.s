; Matching retail form; see src/game/type7_actor_reset.c.
.text
.extern GameWork_SetFlag
.extern func_0200b2c0
.extern func_02047dd8
.extern gGameWork
.global func_02047d40
.type func_02047d40, @function

func_02047d40: ; 0x02047d40
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x234]
    cmp r0, #0x0
    beq .L_02047d7c
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x1
    movhi r0, #0x1
    movls r0, #0x0
    cmp r0, #0x0
    bne .L_02047d7c
    ldr r0, .L_02047dd0
    ldr r1, .L_02047dd4
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
.L_02047d7c:
    mov r0, r4
    bl func_02047dd8
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add ip, r4, #0x200
    mov lr, #0xf
    add r0, r4, #0x38
    strh lr, [ip, #0xa6]
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_0200b2c0
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldmia sp!, {r4, pc}
.L_02047dd0: .word gGameWork
.L_02047dd4: .word 0x417

.size func_02047d40, . - func_02047d40

