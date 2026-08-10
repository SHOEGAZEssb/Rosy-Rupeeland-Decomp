; Matching retail form; see src/game/actor_table_record_object_lifecycle.c.
.text
.extern Heap_Free
.extern data_020df910
.extern data_020ed638
.extern ActorDerivedRuntime_Init
.extern ActorDerivedRuntime_DestroyAlternate
    .global func_0203c94c
    .type func_0203c94c, @function
func_0203c94c: ; 0x0203c94c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorDerivedRuntime_Init
    ldr r0, .L_0203ca20
    mov ip, #0x0
    str r0, [r5, #0x0]
    add r0, r5, #0x200
    strh ip, [r0, #0xa]
    ldr r0, [r5, #0x20c]
    ldr r3, .L_0203ca24
    bic r0, r0, #0x4000
    bic r0, r0, #0x8000
    str r0, [r5, #0x20c]
    strb ip, [r5, #0x210]
    strb ip, [r5, #0x211]
    ldrsh r4, [r4, #0x4e]
    mov lr, ip
    mov r0, #0xe
.L_0203c998:
    mul r2, lr, r0
    ldrsh r1, [r3, r2]
    add lr, lr, #0x1
    cmp r4, r1
    addeq ip, r3, r2
    cmp lr, #0xc
    blt .L_0203c998
    str ip, [r5, #0x214]
    ldrsh r1, [ip, #0x4]
    add r0, r5, #0x200
    strh r1, [r0, #0x8]
    ldrh r1, [r0, #0x8]
    cmp r1, #0x1
    movlo r1, #0x1
    strloh r1, [r0, #0x8]
    add r0, r5, #0x200
    ldrh r1, [r0, #0x8]
    mov r0, #0x2000
    rsb r0, r0, #0x0
    ldr r2, [r5, #0x20c]
    and r1, r1, r0, lsr #0x13
    and r0, r2, r0
    orr r2, r0, r1
    str r2, [r5, #0x20c]
    ldr r0, [r5, #0x214]
    bic r2, r2, #0x2000
    ldrb r1, [r0, #0xd]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x12
    str r1, [r5, #0x20c]
    ldmia sp!, {r3, r4, r5, pc}
.L_0203ca20: .word data_020df910
.L_0203ca24: .word data_020ed638
    .size func_0203c94c, . - func_0203c94c

    .global func_0203ca28
    .type func_0203ca28, @function
func_0203ca28: ; 0x0203ca28
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorDerivedRuntime_Init
    ldr r0, .L_0203cafc
    mov ip, #0x0
    str r0, [r5, #0x0]
    add r0, r5, #0x200
    strh ip, [r0, #0xa]
    ldr r0, [r5, #0x20c]
    ldr r3, .L_0203cb00
    bic r0, r0, #0x4000
    bic r0, r0, #0x8000
    str r0, [r5, #0x20c]
    strb ip, [r5, #0x210]
    strb ip, [r5, #0x211]
    ldrsh r4, [r4, #0x4e]
    mov lr, ip
    mov r0, #0xe
.L_0203ca74:
    mul r2, lr, r0
    ldrsh r1, [r3, r2]
    add lr, lr, #0x1
    cmp r4, r1
    addeq ip, r3, r2
    cmp lr, #0xc
    blt .L_0203ca74
    str ip, [r5, #0x214]
    ldrsh r1, [ip, #0x4]
    add r0, r5, #0x200
    strh r1, [r0, #0x8]
    ldrh r1, [r0, #0x8]
    cmp r1, #0x1
    movlo r1, #0x1
    strloh r1, [r0, #0x8]
    add r0, r5, #0x200
    ldrh r1, [r0, #0x8]
    mov r0, #0x2000
    rsb r0, r0, #0x0
    ldr r2, [r5, #0x20c]
    and r1, r1, r0, lsr #0x13
    and r0, r2, r0
    orr r2, r0, r1
    str r2, [r5, #0x20c]
    ldr r0, [r5, #0x214]
    bic r2, r2, #0x2000
    ldrb r1, [r0, #0xd]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x12
    str r1, [r5, #0x20c]
    ldmia sp!, {r3, r4, r5, pc}
.L_0203cafc: .word data_020df910
.L_0203cb00: .word data_020ed638
    .size func_0203ca28, . - func_0203ca28

    .global func_0203cb04
    .type func_0203cb04, @function
func_0203cb04: ; 0x0203cb04
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0203cb04, . - func_0203cb04

    .global func_0203cb18
    .type func_0203cb18, @function
func_0203cb18: ; 0x0203cb18
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

    .size func_0203cb18, . - func_0203cb18

