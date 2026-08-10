; Matching retail form; see src/game/game_phase_script_vm_actor_subtype_command_opcode.c.
.text
.extern func_0200500c
.extern func_02005058
.extern func_02012704
.extern ActorCollection_FindActorByDescriptorValue
.extern Actor_GetCollection
.extern func_ov087_022184b0
.extern func_ov087_022186a8
.extern func_ov089_02218f28
.extern func_ov089_02219224
.global func_02018208
func_02018208:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x20
    mov r9, r0
    bl func_02012704
    mov r7, r0
    mov r0, r9
    bl func_02012704
    mov r6, r0
    mov r0, r9
    bl func_02012704
    mov r8, r0
    mov r0, r9
    bl func_02012704
    mov r5, r0
    mov r0, r9
    bl func_02012704
    mov r4, r0
    mov r0, r9
    bl func_02012704
    mov r10, r0
    ldr r0, [r9, #0x84]
    bl Actor_GetCollection
    mov r1, r10
    bl ActorCollection_FindActorByDescriptorValue
    mov r9, r0
    ldrh r1, [r9, #0x4e]
    cmp r1, #0x9
    bne L_020183bc
    cmp r4, #0x4
    addls pc, pc, r4, lsl #0x2
    b L_020184c8
L_02018284: ; jump table
    b L_02018298 ; case 0
    b L_020182c4 ; case 1
    b L_020182f4 ; case 2
    b L_02018324 ; case 3
    b L_020183a0 ; case 4
L_02018298:
    mov r1, #0x29
    mul r3, r5, r1
    mov r1, #0x1d
    mul r2, r8, r1
    str r3, [r9, #0x20c]
    mov r1, r7
    str r2, [r9, #0x210]
    add r2, r9, #0x200
    strh r6, [r2, #0x18]
    bl func_ov087_022184b0
    b L_020184c8
L_020182c4:
    add r0, sp, #0x10
    mov r1, r5, lsl #0xc
    mov r2, r8, lsl #0xc
    mov r3, r6, lsl #0xc
    bl func_0200500c
    add r1, sp, #0x10
    mov r0, r9
    mov r2, r7
    bl func_ov087_022186a8
    add r0, sp, #0x10
    bl func_02005058
    b L_020184c8
L_020182f4:
    cmp r5, #0x0
    addeq r0, r9, #0x200
    ldreqh r1, [r0, #0x1a]
    biceq r1, r1, #0x4
    streqh r1, [r0, #0x1a]
    beq L_020184c8
    cmp r5, #0x1
    addeq r0, r9, #0x200
    ldreqh r1, [r0, #0x1a]
    orreq r1, r1, #0x4
    streqh r1, [r0, #0x1a]
    b L_020184c8
L_02018324:
    add r1, r9, #0x200
    ldrh r2, [r1, #0x1a]
    add r0, r9, #0x1a
    cmp r5, #0x0
    bic r2, r2, #0x60
    strh r2, [r1, #0x1a]
    add r1, r0, #0x200
    ldrlth r0, [r1, #0x0]
    orrlt r0, r0, #0x40
    strlth r0, [r1, #0x0]
    blt L_02018360
    cmp r5, #0x0
    ldrgth r0, [r1, #0x0]
    orrgt r0, r0, #0x20
    strgth r0, [r1, #0x0]
L_02018360:
    add r1, r9, #0x200
    ldrh r2, [r1, #0x1a]
    add r0, r9, #0x1a
    cmp r8, #0x0
    bic r2, r2, #0x18
    strh r2, [r1, #0x1a]
    add r1, r0, #0x200
    ldrlth r0, [r1, #0x0]
    orrlt r0, r0, #0x8
    strlth r0, [r1, #0x0]
    blt L_020184c8
    cmp r8, #0x0
    ldrgth r0, [r1, #0x0]
    orrgt r0, r0, #0x10
    strgth r0, [r1, #0x0]
    b L_020184c8
L_020183a0:
    cmp r8, #0x0
    str r5, [r9, #0x228]
    addne r0, r9, #0x200
    ldrneh r1, [r0, #0x1a]
    orrne r1, r1, #0x100
    strneh r1, [r0, #0x1a]
    b L_020184c8
L_020183bc:
    cmp r1, #0xa
    bne L_020184c8
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b L_020184c8
L_020183d0: ; jump table
    b L_020183e0 ; case 0
    b L_020183f8 ; case 1
    b L_02018428 ; case 2
    b L_02018458 ; case 3
L_020183e0:
    mov r1, #0x6
    mul r2, r8, r1
    mov r1, r7
    str r2, [r9, #0x208]
    bl func_ov089_02218f28
    b L_020184c8
L_020183f8:
    add r0, sp, #0x0
    mov r1, r5, lsl #0xc
    mov r2, r8, lsl #0xc
    mov r3, r6, lsl #0xc
    bl func_0200500c
    add r1, sp, #0x0
    mov r0, r9
    mov r2, r7
    bl func_ov089_02219224
    add r0, sp, #0x0
    bl func_02005058
    b L_020184c8
L_02018428:
    cmp r5, #0x0
    addeq r0, r9, #0x200
    ldreqh r1, [r0, #0xc]
    biceq r1, r1, #0x4
    streqh r1, [r0, #0xc]
    beq L_020184c8
    cmp r5, #0x1
    addeq r0, r9, #0x200
    ldreqh r1, [r0, #0xc]
    orreq r1, r1, #0x4
    streqh r1, [r0, #0xc]
    b L_020184c8
L_02018458:
    add r0, r9, #0x200
    ldrh r1, [r0, #0xc]
    add r2, r9, #0x20c
    cmp r5, #0x0
    bic r1, r1, #0x60
    strh r1, [r0, #0xc]
    ldrlth r0, [r2, #0x0]
    orrlt r0, r0, #0x40
    strlth r0, [r2, #0x0]
    blt L_02018490
    cmp r5, #0x0
    ldrgth r0, [r2, #0x0]
    orrgt r0, r0, #0x20
    strgth r0, [r2, #0x0]
L_02018490:
    add r0, r9, #0x200
    ldrh r1, [r0, #0xc]
    add r2, r9, #0x20c
    cmp r8, #0x0
    bic r1, r1, #0x18
    strh r1, [r0, #0xc]
    ldrlth r0, [r2, #0x0]
    orrlt r0, r0, #0x8
    strlth r0, [r2, #0x0]
    blt L_020184c8
    cmp r8, #0x0
    ldrgth r0, [r2, #0x0]
    orrgt r0, r0, #0x10
    strgth r0, [r2, #0x0]
L_020184c8:
    mov r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.size func_02018208, . - func_02018208
