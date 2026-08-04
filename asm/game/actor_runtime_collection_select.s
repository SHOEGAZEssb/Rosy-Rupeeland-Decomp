; Matching retail form; see src/game/actor_runtime_collection_selection.c for
; the documented portable implementation and recovered behavior.
.text
.extern GameWork_SetFlag
.extern OS_Halt
.extern gGameWork
.global func_0200af0c
func_0200af0c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x0]
    mov r4, r1
    tst r0, #0x2
    beq L_0200af64
    ldr r3, [r5, #0x9c]
    ldr r0, [r4, #0x14]
    ldr r1, [r3, #0x14]
    and r2, r0, #0x2000
    ands r0, r1, #0x2000
    cmpeq r2, #0x0
    beq L_0200af4c
    cmp r0, #0x0
    cmpne r2, #0x0
    beq L_0200af54
L_0200af4c:
    bl OS_Halt
    b L_0200af64
L_0200af54:
    cmp r0, #0x0
    bne L_0200af64
    cmp r2, #0x0
    movne r4, r3
L_0200af64:
    ldr r1, [r5, #0x0]
    ldr r0, L_0200af88
    orr r1, r1, #0x2
    str r1, [r5, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x400
    bl GameWork_SetFlag
    str r4, [r5, #0x9c]
    ldmia sp!, {r3, r4, r5, pc}
L_0200af88: .word gGameWork
.size func_0200af0c, . - func_0200af0c

