.text
/* Exact fallback; see overlay039_scene_destroy_place.c for portable C. */
    .extern data_ov039_022083d0
    .extern Heap_Free
    .extern VecFx32Object_Destroy
    .extern __destroy_arr
    .extern func_ov039_021fce5c
    .extern func_ov039_021fd01c
    .extern func_02099fb0

    .global func_ov039_021fd71c
func_ov039_021fd71c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd7e4
    mov r4, r0
    mov r0, #0x1e
    str r1, [r4, #0x0]
    sub r5, r0, #0x1
L_021fd734:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0xa0]
    cmp r0, #0x0
    beq L_021fd748
    bl Heap_Free
L_021fd748:
    subs r5, r5, #0x1
    bpl L_021fd734
    add r0, r4, #0xda0
    add r0, r0, #0x1000
    bl VecFx32Object_Destroy
    add r0, r4, #0x118
    ldr r3, L_021fd7e8
    add r0, r0, #0x1c00
    mov r1, #0xa
    mov r2, #0xc
    bl __destroy_arr
    add r0, r4, #0x18c
    ldr r3, L_021fd7ec
    add r0, r0, #0x1400
    mov r1, #0x5a
    mov r2, #0x10
    bl __destroy_arr
    ldr r3, L_021fd7ec
    add r0, r4, #0xb00
    mov r1, #0x5a
    mov r2, #0x10
    bl __destroy_arr
    add r0, r4, #0x6b0
    mov r1, #0x32
    mov r2, #0xc
    ldr r3, L_021fd7e8
    bl __destroy_arr
    add r0, r4, #0x58
    add r0, r0, #0x400
    mov r1, #0x32
    mov r2, #0xc
    ldr r3, L_021fd7e8
    bl __destroy_arr
    add r0, r4, #0x118
    bl func_ov039_021fd01c
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd7e4: .word data_ov039_022083d0
L_021fd7e8: .word func_ov039_021fce5c
L_021fd7ec: .word VecFx32Object_Destroy
    .size func_ov039_021fd71c, .-func_ov039_021fd71c

