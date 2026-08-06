; Matching retail form; see src/game/actor_mode_nibble_object_lifecycle.c.
.text
.extern Heap_Free
.extern data_020df774
.extern func_0203b514
.extern func_0203b61c
    .global func_0203c4e0
    .type func_0203c4e0, @function
func_0203c4e0: ; 0x0203c4e0
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r2
    bl func_0203b514
    ldr r1, .L_0203c544
    mov r0, #0x1000
    str r1, [r4, #0x0]
    add r2, r4, #0x200
    mov r1, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    ldrh ip, [r2, #0x8]
    rsb r0, r0, #0x0
    mov r3, #0x0
    and r0, ip, r0
    strh r0, [r2, #0x8]
    ldrh ip, [r2, #0x8]
    mov r0, r1, lsl #0x1c
    sub r1, r3, #0x10
    bic ip, ip, #0xf000
    orr r0, ip, r0, lsr #0x10
    strh r0, [r2, #0x8]
    strh r3, [r4, #0xd6]
    mov r0, r4
    str r1, [r4, #0x108]
    ldmia sp!, {r3, r4, r5, pc}
.L_0203c544: .word data_020df774
    .size func_0203c4e0, . - func_0203c4e0

    .global func_0203c548
    .type func_0203c548, @function
func_0203c548: ; 0x0203c548
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203b61c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0203c548, . - func_0203c548

    .global func_0203c55c
    .type func_0203c55c, @function
func_0203c55c: ; 0x0203c55c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203b61c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

    .size func_0203c55c, . - func_0203c55c

