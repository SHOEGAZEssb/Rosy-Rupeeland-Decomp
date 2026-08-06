; Matching retail form; see src/game/actor_extended_type2_misc_helpers.c.
.text
.extern func_02031720
    .global func_0203ef60
    .type func_0203ef60, @function
func_0203ef60: ; 0x0203ef60
    ldrsh r0, [r0, #0xd6]
    cmp r0, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    .size func_0203ef60, . - func_0203ef60

    .global func_0203ef80
    .type func_0203ef80, @function

func_0203ef80: ; 0x0203ef80
    mov r0, #0x800
    bx lr
    .size func_0203ef80, . - func_0203ef80

    .global func_0203ef88
    .type func_0203ef88, @function

func_0203ef88: ; 0x0203ef88
    mov r0, #0x800
    bx lr
    .size func_0203ef88, . - func_0203ef88

    .global func_0203ef90
    .type func_0203ef90, @function

func_0203ef90: ; 0x0203ef90
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02031720
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x190
    str r0, [r4, #0x260]
    ldmia sp!, {r4, pc}
    .size func_0203ef90, . - func_0203ef90

