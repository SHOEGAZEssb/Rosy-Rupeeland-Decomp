.text
.extern data_020d41c0
.extern data_020d41ec
.extern gHeapContext
.extern Heap_Alloc
.extern Heap_Free
.extern GameString_Init
.extern GameString_AssignCopy
.extern func_02006164

/* Matching append/delete code; portable equivalents are in game_string_list.c. */
.global func_020061c0
.type func_020061c0, @function
func_020061c0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r4, r0
    ldr r1, node_tag
    ldr r3, heap_context
    mov r0, #0x10
    mov r2, #4
    bl Heap_Alloc
    movs r5, r0
    beq link_node
    mov r1, #0
    str r1, [r5]
    add r0, r5, #8
    str r1, [r5, #4]
    bl GameString_Init
    mov r1, r6
    add r0, r5, #8
    bl GameString_AssignCopy
link_node:
    ldr r0, [r4, #8]
    cmp r0, #0
    strne r5, [r0]
    ldrne r0, [r4, #8]
    strne r0, [r5, #4]
    streq r5, [r4, #4]
    str r5, [r4, #8]
    ldr r1, [r4, #0xc]
    mov r0, r5
    add r1, r1, #1
    str r1, [r4, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
node_tag:
    .word data_020d41c0
heap_context:
    .word gHeapContext
    .size func_020061c0, .-func_020061c0

.global func_02006240
.type func_02006240, @function
func_02006240:
    stmdb sp!, {r4, lr}
    ldr r1, list_vtable
    mov r4, r0
    str r1, [r4]
    bl func_02006164
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
list_vtable:
    .word data_020d41ec
    .size func_02006240, .-func_02006240
