; Matching retail form; see src/game/tracked_resource_actor_projectile_setup.c.
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_02008378
.extern func_0200b2c0
.text
    .global func_020513ac
func_020513ac:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r4, r0
    str r1, [r4, #0x1fc]
    mov r1, #0x0
    mov r5, r2
    add r0, sp, #0x10
    mov r2, r1
    mov r3, #0x100000
    bl func_0200500c
    add r0, sp, #0x0
    add r2, sp, #0x10
    mov r1, r5
    bl func_02008378
    add r1, sp, #0x0
    add r0, r4, #0x18
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
    mov r1, #0x0
    add r0, r4, #0x38
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    ldr r1, [r4, #0xd0]
    mov r0, #0x10000
    orr r1, r1, #0x2000
    str r1, [r4, #0xd0]
    ldr r1, [r4, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x8
    str r0, [r4, #0x5c]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
    .size func_020513ac, . - func_020513ac
