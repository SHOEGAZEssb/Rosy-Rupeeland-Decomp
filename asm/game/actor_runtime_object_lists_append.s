; Matching retail form; see src/game/actor_runtime_object_lists_populate.c for
; the documented portable implementation and recovered behavior.
.text
.extern Heap_Alloc
.extern func_02005580
.extern data_020d44c0
.extern data_020d4520
.extern gHeapContext
.global func_0200be14
func_0200be14:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldrsh r4, [sp, #0x18]
    mov r8, r1
    mov r7, r2
    cmp r4, #0x0
    mov r6, r3
    addeq r4, r0, #0x4
    beq L_0200be40
    cmp r4, #0x1
    addeq r4, r0, #0x14
    addne r4, r0, #0x24
L_0200be40:
    ldr r1, L_0200bed0
    ldr r3, L_0200bed4
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_0200be70
    mov r1, r8
    mov r2, r7
    mov r3, r6
    bl func_02005580
    mov r5, r0
L_0200be70:
    ldr lr, [r5, #0x4]
    ldr r1, L_0200bed8
    ldr r0, [lr, #0x28]
    ldr r3, L_0200bed4
    orr ip, r0, #0x1000000
    mov r0, #0xc
    mov r2, #0x4
    str ip, [lr, #0x28]
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r5}
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    strne r0, [r1, #0x0]
    ldrne r1, [r4, #0x8]
    strne r1, [r0, #0x4]
    streq r0, [r4, #0x4]
    str r0, [r4, #0x8]
    ldr r1, [r4, #0xc]
    add r1, r1, #0x1
    str r1, [r4, #0xc]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_0200bed0: .word data_020d4520
L_0200bed4: .word gHeapContext
L_0200bed8: .word data_020d44c0
.size func_0200be14, . - func_0200be14

