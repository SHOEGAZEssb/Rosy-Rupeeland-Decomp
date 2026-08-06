; Matching retail form; see src/game/interaction_owned_object_pool.c.
.text
.extern Heap_Free
.extern func_02003e38
.global func_020451b8
.type func_020451b8, @function
.global func_020451d4
.type func_020451d4, @function
func_020451b8: ; 0x020451b8
    mov r2, #0x0
    mov r1, r2
.L_020451c0:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x10
    blt .L_020451c0
    bx lr

.size func_020451b8, . - func_020451b8
func_020451d4: ; 0x020451d4
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r4, #0x0
.L_020451e0:
    ldr r5, [r6, r4, lsl #0x2]
    cmp r5, #0x0
    beq .L_020451fc
    ldr r0, [r5, #0x4]
    bl func_02003e38
    mov r0, r5
    bl Heap_Free
.L_020451fc:
    add r4, r4, #0x1
    cmp r4, #0x10
    blt .L_020451e0
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.size func_020451d4, . - func_020451d4
