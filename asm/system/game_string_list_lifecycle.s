.text
.extern data_020d41b4
.extern data_020d41ec
.extern Heap_Free
.extern func_02006164

/* Matching lifecycle code; portable equivalents are in game_string_list.c. */
.global func_02006108
.type func_02006108, @function
func_02006108:
    ldr r2, base_vtable
    mov r1, #0
    str r2, [r0]
    str r1, [r0, #4]
    bx lr
base_vtable:
    .word data_020d41b4
    .size func_02006108, .-func_02006108

.global func_02006120
.type func_02006120, @function
func_02006120:
    bx lr
    .size func_02006120, .-func_02006120

.global func_02006124
.type func_02006124, @function
func_02006124:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02006124, .-func_02006124

.global func_02006138
.type func_02006138, @function
func_02006138:
    bx lr
    .size func_02006138, .-func_02006138

.global func_0200613c
.type func_0200613c, @function
func_0200613c:
    mov r0, #0
    bx lr
    .size func_0200613c, .-func_0200613c

.global func_02006144
.type func_02006144, @function
func_02006144:
    stmdb sp!, {r4, lr}
    ldr r1, list_vtable
    mov r4, r0
    str r1, [r4]
    bl func_02006164
    mov r0, r4
    ldmia sp!, {r4, pc}
list_vtable:
    .word data_020d41ec
    .size func_02006144, .-func_02006144
