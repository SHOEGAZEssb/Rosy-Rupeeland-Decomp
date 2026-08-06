; Matching retail form; see src/game/actor_extended_table_record_dispatch.c.
.text
.extern data_020e0ac8
.global func_02044ae0
.type func_02044ae0, @function
func_02044ae0: ; 0x02044ae0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x260]
    mov r4, r1
    orr r1, r2, #0x3
    str r1, [r5, #0x260]
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x134]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_02044b68
    ldr r0, .L_02044c70
    ldr r1, [r0, #0x20]
    ldr r0, [r0, #0x24]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
    b .L_02044c68
.L_02044b68:
    ldrsh r0, [r4, #0x0]
    cmp r0, #0x0
    ble .L_02044bc4
    ldr r2, [r5, #0x20]
    ldr r1, [r5, #0x234]
    ldrsh r0, [r4, #0x8]
    sub r1, r2, r1
    mov r2, r1, asr #0xc
    mul r1, r2, r2
    ldr r3, [r5, #0x1c]
    ldr r2, [r5, #0x230]
    smulbb r0, r0, r0
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    mla r1, r2, r2, r1
    cmp r1, r0
    ble .L_02044bc4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1b0]
    blx r1
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02044bc4:
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x11c]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x124]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x12c]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x130]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x224]
    tst r0, #0x1
    add r0, r5, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r5, #0x220]
    ldrne r2, [r2, r1]
    mov r1, r4
    ldreq r2, [r5, #0x220]
    blx r2
.L_02044c68:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02044c70: .word data_020e0ac8
.size func_02044ae0, . - func_02044ae0
