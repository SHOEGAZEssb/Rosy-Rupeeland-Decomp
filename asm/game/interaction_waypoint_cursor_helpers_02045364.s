; Matching retail form; see src/game/interaction_waypoint_cursor.c.
.text
.global func_02045364
.type func_02045364, @function
.global func_0204539c
.type func_0204539c, @function
.global func_020453b0
.type func_020453b0, @function
.global func_020453c8
.type func_020453c8, @function
.global func_020453e8
.type func_020453e8, @function
func_02045364: ; 0x02045364
    ldr r2, [r0, #0x4]
    mov r1, #0xc
    add r3, r2, #0x1
    str r3, [r0, #0x4]
    ldr r2, [r0, #0x0]
    mla r1, r3, r1, r2
    ldrh r1, [r1, #0x8]
    cmp r1, #0x0
    beq .L_02045390
    cmp r1, #0x1
    bx lr
.L_02045390:
    mov r1, #0x0
    str r1, [r0, #0x4]
    bx lr
.size func_02045364, . - func_02045364
func_0204539c: ; 0x0204539c
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x4]
    mov r0, #0xc
    mla r0, r1, r0, r2
    bx lr
.size func_0204539c, . - func_0204539c
func_020453b0: ; 0x020453b0
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x4]
    mov r0, #0xc
    mla r0, r1, r0, r2
    add r0, r0, #0x4
    bx lr
.size func_020453b0, . - func_020453b0
func_020453c8: ; 0x020453c8
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x4]
    mov r0, #0xc
    mla r0, r1, r0, r2
    ldrh r1, [r0, #0xa]
    mov r0, #0x3c
    mul r0, r1, r0
    bx lr
.size func_020453c8, . - func_020453c8
func_020453e8: ; 0x020453e8
    ldr r3, [r0, #0x0]
    mov r0, #0x0
    mov r1, #0xc
    b .L_020453fc
.L_020453f8:
    add r0, r0, #0x1
.L_020453fc:
    mla r2, r0, r1, r3
    ldrh r2, [r2, #0x8]
    cmp r2, #0x0
    bne .L_020453f8
    bx lr
.size func_020453e8, . - func_020453e8
