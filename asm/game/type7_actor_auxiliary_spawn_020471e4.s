; Matching retail form; see src/game/type7_actor_auxiliary_spawn.c.
.text
.extern Heap_Alloc
.extern data_020e1d04
.extern func_0200cf00
.extern func_02034320
.extern gHeapContext
.global func_020471e4
.type func_020471e4, @function
func_020471e4: ; 0x020471e4
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x268]
    tst r1, #0x10
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, [r0, #0x1e0]
    cmp r1, #0x0
    beq .L_02047210
    bl func_02034320
.L_02047210:
    ldr r1, .L_0204723c
    ldr r3, .L_02047240
    mov r0, #0x9c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r2, .L_02047244
    mov r1, #0xa
    bl func_0200cf00
    ldmia sp!, {r3, pc}
.L_0204723c: .word data_020e1d04
.L_02047240: .word gHeapContext
.L_02047244: .word 0x7fff
.size func_020471e4, . - func_020471e4
