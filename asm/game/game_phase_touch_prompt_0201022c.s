; Matching retail form; see src/game/game_phase_touch_prompt_lifecycle.c.
.text
.extern Heap_Alloc
.extern data_020d5604
.extern data_020d5628
.extern data_020f4e14
.extern data_020f4e18
.extern func_02006108
.extern func_02071ea4
.extern func_02071ee0
.extern func_02073ffc
.extern func_020742cc
.extern func_02094bbc
.extern func_020953f4
.extern func_020954c0
.extern func_02095508
.extern gHeapContext
.global func_0201022c
func_0201022c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl func_02006108
    ldr r1, L_02010320
    add r0, r4, #0xc
    str r1, [r4, #0x0]
    str r5, [r4, #0x8]
    bl func_02071ea4
    mov r0, #0x1
    str r0, [r4, #0x20]
    mov r0, #0x3
    str r0, [r4, #0x28]
    str r0, [r4, #0x2c]
    mov r1, #0x0
    ldr r0, L_02010324
    str r1, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl func_020742cc
    ldr r3, L_02010328
    str r0, [r4, #0x18]
    ldr r1, L_0201032c
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r4, #0xc
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r1, L_02010330
    ldr r3, L_02010334
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_020102d8
    ldr r0, [r4, #0x18]
    add r1, r4, #0xc
    mov r2, #0x2
    bl func_02073ffc
    mov r1, r0
    mov r0, r5
    bl func_020953f4
    mov r5, r0
L_020102d8:
    mov r0, r5
    str r5, [r4, #0x1c]
    mov r1, #0xf4000
    mov r2, #0xd4000
    mov r3, #0x0
    bl func_02094bbc
    ldr r0, [r4, #0x1c]
    bl func_02095508
    ldr r0, [r4, #0x1c]
    mov r1, #0x0
    bl func_020954c0
    ldr r1, [r4, #0x1c]
    mov r0, r4
    ldr r2, [r1, #0x9c]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
L_02010320: .word data_020d5604
L_02010324: .word data_020f4e14
L_02010328: .word 0x329a
L_0201032c: .word data_020f4e18
L_02010330: .word data_020d5628
L_02010334: .word gHeapContext
    .size func_0201022c, . - func_0201022c

