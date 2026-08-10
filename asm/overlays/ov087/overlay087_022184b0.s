.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern GameWork_SetFlag
.extern Heap_Alloc
.extern Sound_Play
.extern data_021052fc
.extern data_ov087_02218aa4
.extern func_0200222c
.extern func_020022dc
.extern func_02005058
.extern AnimationResource_Init
.extern func_ov062_0220fe78
.extern func_ov087_02218678
.extern func_ov087_02218698
.extern gGameWork
.extern gHeapContext
.extern gSoundContext

.global func_ov087_022184b0
func_ov087_022184b0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    mov r5, r0
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x24]
    mov r4, r1
    cmp r0, #0x0
    bne .L_02218640
    ldr r1, .L_0221865c
    ldr r3, .L_02218660
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022184fc
    mov r1, #0x1000
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_022184fc:
    str r0, [r5, #0x220]
    add r0, r5, #0x200
    ldrh r1, [r0, #0x1a]
    cmp r4, #0x0
    orr r1, r1, #0x2
    strh r1, [r0, #0x1a]
    ble .L_022185ac
    bl func_020022dc
    ldr r2, .L_02218664
    mov r1, #0x2
    bl func_0200222c
    ldr r1, .L_0221865c
    ldr r3, .L_02218660
    mov r0, #0x48
    mov r2, #0x4
    mov r7, #0x0
    bl Heap_Alloc
    movs r6, r0
    beq .L_02218574
    add r0, sp, #0xc
    mov r1, r5
    bl func_ov087_02218678
    mov r7, #0x1
    str r7, [sp, #0x0]
    add r1, sp, #0xc
    mov r0, r6
    mov r3, r4
    mov r2, #0x18
    stmib sp, {r5, r7}
    bl func_ov062_0220fe78
.L_02218574:
    cmp r7, #0x0
    beq .L_02218584
    add r0, sp, #0xc
    bl func_02005058
.L_02218584:
    add r0, r5, #0x200
    ldrh r3, [r0, #0x1a]
    ldr r2, .L_02218668
    mov r1, #0x67
    orr r3, r3, #0x80
    strh r3, [r0, #0x1a]
    ldr r0, [r2, #0x0]
    mov r2, #0x5
    bl Sound_Play
    b .L_02218640
.L_022185ac:
    ldr r0, .L_0221866c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, r1
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    mov r3, r1
    ldr ip, [r4, #0x230]
    add r0, r4, #0x38
    bic ip, ip, #0x4
    str ip, [r4, #0x230]
    bl func_ov087_02218698
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov087_02218698
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov087_02218698
    ldr r1, [r4, #0x230]
    mov r0, r4
    orr r1, r1, #0x100
    str r1, [r4, #0x230]
    ldr r2, [r4, #0x14]
    mov r1, #0x0
    orr r2, r2, #0x2
    str r2, [r4, #0x14]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, .L_02218670
    ldr r1, .L_02218674
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
.L_02218640:
    add r0, r5, #0x200
    mov r1, #0x1
    strh r1, [r0, #0x24]
    mov r1, #0xc
    strh r1, [r0, #0x26]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0221865c: .word data_ov087_02218aa4
.L_02218660: .word gHeapContext
.L_02218664: .word 0x3e
.L_02218668: .word gSoundContext
.L_0221866c: .word data_021052fc
.L_02218670: .word gGameWork
.L_02218674: .word 0x402
.size func_ov087_022184b0, . - func_ov087_022184b0
