.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_object_construct.c. */
.extern data_ov041_02204d38
.extern data_ov041_02204f30
.extern data_ov041_02205820
.extern data_ov041_0220598c
.extern Heap_AllocAlternateEntry
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern func_0209a208
.extern func_020c09cc
.extern func_ov041_021fce00
.extern func_ov041_021fd000
.extern func_ov041_021ff1cc
.extern func_ov041_021ff5a8
.extern gHeapContext

    .global func_ov041_021ff20c
func_ov041_021ff20c: ; 0x021ff20c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r10, r0
    mov r4, r1
    mov r9, r2
    bl func_ov041_021ff1cc
    ldr r1, .L_021ff4b0
    add r0, r10, #0xa0
    str r1, [r10, #0x0]
    bl func_ov041_021fd000
    str r4, [r10, #0x48]
    ldr r0, [r4, #0x1f4]
    ldr r1, .L_021ff4b4
    cmp r0, #0x2
    moveq r8, #0x2a
    movne r8, #0xbe
    ldreq r6, .L_021ff4b8
    ldr r3, .L_021ff4bc
    str r8, [r10, #0x1ac]
    mov r0, r8, lsl #0x1
    mov r2, #0x4
    ldrne r6, .L_021ff4c0
    bl Heap_AllocAlternateEntry
    str r0, [r10, #0x80]
    ldr r4, [r10, #0x1ac]
    mov r0, #0xc
    mul r0, r4, r0
    ldr r1, .L_021ff4b4
    ldr r3, .L_021ff4bc
    add r0, r0, #0x8
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq .L_021ff2b4
    ldr r1, .L_021ff4c4
    ldr r5, .L_021ff4c8
    str r1, [sp, #0x0]
    mov r1, r4
    mov r2, #0xc
    mov r3, #0x8
    str r5, [sp, #0x4]
    bl func_020c09cc
.L_021ff2b4:
    str r0, [r10, #0x84]
    ldr r4, [r10, #0x1ac]
    mov r0, #0xc
    mul r0, r4, r0
    ldr r1, .L_021ff4b4
    ldr r3, .L_021ff4bc
    add r0, r0, #0x8
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq .L_021ff300
    ldr r1, .L_021ff4c4
    ldr r5, .L_021ff4c8
    str r1, [sp, #0x0]
    mov r1, r4
    mov r2, #0xc
    mov r3, #0x8
    str r5, [sp, #0x4]
    bl func_020c09cc
.L_021ff300:
    str r0, [r10, #0x88]
    ldr r0, [r10, #0x1ac]
    ldr r1, .L_021ff4b4
    ldr r3, .L_021ff4bc
    mov r0, r0, lsl #0x1
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    str r0, [r10, #0x8c]
    ldr r0, [r10, #0x1ac]
    ldr r1, .L_021ff4b4
    ldr r3, .L_021ff4bc
    mov r0, r0, lsl #0x2
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    str r0, [r10, #0x90]
    ldr r0, [r10, #0x1ac]
    ldr r1, .L_021ff4b4
    ldr r3, .L_021ff4bc
    mov r0, r0, lsl #0x1
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    str r0, [r10, #0x94]
    ldr r0, [r10, #0x1ac]
    ldr r1, .L_021ff4b4
    ldr r3, .L_021ff4bc
    mov r0, r0, lsl #0x1
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    str r0, [r10, #0x98]
    ldr r3, [r10, #0x1ac]
    mvn r2, #0x0
    b .L_021ff394
.L_021ff380:
    ldr r0, [r10, #0x80]
    mov r1, r3, lsl #0x1
    strh r2, [r0, r1]
    ldr r0, [r10, #0x98]
    strh r2, [r0, r1]
.L_021ff394:
    subs r3, r3, #0x1
    bpl .L_021ff380
    mov r0, #0xc
    ldr r11, .L_021ff4cc
    sub r7, r0, #0x1
    mov r5, #0x1
    mov r4, #0x0
.L_021ff3b0:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r11
    add r2, r11, #0x1
    add r3, r11, #0x2
    str r5, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r7, lsl #0x2
    str r0, [r1, #0x4c]
    str r4, [sp, #0x0]
    str r4, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0x4c]
    ldr ip, [ip, #0x0]
    mov r2, #0x40000
    mov r3, #0x64000
    blx ip
    add r0, r10, r7, lsl #0x2
    ldr r1, [r0, #0x4c]
    subs r7, r7, #0x1
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl .L_021ff3b0
    add r5, sp, #0x8
    mov r4, #0x0
    b .L_021ff484
.L_021ff420:
    mov r0, r5
    bl VecFx32Object_Init
    add r0, r8, r8, lsl #0x1
    add r2, r6, r0, lsl #0x2
    ldr r1, [r2, #0x4]
    mov r1, r1, lsl #0xc
    str r1, [sp, #0xc]
    ldr r1, [r2, #0x8]
    mov r1, r1, lsl #0xc
    str r4, [sp, #0x14]
    str r1, [sp, #0x10]
    ldr r1, [r6, r0, lsl #0x2]
    cmp r1, #0x1
    cmpne r1, #0x3
    ldreq r2, [r10, #0x48]
    ldreq r1, [r2, #0x1fc]
    addeq r1, r1, #0x1
    streq r1, [r2, #0x1fc]
    ldr r1, [r6, r0, lsl #0x2]
    mov r0, r10
    mov r2, r5
    bl func_ov041_021ff5a8
    str r0, [r10, #0x9c]
    mov r0, r5
    bl VecFx32Object_Destroy
.L_021ff484:
    subs r8, r8, #0x1
    bpl .L_021ff420
    mov r0, #0x80000
    str r0, [r10, #0xa4]
    mov r0, #0x1f4000
    str r0, [r10, #0xa8]
    mov r1, #0x0
    mov r0, r10
    str r1, [r10, #0x1a8]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021ff4b0: .word data_ov041_02205820
.L_021ff4b4: .word data_ov041_0220598c
.L_021ff4b8: .word data_ov041_02204d38
.L_021ff4bc: .word gHeapContext
.L_021ff4c0: .word data_ov041_02204f30
.L_021ff4c4: .word func_ov041_021fd000
.L_021ff4c8: .word func_ov041_021fce00
.L_021ff4cc: .word 0x23a5
    .size func_ov041_021ff20c, . - func_ov041_021ff20c

