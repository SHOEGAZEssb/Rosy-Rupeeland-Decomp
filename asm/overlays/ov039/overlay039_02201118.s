.text
/* Exact fallback; see overlay039_scene_lifecycle.c for portable C. */
    .extern Heap_Free
    .extern __destroy_arr
    .extern func_ov039_02200f4c
    .extern VecFx32Object_Destroy
    .extern func_02099fb0
    .extern data_ov039_02208438
    .extern func_ov039_021fce5c
    .global func_ov039_02201118
func_ov039_02201118:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, L_02201228
    mov r10, r0
    mov r0, #0xa
    str r1, [r10, #0x0]
    sub r4, r0, #0x1
L_02201130:
    add r0, r10, r4, lsl #0x2
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    beq L_02201144
    bl Heap_Free
L_02201144:
    subs r4, r4, #0x1
    bpl L_02201130
    mov r0, #0x3
    mov r7, #0x8
    mov r6, #0xc
    ldr r5, L_0220122c
    sub r8, r0, #0x1
    mov r4, r7
    mov r11, r6
L_02201168:
    add r0, r10, r8, lsl #0x2
    ldr r9, [r0, #0x9c]
    cmp r9, #0x0
    beq L_022011a8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    add r0, r9, #0xe8
    bl __destroy_arr
    mov r1, r4
    mov r2, r11
    add r0, r9, #0x88
    mov r3, r5
    bl __destroy_arr
    mov r0, r9
    bl Heap_Free
L_022011a8:
    subs r8, r8, #0x1
    bpl L_02201168
    add r0, r10, #0x19c
    ldr r3, L_02201230
    add r0, r0, #0x1400
    mov r1, #0x5a
    mov r2, #0x10
    bl __destroy_arr
    ldr r3, L_02201230
    add r0, r10, #0xb10
    mov r1, #0x5a
    mov r2, #0x10
    bl __destroy_arr
    ldr r3, L_0220122c
    add r0, r10, #0x6c0
    mov r1, #0x32
    mov r2, #0xc
    bl __destroy_arr
    add r0, r10, #0x68
    add r0, r0, #0x400
    mov r1, #0x32
    mov r2, #0xc
    ldr r3, L_0220122c
    bl __destroy_arr
    add r0, r10, #0xbc
    bl func_ov039_02200f4c
    add r0, r10, #0xac
    bl VecFx32Object_Destroy
    mov r0, r10
    bl func_02099fb0
    mov r0, r10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02201228: .word data_ov039_02208438
L_0220122c: .word func_ov039_021fce5c
L_02201230: .word VecFx32Object_Destroy
    .size func_ov039_02201118, .-func_ov039_02201118

