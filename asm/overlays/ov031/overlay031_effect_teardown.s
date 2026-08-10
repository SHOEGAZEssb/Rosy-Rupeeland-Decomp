.text

/* Exact fallback; see src/overlays/ov031/overlay031_effect_lifecycle.c for documented portable C. */
.extern data_ov031_021fe758
.extern func_02071eb8
.extern GraphicsSpriteGroup_Destroy
.extern func_ov031_021fd1c0
.extern func_ov031_021fd254
.extern Heap_Free


    .global func_ov031_021fd4b0
func_ov031_021fd4b0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021fd530
    mov r6, r0
    str r1, [r6, #0x0]
    ldr r0, [r6, #0x70]
    cmp r0, #0x0
    beq L_021fd4d8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd4d8:
    mov r4, #0x0
L_021fd4dc:
    add r0, r6, r4, lsl #0x2
    ldr r5, [r0, #0x74]
    cmp r5, #0x0
    beq L_021fd4fc
    mov r0, r5
    bl func_ov031_021fd1c0
    mov r0, r5
    bl Heap_Free
L_021fd4fc:
    add r4, r4, #0x1
    cmp r4, #0x10
    blt L_021fd4dc
    ldr r0, [r6, #0x54]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r6, #0x58]
    bl GraphicsSpriteGroup_Destroy
    add r0, r6, #0xb4
    bl func_ov031_021fd254
    add r0, r6, #0x5c
    bl func_02071eb8
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
L_021fd530: .word data_ov031_021fe758
.size func_ov031_021fd4b0, .-func_ov031_021fd4b0
    .global func_ov031_021fd534
func_ov031_021fd534:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021fd5bc
    mov r6, r0
    str r1, [r6, #0x0]
    ldr r0, [r6, #0x70]
    cmp r0, #0x0
    beq L_021fd55c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd55c:
    mov r4, #0x0
L_021fd560:
    add r0, r6, r4, lsl #0x2
    ldr r5, [r0, #0x74]
    cmp r5, #0x0
    beq L_021fd580
    mov r0, r5
    bl func_ov031_021fd1c0
    mov r0, r5
    bl Heap_Free
L_021fd580:
    add r4, r4, #0x1
    cmp r4, #0x10
    blt L_021fd560
    ldr r0, [r6, #0x54]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r6, #0x58]
    bl GraphicsSpriteGroup_Destroy
    add r0, r6, #0xb4
    bl func_ov031_021fd254
    add r0, r6, #0x5c
    bl func_02071eb8
    mov r0, r6
    bl Heap_Free
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
L_021fd5bc: .word data_ov031_021fe758
.size func_ov031_021fd534, .-func_ov031_021fd534
