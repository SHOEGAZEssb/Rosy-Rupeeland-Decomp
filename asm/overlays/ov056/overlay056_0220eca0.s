.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern Heap_Alloc
.extern data_ov056_0220f670
.extern data_ov056_0220f6fc
.extern func_ov056_0220ed50
.extern func_ov056_0220f458
.extern gHeapContext

.global func_ov056_0220eca0
func_ov056_0220eca0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    bl func_ov056_0220ed50
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, .L_0220ed40
    ldr r1, .L_0220ed44
    ldr r3, .L_0220ed48
    mvn r2, #0x3
    bl Heap_Alloc
    movs r5, r0
    beq .L_0220ecf0
    add r1, r4, #0x4c
    mov r2, r7
    mov r3, r6
    add r1, r1, #0x800
    bl func_ov056_0220f458
    mov r5, r0
.L_0220ecf0:
    ldr r1, .L_0220ed4c
    ldr r3, .L_0220ed48
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r5}
    ldr r1, [r4, #0x844]
    cmp r1, #0x0
    strne r0, [r1, #0x0]
    ldrne r1, [r4, #0x844]
    strne r1, [r0, #0x4]
    streq r0, [r4, #0x840]
    str r0, [r4, #0x844]
    ldr r0, [r4, #0x848]
    add r0, r0, #0x1
    str r0, [r4, #0x848]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220ed40: .word 0x818
.L_0220ed44: .word data_ov056_0220f6fc
.L_0220ed48: .word gHeapContext
.L_0220ed4c: .word data_ov056_0220f670
.size func_ov056_0220eca0, . - func_ov056_0220eca0
