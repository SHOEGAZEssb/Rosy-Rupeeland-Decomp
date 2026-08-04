.text
.extern GameString_Destroy
.extern Heap_Free

/* Matching clear loop; portable equivalent is in game_string_list.c. */
.global func_02006164
.type func_02006164, @function
func_02006164:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r4, [r6, #4]
    b clear_test
clear_node:
    add r0, r4, #8
    ldr r1, [r0]
    ldr r5, [r4]
    ldr r1, [r1]
    blx r1
    cmp r4, #0
    beq next_node
    add r0, r4, #8
    bl GameString_Destroy
    mov r0, r4
    bl Heap_Free
next_node:
    mov r4, r5
clear_test:
    cmp r4, #0
    bne clear_node
    mov r0, #0
    str r0, [r6, #4]
    str r0, [r6, #8]
    str r0, [r6, #0xc]
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02006164, .-func_02006164
