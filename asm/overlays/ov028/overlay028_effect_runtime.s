.text

/* Exact fallback; see src/overlays/ov028/overlay028_effect_runtime.c. */
.extern data_020f4e18
.extern data_ov028_021ff2d0
.extern func_02071ea4
.extern func_02071eb8
.extern func_02071ee0
.extern func_02071f38
.extern func_02073e48
.extern func_02073ffc
.extern func_02074058
.extern func_0207419c
.extern func_020742cc
.extern func_02076428
.extern func_0209189c
.extern func_020918f4
.extern func_02091b6c
.extern func_02092798
.extern func_020927b8
.extern func_02092814
.extern func_02092cc0
.extern func_02093998
.extern func_ov028_021fd668
.extern genrand_int32
.extern gHeapContext
.extern Heap_Alloc

.global func_ov028_021fd680
func_ov028_021fd680:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x8
    mov r5, r1
    bl func_02071ea4
    add r0, r4, #0x14
    bl func_02071ea4
    add r0, r4, #0x20
    bl func_02071ea4
    add r0, r4, #0x2c
    bl func_02092798
    mov r0, #0x0
    str r0, [r4, #0x54]
    add r0, r4, #0x58
    bl func_02091b6c
    str r5, [r4, #0x0]
    mov r0, r5
    bl func_020742cc
    str r0, [r4, #0x4]
    mov r0, #0x62
    str r0, [sp, #0x0]
    add r0, r4, #0x14
    ldr r1, L_021fd77c
    mov r2, #0x60
    ldr r1, [r1, #0x0]
    mov r3, #0x61
    bl func_02071ee0
    ldr r1, L_021fd780
    add r0, r4, #0x20
    str r1, [sp, #0x0]
    ldr r1, L_021fd77c
    mov r2, #0x4000
    ldr r1, [r1, #0x0]
    add r3, r2, #0x1
    bl func_02071ee0
    bl genrand_int32
    str r0, [r4, #0x54]
    add r0, r4, #0x2c
    mov r1, #0x7000
    bl func_02092814
    add r0, r4, #0x2c
    ldr r1, L_021fd784
    bl func_02092814
    mov r0, #0xec
    ldr r1, L_021fd788
    mov r2, #0x4
    ldr r3, L_021fd78c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd754
    ldr r1, [r4, #0x0]
    ldr r2, [r4, #0x2c]
    bl func_02092cc0
L_021fd754:
    str r0, [r4, #0x50]
    mov r0, #0x40
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x50]
    mov r1, #0x60
    mov r2, #0x31
    mov r3, #0x80
    bl func_ov028_021fd668
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd77c: .word data_020f4e18
L_021fd780: .word 0x4002
L_021fd784: .word 0x7006
L_021fd788: .word data_ov028_021ff2d0
L_021fd78c: .word gHeapContext
.size func_ov028_021fd680, .-func_ov028_021fd680

.global func_ov028_021fd790
func_ov028_021fd790:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x50]
    cmp r0, #0x0
    beq L_021fd7b0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd7b0:
    ldr r0, [r4, #0x4]
    bl func_0207419c
    add r0, r4, #0x2c
    bl func_020927b8
    add r0, r4, #0x20
    bl func_02071eb8
    add r0, r4, #0x14
    bl func_02071eb8
    add r0, r4, #0x8
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov028_021fd790, .-func_ov028_021fd790

.global func_ov028_021fd7e0
func_ov028_021fd7e0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    ldr r0, [r7, #0x4]
    add r1, r7, #0x20
    mov r2, #0x1
    bl func_02073ffc
    mov r6, r0
    add r0, r7, #0x54
    mov r1, #0x5
    bl func_020918f4
    mov r5, r0
    add r0, r7, #0x54
    mov r1, #0x20
    mov r2, #0x50
    bl func_0209189c
    mov r4, r0
    add r0, r7, #0x54
    mov r1, #0x20
    mov r2, #0x50
    bl func_0209189c
    mov r1, r5
    mov r2, r4
    mov r3, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, #0x100
    str r0, [sp, #0x8]
    mov r0, r6
    bl func_02073e48
    mov r0, #0x80
    strh r0, [r6, #0x36]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.size func_ov028_021fd7e0, .-func_ov028_021fd7e0

.global func_ov028_021fd86c
func_ov028_021fd86c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r2, #0xb0
    mov r1, #0x0
    str r2, [sp, #0x0]
    mov r4, r0
    str r1, [sp, #0x4]
    ldr r0, [r4, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl func_02076428
    ldr r0, [r4, #0x50]
    bl func_02093998
    ldr r0, [r4, #0x4]
    bl func_02074058
    add r0, r4, #0x8
    bl func_02071f38
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.size func_ov028_021fd86c, .-func_ov028_021fd86c
