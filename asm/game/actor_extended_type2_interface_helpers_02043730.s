; Matching retail form; see src/game/actor_extended_type2_interface_helpers.c.
.text
.extern AttachmentController_SetEnabled
.global func_02043730
.type func_02043730, @function
func_02043730: ; 0x02043730
    mov r0, #0x10
    bx lr

.size func_02043730, . - func_02043730

.global func_02043738
.type func_02043738, @function
func_02043738: ; 0x02043738
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x108]
    blx r3
    ldmia sp!, {r3, pc}

.size func_02043738, . - func_02043738

.global func_02043750
.type func_02043750, @function
func_02043750: ; 0x02043750
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x108]
    blx r3
    ldmia sp!, {r3, pc}

.size func_02043750, . - func_02043750

.global func_02043768
.type func_02043768, @function
func_02043768: ; 0x02043768
    mov r0, #0x0
    bx lr

.size func_02043768, . - func_02043768

.global func_02043770
.type func_02043770, @function
func_02043770: ; 0x02043770
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x10
    str r1, [r0, #0x260]
    bx lr

.size func_02043770, . - func_02043770

.global func_02043780
.type func_02043780, @function
func_02043780: ; 0x02043780
    ldrb r0, [r0, #0x24c]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    bx lr

.size func_02043780, . - func_02043780

.global func_02043794
.type func_02043794, @function
func_02043794: ; 0x02043794
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x5
    cmpne r1, #0x6
    movne r0, #0x0
    bx lr

.size func_02043794, . - func_02043794

.global func_020437ac
.type func_020437ac, @function
func_020437ac: ; 0x020437ac
    ldrsh r1, [r0, #0xd8]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr

.size func_020437ac, . - func_020437ac

.global func_020437c4
.type func_020437c4, @function
func_020437c4: ; 0x020437c4
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr

.size func_020437c4, . - func_020437c4

.global func_020437dc
.type func_020437dc, @function
func_020437dc: ; 0x020437dc
    ldr ip, .L_020437e8
    add r0, r0, #0x284
    bx ip
.L_020437e8: .word AttachmentController_SetEnabled

.size func_020437dc, . - func_020437dc

.global func_020437ec
.type func_020437ec, @function
func_020437ec: ; 0x020437ec
    mov r0, #0x20000
    bx lr
.size func_020437ec, . - func_020437ec
