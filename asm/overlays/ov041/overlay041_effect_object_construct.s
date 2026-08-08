.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_effect_object_construct.c. */
.extern Heap_Alloc
.extern __construct_array
.extern data_ov041_022059b8
.extern data_ov041_022059d0
.extern func_02072b68
.extern func_0209a208
.extern func_ov007_021fb720
.extern func_ov041_021fce00
.extern func_ov041_021fd000
.extern func_ov041_021ff1cc
.extern gHeapContext

    .global func_ov041_0220106c
func_ov041_0220106c: ; 0x0220106c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    mov r10, r0
    mov r5, r1
    mov r9, r2
    bl func_ov041_021ff1cc
    ldr r0, .L_022012d8
    ldr r4, .L_022012dc
    str r0, [r10, #0x0]
    ldr r3, .L_022012e0
    add r0, r10, #0x68
    mov r1, #0x5b
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    add r0, r10, #0xac
    add r0, r0, #0x400
    bl func_ov041_021fd000
    str r5, [r10, #0x48]
    ldr r0, .L_022012e4
    ldr r1, .L_022012e8
    mov r2, #0x4
    ldr r3, .L_022012ec
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022010e0
    mov r1, r5
    mov r2, r9
    bl func_ov007_021fb720 ; func_ov008_021fb720
.L_022010e0:
    str r0, [r10, #0x958]
    ldr r1, .L_022012f0
    str r9, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x4c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0x4c]
    ldr r4, [r4, #0x0]
    mov r2, #0x40000
    mov r3, #0x64000
    blx r4
    ldr r2, [r10, #0x4c]
    mov r1, #0x0
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0x4c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    mov r0, #0x0
    ldr r6, .L_022012f0
    str r0, [r10, #0x8fc]
    mov r8, #0x1
    mov r7, #0x2
    mov r5, r0
    mov r11, #0x40000
    mov r4, r0
.L_02201170:
    str r9, [sp, #0x0]
    mov r0, r10
    mov r1, r6
    add r2, r6, #0x1
    add r3, r6, #0x2
    str r7, [sp, #0x4]
    bl func_0209a208
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x4c]
    str r5, [sp, #0x0]
    str r5, [sp, #0x4]
    mov r0, r10
    ldr ip, [r0, #0x0]
    ldr r1, [r1, #0x4c]
    ldr ip, [ip, #0x0]
    mov r2, r11
    mov r3, #0x64000
    blx ip
    add r3, r10, r8, lsl #0x2
    ldr r2, [r3, #0x4c]
    mov r1, #0x1
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r3, #0x4c]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    add r0, r10, r8, lsl #0x2
    add r8, r8, #0x1
    str r4, [r0, #0x8fc]
    cmp r8, #0x6
    blt .L_02201170
    ldr r1, .L_022012f0
    str r9, [sp, #0x0]
    mov r2, #0x2
    str r2, [sp, #0x4]
    mov r0, r10
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_0209a208
    str r0, [r10, #0x64]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r10
    ldr r4, [r0, #0x0]
    ldr r1, [r10, #0x64]
    ldr r4, [r4, #0x0]
    mov r2, #0x40000
    mov r3, #0x64000
    blx r4
    ldr r2, [r10, #0x64]
    mov r1, #0x2
    ldrh r0, [r2, #0x42]
    orr r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0x64]
    ldr r0, [r0, #0xc]
    bl func_02072b68
    mov r1, #0x0
    str r1, [r10, #0x914]
    mov r0, #0x80000
    str r0, [r10, #0x30]
    mov r0, #0xa000
    str r0, [r10, #0x34]
    str r1, [r10, #0x38]
    mov r0, #0x100
    strh r0, [r10, #0x3c]
    strh r0, [r10, #0x3e]
    strh r1, [r10, #0x40]
    str r1, [r10, #0x6c]
    str r1, [r10, #0x70]
    str r1, [r10, #0x78]
    str r1, [r10, #0x7c]
    str r1, [r10, #0x928]
    str r1, [r10, #0x924]
    str r1, [r10, #0x920]
    str r1, [r10, #0x93c]
    str r1, [r10, #0x938]
    str r1, [r10, #0x954]
    str r1, [r10, #0x950]
    str r1, [r10, #0x94c]
    str r1, [r10, #0x918]
    str r1, [r10, #0x934]
    str r1, [r10, #0x930]
    str r1, [r10, #0x92c]
    mov r0, r10
    str r1, [r10, #0x944]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022012d8: .word data_ov041_022059b8
.L_022012dc: .word func_ov041_021fce00
.L_022012e0: .word func_ov041_021fd000
.L_022012e4: .word 0x8bc
.L_022012e8: .word data_ov041_022059d0
.L_022012ec: .word gHeapContext
.L_022012f0: .word 0x12d8
    .size func_ov041_0220106c, . - func_ov041_0220106c

