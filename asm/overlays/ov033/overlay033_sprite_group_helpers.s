.text

/* Exact fallback; see src/overlays/ov033/overlay033_sprite_group_helpers.c for documented portable C. */

    .extern __destroy_arr
    .extern AnimationResourceState_Destroy
    .extern func_ov033_021fce00
    .extern Heap_Free
    .extern data_ov033_021fdd00

    .global func_ov033_021fcf8c
func_ov033_021fcf8c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, L_021fcfb8
    add r0, r4, #0x9c
    mov r1, #0x9
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r4
    bl func_ov033_021fce00
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fcfb8: .word AnimationResourceState_Destroy
.size func_ov033_021fcf8c, .-func_ov033_021fcf8c

    .global func_ov033_021fcfbc
func_ov033_021fcfbc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, L_021fcff0
    add r0, r4, #0x9c
    mov r1, #0x9
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r4
    bl func_ov033_021fce00
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fcff0: .word AnimationResourceState_Destroy
.size func_ov033_021fcfbc, .-func_ov033_021fcfbc

    .global func_ov033_021fcff4
func_ov033_021fcff4:
    ldr r3, [r0, #0x12c]
    ldr r2, [r0, #0x11c]
    ldr r1, L_021fd030
    strh r3, [r2, #0x30]
    ldr ip, [r1, #0x100]
    ldr r3, [r0, #0x130]
    ldr r2, [r0, #0x114]
    add r3, ip, r3
    strh r3, [r2, #0x2e]
    ldr r2, [r1, #0x118]
    ldr r1, [r0, #0x130]
    ldr r0, [r0, #0x118]
    add r1, r2, r1
    strh r1, [r0, #0x2e]
    bx lr
L_021fd030: .word data_ov033_021fdd00
.size func_ov033_021fcff4, .-func_ov033_021fcff4

    .global func_ov033_021fd034
func_ov033_021fd034:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
.size func_ov033_021fd034, .-func_ov033_021fd034

    .global func_ov033_021fd04c
func_ov033_021fd04c:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0xc8]
    str r1, [r0, #0xcc]
    mov r1, #0x0
    str r1, [r0, #0xd0]
    add sp, sp, #0x10
    bx lr
.size func_ov033_021fd04c, .-func_ov033_021fd04c
