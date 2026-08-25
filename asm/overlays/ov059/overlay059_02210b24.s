.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern data_ov059_02211ac8
.extern Heap_AllocAlternateEntry
.extern CxxArray_ConstructWithCookie
.extern func_ov059_0220fd20
.extern func_ov059_0220fd64
.extern func_ov059_02210ab0
.extern gHeapContext

.global func_ov059_02210b24
func_ov059_02210b24:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r2, [r5, #0x0]
    mov r4, r1
    cmp r2, #0x0
    beq .L_02210b44
    bl func_ov059_02210ab0
.L_02210b44:
    mov r0, #0x70
    mul r0, r4, r0
    ldr r1, .L_02210b94
    ldr r3, .L_02210b98
    add r0, r0, #0x8
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq .L_02210b88
    ldr r1, .L_02210b9c
    ldr ip, .L_02210ba0
    str r1, [sp, #0x0]
    mov r1, r4
    mov r2, #0x70
    mov r3, #0x8
    str ip, [sp, #0x4]
    bl CxxArray_ConstructWithCookie
.L_02210b88:
    stmia r5, {r0, r4}
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02210b94: .word data_ov059_02211ac8
.L_02210b98: .word gHeapContext
.L_02210b9c: .word func_ov059_0220fd20
.L_02210ba0: .word func_ov059_0220fd64
.size func_ov059_02210b24, . - func_ov059_02210b24
