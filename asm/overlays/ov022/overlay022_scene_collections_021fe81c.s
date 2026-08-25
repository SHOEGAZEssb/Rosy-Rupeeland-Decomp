    .text
/* Exact fallback; see src/overlays/ov022/overlay022_scene_collections.c. */
    .extern Overlay022_Menu_Deinit
    .extern Heap_Free

.global func_ov022_021fe81c
func_ov022_021fe81c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x2b4]
    cmp r0, #0x0
    beq L_021fe848
    beq L_021fe840
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe840:
    mov r0, #0x0
    str r0, [r4, #0x2b4]
L_021fe848:
    ldr r0, [r4, #0x2b8]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0xc]
    str r0, [r4, #0x2c4]
    ldr r0, [r4, #0x2b8]
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x14]
    str r0, [r4, #0x2c8]
    ldr r5, [r4, #0x2b8]
    cmp r5, #0x0
    beq L_021fe88c
    mov r0, r5
    bl Overlay022_Menu_Deinit
    mov r0, r5
    bl Heap_Free
L_021fe88c:
    mov r0, #0x0
    str r0, [r4, #0x2b8]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov022_021fe81c, . - func_ov022_021fe81c
