    .text
    .extern Heap_Alloc
    .extern __construct_array
    .extern data_020f4e14
    .extern data_020f4e18
    .extern data_021052fc
    .extern data_ov013_021feb58
    .extern data_ov013_021fecf0
    .extern data_ov013_021fed6c
    .extern data_ov013_021fed80
    .extern func_0201e14c
    .extern func_02071ea4
    .extern func_02071ee0
    .extern func_02072b68
    .extern func_02073ffc
    .extern func_020742cc
    .extern func_02091b6c
    .extern func_02091e28
    .extern func_02094cf0
    .extern func_020953f4
    .extern func_02095508
    .extern func_020957bc
    .extern func_ov013_021fce00
    .extern func_ov013_021fce04
    .extern gHeapContext
    .extern genrand_int32

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_scene_lifecycle.c. */
    .global func_ov013_021fce2c

func_ov013_021fce2c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_02091e28
    ldr r1, L_021fd064
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl func_02071ea4
    add r0, r4, #0x60
    bl func_02071ea4
    add r0, r4, #0x6c
    bl func_02071ea4
    add r0, r4, #0x78
    bl func_02071ea4
    ldr r1, L_021fd068
    add r0, r4, #0x8c
    str r1, [sp, #0x0]
    mov r1, #0x7
    mov r2, #0xac
    ldr r3, L_021fd06c
    bl __construct_array
    ldr r1, L_021fd068
    add r0, r4, #0x540
    str r1, [sp, #0x0]
    mov r1, #0x5
    mov r2, #0xac
    ldr r3, L_021fd06c
    bl __construct_array
    add r0, r4, #0x9c
    add r0, r0, #0x800
    bl func_020957bc
    mov r0, #0x0
    str r0, [r4, #0x978]
    add r0, r4, #0x188
    add r0, r0, #0x800
    bl func_02091b6c
    ldr r0, L_021fd070
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e14c
    ldr r3, L_021fd074
    add r0, r4, #0x54
    str r3, [sp, #0x0]
    ldr r1, L_021fd078
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r3, L_021fd07c
    add r0, r4, #0x60
    str r3, [sp, #0x0]
    ldr r1, L_021fd078
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r1, L_021fd080
    add r0, r4, #0x6c
    str r1, [sp, #0x0]
    ldr r1, L_021fd078
    mov r2, #0x3300
    ldr r1, [r1, #0x0]
    add r3, r2, #0x1
    bl func_02071ee0
    ldr r1, L_021fd084
    add r0, r4, #0x78
    str r1, [sp, #0x0]
    ldr r1, L_021fd078
    mov r2, #0x4000
    ldr r1, [r1, #0x0]
    add r3, r2, #0x1
    bl func_02071ee0
    mov r0, #0x0
    str r0, [r4, #0x9a8]
    str r0, [r4, #0x9a4]
    bl genrand_int32
    str r0, [r4, #0x978]
    mvn r0, #0x0
    str r0, [r4, #0x96c]
    str r0, [r4, #0x970]
    mov r1, #0x0
    str r1, [r4, #0x97c]
    str r1, [r4, #0x980]
    ldr r0, L_021fd070
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    moveq r0, #0x1
    streq r0, [r4, #0x97c]
    ldr r0, L_021fd088
    str r1, [r4, #0x974]
    ldr r0, [r0, #0x0]
    bl func_020742cc
    ldr r1, L_021fd088
    str r0, [r4, #0x84]
    ldr r0, [r1, #0x0]
    bl func_020742cc
    add r1, r4, #0x54
    mov r2, #0x2
    str r0, [r4, #0x88]
    bl func_02073ffc
    mov r1, #0x2
    mov r5, r0
    bl func_02072b68
    mov r0, #0x3
    strb r0, [r5, #0x3a]
    ldr r1, L_021fd08c
    ldr r3, L_021fd090
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd010
    mov r1, r5
    bl func_020953f4
L_021fd010:
    ldr r1, L_021fd094
    mov r2, #0x1
    str r0, [r4, #0x948]
    bl func_02094cf0
    mov r0, #0x0
    str r0, [r4, #0x984]
    ldr r0, [r4, #0x948]
    bl func_02095508
    mov r2, #0x0
    mov r1, r2
L_021fd038:
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x950]
    cmp r2, #0x7
    blt L_021fd038
    ldr r1, L_021fd098
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov013_021fce04
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd064: .word data_ov013_021fed6c
L_021fd068: .word func_ov013_021fce00
L_021fd06c: .word func_020957bc
L_021fd070: .word data_021052fc
L_021fd074: .word 0x329a
L_021fd078: .word data_020f4e18
L_021fd07c: .word 0x32ff
L_021fd080: .word 0x3302
L_021fd084: .word 0x4002
L_021fd088: .word data_020f4e14
L_021fd08c: .word data_ov013_021fed80
L_021fd090: .word gHeapContext
L_021fd094: .word data_ov013_021feb58
L_021fd098: .word data_ov013_021fecf0
    .size func_ov013_021fce2c, . - func_ov013_021fce2c
