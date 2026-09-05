.text
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.
.extern Heap_Alloc
.extern data_020f305c
.extern func_02099edc
.extern func_0209a280
.extern gHeapContext

.global func_0209a208
func_0209a208:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r1
    mov r5, r3
    mov r8, r0
    mov r6, r2
    ldr r1, .L_0209a278
    ldr r3, .L_0209a27c
    mov r0, #0x48
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0209a260
    ldr r1, [sp, #0x20]
    ldrb ip, [sp, #0x24]
    str r1, [sp, #0x0]
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str ip, [sp, #0x4]
    bl func_02099edc
    mov r4, r0
.L_0209a260:
    mov r0, r8
    mov r1, r4
    bl func_0209a280
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0209a278: .word data_020f305c
.L_0209a27c: .word gHeapContext
.size func_0209a208, . - func_0209a208
