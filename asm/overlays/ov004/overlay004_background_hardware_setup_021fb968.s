    .text
    .extern TitleDisplay_ConfigureMain2dEngine
    .extern TitleDisplay_SetMainBgPriorities
    .extern TitleDisplay_ConfigureSub2dEngine
    .extern TitleDisplay_SetSubBgPriorities
    .global func_ov004_021fb968
func_ov004_021fb968: ; 0x021fb968
    stmdb sp!, {r4, lr}
    ldr r3, L_021fba1c
    mov r4, r0
    ldrh r2, [r3, #0x0]
    mov r1, #0x18
    mov r0, #0x5
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r4, #0x48]
    bl TitleDisplay_ConfigureMain2dEngine
    ldr lr, L_021fba20
    mov r0, #0x0
    ldrh r3, [lr, #0x0]
    mov r1, #0x1
    mov r2, #0x2
    and r3, r3, #0x43
    orr r3, r3, #0xb800
    strh r3, [lr, #0x0]
    ldrh ip, [lr, #0x2]
    mov r3, #0x3
    and ip, ip, #0x43
    orr ip, ip, #0xc10
    orr ip, ip, #0xb000
    strh ip, [lr, #0x2]
    bl TitleDisplay_SetMainBgPriorities
    mov r1, #0x18
    mov r0, #0x5
    str r1, [r4, #0x4c]
    bl TitleDisplay_ConfigureSub2dEngine
    ldr ip, L_021fba24
    mov r0, #0x0
    ldrh r3, [ip, #0x0]
    mov r1, #0x1
    mov r2, #0x2
    and r3, r3, #0x43
    orr r3, r3, #0xb800
    strh r3, [ip, #0x0]
    ldrh r4, [ip, #0x2]
    mov r3, #0x3
    and r4, r4, #0x43
    orr r4, r4, #0xc10
    orr r4, r4, #0xb000
    strh r4, [ip, #0x2]
    bl TitleDisplay_SetSubBgPriorities
    ldmia sp!, {r4, pc}
L_021fba1c: .word 0x4000304
L_021fba20: .word 0x400000c
L_021fba24: .word 0x400100c
    .size func_ov004_021fb968, .-func_ov004_021fb968
