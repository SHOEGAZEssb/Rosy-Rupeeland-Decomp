; Matching retail form; see src/game/actor_derived_type1_misc_helpers.c.
.text
.extern data_021056e4
.extern AttachmentController_SetEnabled

    .global func_02039de0
    .type func_02039de0, @function
func_02039de0: ; 0x02039de0
    ldr r1, [r0, #0xd0]
    tst r1, #0x40
    addeq r0, r0, #0x200
    ldreqh r0, [r0, #0xa2]
    cmpeq r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
    .size func_02039de0, . - func_02039de0

    .global func_02039e00
    .type func_02039e00, @function
func_02039e00: ; 0x02039e00
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x5
    cmpne r1, #0x6
    movne r0, #0x0
    bx lr
    .size func_02039e00, . - func_02039e00

    .global func_02039e18
    .type func_02039e18, @function
func_02039e18: ; 0x02039e18
    ldrsh r1, [r0, #0xd8]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr
    .size func_02039e18, . - func_02039e18

    .global func_02039e30
    .type func_02039e30, @function
func_02039e30: ; 0x02039e30
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr
    .size func_02039e30, . - func_02039e30

    .global func_02039e48
    .type func_02039e48, @function
func_02039e48: ; 0x02039e48
    ldr ip, .L_02039e54
    add r0, r0, #0x2a8
    bx ip
.L_02039e54: .word AttachmentController_SetEnabled
    .size func_02039e48, . - func_02039e48

    .global func_02039e58
    .type func_02039e58, @function
func_02039e58: ; 0x02039e58
    add r0, r0, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xa4]
    bx lr
    .size func_02039e58, . - func_02039e58

    .global func_02039e68
    .type func_02039e68, @function
func_02039e68: ; 0x02039e68
    mov r0, #0x10000
    bx lr
    .size func_02039e68, . - func_02039e68

    .global func_02039e70
    .type func_02039e70, @function
func_02039e70: ; 0x02039e70
    ldr r0, .L_02039e7c
    ldr r0, [r0, #0xc]
    bx lr
.L_02039e7c: .word data_021056e4
    .size func_02039e70, . - func_02039e70

    .global func_02039e80
    .type func_02039e80, @function
func_02039e80: ; 0x02039e80
    ldr r0, .L_02039e98
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    ldrne r0, .L_02039e9c
    strneh r0, [r1, #0xe4]
    bx lr
.L_02039e98: .word data_021056e4
.L_02039e9c: .word 0x20e
    .size func_02039e80, . - func_02039e80
