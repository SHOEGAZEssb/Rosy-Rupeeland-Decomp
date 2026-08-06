; Matching retail form; see src/game/trigger_presentation_actor_setup.c.
.extern data_020f4e18
.extern func_02030acc
.extern func_020337d4
.extern func_02034260
.extern func_02071e60
.extern func_02071e70
.extern func_02071e80
.extern func_02072b68
.extern func_02073fc4
.text

func_0204e9e8: ; 0x0204e9e8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    ldr r2, .L_0204ea88
    mov r4, r1
    mov r5, r0
    ldr r0, [r2, #0x0]
    ldr r1, [r4, #0x4]
    bl func_02071e60
    ldr r1, .L_0204ea88
    mov r8, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r4, #0x8]
    bl func_02071e70
    ldr r1, .L_0204ea88
    mov r7, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r4, #0xc]
    bl func_02071e80
    mov r6, r0
    mov r0, r5
    bl func_020337d4
    bl func_02030acc
    ldrb ip, [r4, #0x10]
    mov r1, r8
    mov r2, r7
    mov r3, r6
    str ip, [sp, #0x0]
    bl func_02073fc4
    str r0, [r5, #0x54]
    ldrb r1, [r4, #0x11]
    bl func_02072b68
    ldr r3, [r5, #0x54]
    mov r1, r4
    ldrh r2, [r3, #0x24]
    mov r0, r5
    orr r2, r2, #0x2
    strh r2, [r3, #0x24]
    bl func_02034260
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0204ea88: .word data_020f4e18
.size func_0204e9e8, . - func_0204e9e8

    .global func_0204ea8c

func_0204ea8c: ; 0x0204ea8c
    add r2, r0, #0x100
    strh r1, [r2, #0xee]
    mov r1, #0x0
    strh r1, [r2, #0xec]
    ldr ip, .L_0204eaa8
    ldr r0, [r0, #0x54]
    bx ip
.L_0204eaa8: .word func_02072b68
.size func_0204ea8c, . - func_0204ea8c

