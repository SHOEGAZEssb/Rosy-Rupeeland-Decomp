; Matching retail form; see src/game/presentation_backed_actor_lifecycle.c.
.extern func_02030f98
.extern Type7Actor_ClearGlobalRelationshipToActor
.extern func_02031488
.extern func_0203130c
.extern Heap_Free
.extern data_020e238c
.extern data_02105788
.text
    .global func_0204d5c8
func_0204d5c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02030f98
    ldr r0, .L_0204d618
    mov r1, #0x0
    str r0, [r4, #0x0]
    add r0, r4, #0x100
    strh r1, [r0, #0xec]
    strh r1, [r0, #0xf0]
    str r1, [r4, #0x1f8]
    strb r1, [r4, #0x1ef]
    strb r1, [r4, #0x1ee]
    ldrh r0, [r4, #0x4e]
    cmp r0, #0xa
    ldreq r0, .L_0204d61c
    ldreq r1, [r0, #0x4]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x4]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204d618: .word data_020e238c
.L_0204d61c: .word data_02105788
.size func_0204d5c8, . - func_0204d5c8

    .global func_0204d620
func_0204d620:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02030f98
    ldr r0, .L_0204d670
    mov r1, #0x0
    str r0, [r4, #0x0]
    add r0, r4, #0x100
    strh r1, [r0, #0xec]
    strh r1, [r0, #0xf0]
    str r1, [r4, #0x1f8]
    strb r1, [r4, #0x1ef]
    strb r1, [r4, #0x1ee]
    ldrh r0, [r4, #0x4e]
    cmp r0, #0xa
    ldreq r0, .L_0204d674
    ldreq r1, [r0, #0x4]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x4]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204d670: .word data_020e238c
.L_0204d674: .word data_02105788
.size func_0204d620, . - func_0204d620

    .global func_0204d678
func_0204d678:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204d6cc
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    ldrh r0, [r4, #0x4e]
    cmp r0, #0xa
    ldreq r0, .L_0204d6d0
    ldreq r1, [r0, #0x4]
    subeq r1, r1, #0x1
    streq r1, [r0, #0x4]
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204d6cc: .word data_020e238c
.L_0204d6d0: .word data_02105788
.size func_0204d678, . - func_0204d678

    .global func_0204d6d4
func_0204d6d4:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204d730
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    ldrh r0, [r4, #0x4e]
    cmp r0, #0xa
    ldreq r0, .L_0204d734
    ldreq r1, [r0, #0x4]
    subeq r1, r1, #0x1
    streq r1, [r0, #0x4]
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204d730: .word data_020e238c
.L_0204d734: .word data_02105788
.size func_0204d6d4, . - func_0204d6d4

    .global func_0204d738
func_0204d738:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204d78c
    mov r4, r0
    str r1, [r4, #0x0]
    bl Type7Actor_ClearGlobalRelationshipToActor
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    ldrh r0, [r4, #0x4e]
    cmp r0, #0xa
    ldreq r0, .L_0204d790
    ldreq r1, [r0, #0x4]
    subeq r1, r1, #0x1
    streq r1, [r0, #0x4]
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204d78c: .word data_020e238c
.L_0204d790: .word data_02105788
.size func_0204d738, . - func_0204d738

