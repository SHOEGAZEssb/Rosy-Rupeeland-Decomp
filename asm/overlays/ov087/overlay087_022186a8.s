.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern GameWork_ClearFlag
.extern Heap_Alloc
.extern Sound_Play
.extern data_021052fc
.extern data_ov087_02218aa4
.extern func_0200222c
.extern func_020022dc
.extern func_020050a4
.extern func_02034b60
.extern func_02038aac
.extern func_0205940c
.extern func_ov062_0220fe78
.extern func_ov087_02218698
.extern gGameWork
.extern gHeapContext
.extern gSoundContext

.global func_ov087_022186a8
func_ov087_022186a8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    add r3, r7, #0x200
    ldrsh r4, [r3, #0x24]
    mov r6, r1
    mov r5, r2
    cmp r4, #0x1
    bne .L_02218890
    mov r1, #0x0
    str r1, [r7, #0x208]
    strh r1, [r3, #0x14]
    mov r1, #0x1
    strh r1, [r7, #0xd6]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, .L_022188c8
    cmp r5, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    ble .L_022187a0
    add r0, r4, #0x18
    add r1, r7, #0x18
    bl func_020050a4
    ldr r1, [r4, #0x24]
    add r0, r4, #0x28
    add r2, r1, #0xa000
    add r1, r4, #0x18
    str r2, [r4, #0x24]
    bl func_020050a4
    bl func_020022dc
    mov r1, #0x2
    ldr r2, .L_022188cc
    bl func_0200222c
    mov r0, #0x48
    ldr r1, .L_022188d0
    mov r2, #0x4
    ldr r3, .L_022188d4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218778
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, r6
    mov r3, r5
    str r2, [sp, #0x4]
    mov r4, #0x1
    mov r2, #0x18
    str r4, [sp, #0x8]
    bl func_ov062_0220fe78
.L_02218778:
    add r0, r7, #0x200
    ldrh r3, [r0, #0x1a]
    ldr r2, .L_022188d8
    mov r1, #0x67
    orr r3, r3, #0x80
    strh r3, [r0, #0x1a]
    ldr r0, [r2, #0x0]
    mov r2, #0x5
    bl Sound_Play
    b .L_02218844
.L_022187a0:
    ldr r1, [r4, #0x14]
    mov r0, r4
    bic r1, r1, #0x2
    str r1, [r4, #0x14]
    ldr r2, [r4, #0x230]
    mov r1, #0x1
    orr r2, r2, #0x4
    str r2, [r4, #0x230]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r0, [r4, #0x230]
    mov r1, r6
    bic r2, r0, #0x100
    add r0, r4, #0x18
    str r2, [r4, #0x230]
    bl func_020050a4
    add r0, r4, #0x28
    add r1, r4, #0x18
    bl func_020050a4
    add r0, r4, #0x38
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov087_02218698
    add r0, r4, #0x88
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov087_02218698
    add r0, r4, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov087_02218698
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1000
    bl func_02034b60
    mov r0, r4
    bl func_02038aac
.L_02218844:
    ldr r0, .L_022188d8
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_0205940c
    ldr r0, .L_022188d8
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl func_0205940c
    ldr r0, .L_022188d8
    mov r1, #0x67
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl func_0205940c
    ldr r0, .L_022188dc
    ldr r1, .L_022188e0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
.L_02218890:
    ldr r0, [r7, #0x220]
    cmp r0, #0x0
    beq .L_022188b4
    beq .L_022188ac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022188ac:
    mov r0, #0x0
    str r0, [r7, #0x220]
.L_022188b4:
    add r0, r7, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x24]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_022188c8: .word data_021052fc
.L_022188cc: .word 0x3e
.L_022188d0: .word data_ov087_02218aa4
.L_022188d4: .word gHeapContext
.L_022188d8: .word gSoundContext
.L_022188dc: .word gGameWork
.L_022188e0: .word 0x402
.size func_ov087_022186a8, . - func_ov087_022186a8
