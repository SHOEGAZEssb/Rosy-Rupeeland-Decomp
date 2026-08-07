    .text
    .extern func_02072b68
    .extern func_020740a4
    .extern func_02094d28
    .extern func_020958d8

/* Exact fallbacks for actor update; see src/overlays/ov016/overlay016_actor_runtime.c. */
    .global func_ov016_021fe63c

func_ov016_021fe63c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x20
    bl func_020958d8
    ldr r2, [r4, #0xe4]
    ldr r1, [r4, #0xdc]
    ldr r0, [r4, #0x1c]
    add r1, r2, r1
    and r1, r1, #0xff
    bl func_02072b68
    ldr r0, [r4, #0x18]
    bl func_020740a4
    ldr r0, [r4, #0xcc]
    cmp r0, #0x0
    beq L_021fe6cc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    ldr r0, [r4, #0xcc]
    beq L_021fe6b0
    cmp r0, #0x0
    beq L_021fe6a4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe6a4:
    mov r0, #0x0
    str r0, [r4, #0xcc]
    b L_021fe6cc
L_021fe6b0:
    mov r1, #0x1
    mov r2, #0x100
    mov r3, #0x10
    bl func_02094d28
    ldr r1, [r4, #0xcc]
    ldr r1, [r1, #0x9c]
    strh r0, [r1, #0x34]
L_021fe6cc:
    ldr r4, [r4, #0xd4]
    b L_021fe6e8
L_021fe6d4:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r4, [r4, #0x8]
L_021fe6e8:
    cmp r4, #0x0
    bne L_021fe6d4
    ldmia sp!, {r4, pc}

    .size func_ov016_021fe63c, . - func_ov016_021fe63c
