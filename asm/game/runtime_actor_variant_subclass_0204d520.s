; Matching retail form; see src/game/runtime_actor_variant_subclass.c.
.extern func_0204d244
.extern func_0204d2f4
.extern Heap_Free
.extern data_020e2238
.text
    .global func_0204d520
func_0204d520: ; 0x0204d520
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204d244
    ldr r1, .L_0204d53c
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0204d53c: .word data_020e2238
.size func_0204d520, . - func_0204d520

    .global func_0204d540
func_0204d540: ; 0x0204d540
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204d2f4
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0204d540, . - func_0204d540

    .global func_0204d554
func_0204d554: ; 0x0204d554
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204d2f4
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0204d554, . - func_0204d554

    .global func_0204d570
func_0204d570: ; 0x0204d570
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204d2f4
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0204d570, . - func_0204d570

    .global func_0204d584
func_0204d584: ; 0x0204d584
    mov r0, #0x0
    bx lr
.size func_0204d584, . - func_0204d584

    .global func_0204d58c
func_0204d58c: ; 0x0204d58c
    mov r0, #0x0
    bx lr
.size func_0204d58c, . - func_0204d58c

    .global func_0204d594
func_0204d594: ; 0x0204d594
    mov r0, #0x0
    bx lr
.size func_0204d594, . - func_0204d594

    .global func_0204d59c
func_0204d59c: ; 0x0204d59c
    bx lr
.size func_0204d59c, . - func_0204d59c

    .global func_0204d5a0
func_0204d5a0: ; 0x0204d5a0
    bx lr
.size func_0204d5a0, . - func_0204d5a0

    .global func_0204d5a4
func_0204d5a4: ; 0x0204d5a4
    mov r0, #0x1
    bx lr
.size func_0204d5a4, . - func_0204d5a4

