    .text
/* Exact fallback; see src/overlays/ov018/overlay018_object_base.c. */
    .extern Heap_Free
    .extern data_020f4e18
    .extern data_ov018_021ffd00
    .extern data_ov018_021ffd20
    .extern func_02071ea4
    .extern func_02071eb8
    .extern func_02071ee0
    .extern func_02073e48
    .extern func_02073ffc
    .extern func_02095308
    .extern func_020953c8
    .extern func_0209548c
.global func_ov018_021fce00
func_ov018_021fce00:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r1
    mov r1, #0x0
    mov r5, r0
    mov r4, r2
    mov r6, r3
    bl func_020953c8
    ldr r1, L_021fcea8
    add r0, r5, #0xa0
    str r1, [r5, #0x0]
    bl func_02071ea4
    ldrh r2, [r4, #0x8]
    add r0, r5, #0xa0
    ldr r1, L_021fceac
    str r2, [sp, #0x0]
    ldr r1, [r1, #0x0]
    ldrh r2, [r4, #0x4]
    ldrh r3, [r4, #0x6]
    bl func_02071ee0
    mov r0, r7
    add r1, r5, #0xa0
    mov r2, #0x2
    bl func_02073ffc
    mov r2, r6
    str r0, [r5, #0x9c]
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldrh r1, [r4, #0xa]
    ldr r0, [r5, #0x9c]
    ldr r3, [sp, #0x20]
    bl func_02073e48
    mov r2, #0x1
    ldr r1, [r5, #0x9c]
    mov r0, r5
    strh r2, [r1, #0x2a]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021fcea8: .word data_ov018_021ffd20
L_021fceac: .word data_020f4e18
    .size func_ov018_021fce00, . - func_ov018_021fce00

    .global func_ov018_021fceb0
func_ov018_021fceb0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xa0
    bl func_02071eb8
    mov r0, r4
    bl func_0209548c
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov018_021fceb0, . - func_ov018_021fceb0

    .global func_ov018_021fced0
func_ov018_021fced0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xa0
    bl func_02071eb8
    mov r0, r4
    bl func_0209548c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov018_021fced0, . - func_ov018_021fced0

    .global func_ov018_021fcef8
func_ov018_021fcef8:
    bx lr
    .size func_ov018_021fcef8, . - func_ov018_021fcef8

    .global func_ov018_021fcefc
func_ov018_021fcefc:
    bx lr
    .size func_ov018_021fcefc, . - func_ov018_021fcefc

    .global func_ov018_021fcf00
func_ov018_021fcf00:
    ldr r2, L_021fcf1c
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fcf1c: .word data_ov018_021ffd00
    .size func_ov018_021fcf00, . - func_ov018_021fcf00

    .global func_ov018_021fcf20
func_ov018_021fcf20:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fcf3c
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fcf3c: .word data_ov018_021ffd00
    .size func_ov018_021fcf20, . - func_ov018_021fcf20

    .global func_ov018_021fcf40
func_ov018_021fcf40:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr
    .size func_ov018_021fcf40, . - func_ov018_021fcf40
