; Matching retail form; see src/game/game_phase_state_object_create.c.
.text
.extern Heap_Alloc
.extern data_020d554c
.extern func_0201185c
.extern func_02011a44
.extern func_02029218
.extern func_02029ca4
.extern func_0202becc
.extern func_0202c308
.extern func_0202c744
.extern func_0202cbe0
.extern gHeapContext

    .global GamePhaseState_CreatePhaseObject
GamePhaseState_CreatePhaseObject: ; 0x0200f0b4
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, L_0200f250
    mov r2, #0x4000000
    ldrh r3, [r4, #0x0]
    sub lr, r4, #0x2
    sub ip, r4, #0x4
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    strh r3, [r4, #0x0]
    ldrh r5, [lr, #0x0]
    sub r3, r4, #0x6
    mov r4, r1
    bic r1, r5, #0x3
    orr r1, r1, #0x1
    strh r1, [lr, #0x0]
    ldrh r1, [ip, #0x0]
    mov r5, r0
    bic r0, r1, #0x3
    strh r0, [ip, #0x0]
    ldrh r0, [r3, #0x0]
    bic r0, r0, #0x3
    strh r0, [r3, #0x0]
    ldr r0, [r2, #0x0]
    bic r0, r0, #0x38000000
    str r0, [r2, #0x0]
    ldr r0, [r4, #0x0]
    mov r2, #0x4
    cmp r0, #0x2
    cmpne r0, #0xc7
    bne L_0200f154
    ldr r0, L_0200f254
    ldr r1, L_0200f258
    ldr r3, L_0200f25c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200f148
    bl func_0202becc
L_0200f148:
    add r1, r5, #0x2000
    str r0, [r1, #0xeb0]
    b L_0200f204
L_0200f154:
    cmp r0, #0x3
    bne L_0200f184
    ldr r0, L_0200f254
    ldr r1, L_0200f258
    ldr r3, L_0200f25c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200f178
    bl func_0202c308
L_0200f178:
    add r1, r5, #0x2000
    str r0, [r1, #0xeb0]
    b L_0200f204
L_0200f184:
    cmp r0, #0x4
    bne L_0200f1b4
    ldr r0, L_0200f254
    ldr r1, L_0200f258
    ldr r3, L_0200f25c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200f1a8
    bl func_0202c744
L_0200f1a8:
    add r1, r5, #0x2000
    str r0, [r1, #0xeb0]
    b L_0200f204
L_0200f1b4:
    cmp r0, #0x5d
    ldr r0, L_0200f254
    bne L_0200f1e4
    ldr r1, L_0200f258
    ldr r3, L_0200f25c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200f1d8
    bl func_0202cbe0
L_0200f1d8:
    add r1, r5, #0x2000
    str r0, [r1, #0xeb0]
    b L_0200f204
L_0200f1e4:
    ldr r1, L_0200f258
    ldr r3, L_0200f25c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200f1fc
    bl func_02029218
L_0200f1fc:
    add r1, r5, #0x2000
    str r0, [r1, #0xeb0]
L_0200f204:
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeb0]
    ldr r1, [r4, #0x4]
    ldr ip, [r0, #0x0]
    mov r2, #0x1
    ldr ip, [ip, #0x14]
    mov r3, #0x0
    blx ip
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeb0]
    add r1, r4, #0x34
    bl func_02029ca4
    ldr r1, [r4, #0x4]
    add r0, r5, #0x2f80
    bl func_0201185c
    ldr r1, [r4, #0x48]
    add r0, r5, #0x2f80
    bl func_02011a44
    ldmia sp!, {r3, r4, r5, pc}
L_0200f250: .word 0x400000e
L_0200f254: .word 0x187c
L_0200f258: .word data_020d554c
L_0200f25c: .word gHeapContext
    .size GamePhaseState_CreatePhaseObject, . - GamePhaseState_CreatePhaseObject
