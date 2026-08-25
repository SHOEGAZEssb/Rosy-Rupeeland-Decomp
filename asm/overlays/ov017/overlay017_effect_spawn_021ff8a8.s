    .text
/* Exact fallback; see src/overlays/ov017/overlay017_effect_spawn.c. */
    .extern Heap_Alloc
    .extern data_ov017_022016b4
    .extern data_ov017_02201754
    .extern TitleRandom_NextBounded
    .extern PresentationList_Append
    .extern Overlay017_Effect_Init
    .extern gHeapContext
.global Overlay017_SpawnEventEffect
Overlay017_SpawnEventEffect:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    cmp r7, #0xde
    ldr r4, L_021ffcb0
    bgt L_021ffa14
    cmp r7, #0xde
    bge L_021ffc34
    cmp r7, #0xda
    bgt L_021ff9f0
    bge L_021ffc24
    cmp r7, #0x3b
    bgt L_021ff9e4
    cmp r7, #0x0
    addge pc, pc, r7, lsl #0x2
    b L_021ffc48
L_021ff8f4: ; jump table
    b L_021ffa60 ; case 0
    b L_021ffa64 ; case 1
    b L_021ffa6c ; case 2
    b L_021ffa74 ; case 3
    b L_021ffa7c ; case 4
    b L_021ffa84 ; case 5
    b L_021ffa88 ; case 6
    b L_021ffa8c ; case 7
    b L_021ffa94 ; case 8
    b L_021ffa9c ; case 9
    b L_021ffaa4 ; case 10
    b L_021ffaac ; case 11
    b L_021ffab4 ; case 12
    b L_021ffabc ; case 13
    b L_021ffac4 ; case 14
    b L_021ffacc ; case 15
    b L_021ffad4 ; case 16
    b L_021ffadc ; case 17
    b L_021ffae4 ; case 18
    b L_021ffaec ; case 19
    b L_021ffaf4 ; case 20
    b L_021ffc48 ; case 21
    b L_021ffafc ; case 22
    b L_021ffb04 ; case 23
    b L_021ffb0c ; case 24
    b L_021ffb14 ; case 25
    b L_021ffb1c ; case 26
    b L_021ffb24 ; case 27
    b L_021ffb2c ; case 28
    b L_021ffb34 ; case 29
    b L_021ffb3c ; case 30
    b L_021ffb44 ; case 31
    b L_021ffb4c ; case 32
    b L_021ffb54 ; case 33
    b L_021ffb5c ; case 34
    b L_021ffb64 ; case 35
    b L_021ffb6c ; case 36
    b L_021ffc48 ; case 37
    b L_021ffb74 ; case 38
    b L_021ffb7c ; case 39
    b L_021ffb84 ; case 40
    b L_021ffb8c ; case 41
    b L_021ffb94 ; case 42
    b L_021ffb9c ; case 43
    b L_021ffba4 ; case 44
    b L_021ffbac ; case 45
    b L_021ffbb4 ; case 46
    b L_021ffbbc ; case 47
    b L_021ffbc4 ; case 48
    b L_021ffbcc ; case 49
    b L_021ffbd4 ; case 50
    b L_021ffbdc ; case 51
    b L_021ffbe4 ; case 52
    b L_021ffbec ; case 53
    b L_021ffbf4 ; case 54
    b L_021ffbfc ; case 55
    b L_021ffc04 ; case 56
    b L_021ffc0c ; case 57
    b L_021ffc14 ; case 58
    b L_021ffc1c ; case 59
L_021ff9e4:
    cmp r7, #0xd9
    ldreq r4, L_021ffcb4
    b L_021ffc48
L_021ff9f0:
    cmp r7, #0xdc
    bgt L_021ffa08
    bge L_021ffc2c
    cmp r7, #0xdb
    addeq r4, r4, #0x36
    b L_021ffc48
L_021ffa08:
    cmp r7, #0xdd
    addeq r4, r4, #0x38
    b L_021ffc48
L_021ffa14:
    cmp r7, #0xee
    bgt L_021ffa3c
    bge L_021ffc3c
    cmp r7, #0xeb
    bgt L_021ffa30
    addeq r4, r4, #0x3a
    b L_021ffc48
L_021ffa30:
    cmp r7, #0xed
    addeq r4, r4, #0x3b
    b L_021ffc48
L_021ffa3c:
    cmp r7, #0xf0
    bgt L_021ffa54
    bge L_021ffc44
    cmp r7, #0xef
    addeq r4, r4, #0x3d
    b L_021ffc48
L_021ffa54:
    ldr r0, L_021ffcb8
    cmp r7, r0
    addeq r4, r4, #0x3f
L_021ffa60:
    b L_021ffc48
L_021ffa64:
    add r4, r4, #0x1
    b L_021ffc48
L_021ffa6c:
    add r4, r4, #0x2
    b L_021ffc48
L_021ffa74:
    add r4, r4, #0x3
    b L_021ffc48
L_021ffa7c:
    add r4, r4, #0x4
    b L_021ffc48
L_021ffa84:
    add r4, r4, #0x5
L_021ffa88:
    b L_021ffc48
L_021ffa8c:
    add r4, r4, #0x6
    b L_021ffc48
L_021ffa94:
    add r4, r4, #0x7
    b L_021ffc48
L_021ffa9c:
    add r4, r4, #0x7
    b L_021ffc48
L_021ffaa4:
    add r4, r4, #0x8
    b L_021ffc48
L_021ffaac:
    add r4, r4, #0x9
    b L_021ffc48
L_021ffab4:
    add r4, r4, #0xa
    b L_021ffc48
L_021ffabc:
    add r4, r4, #0xb
    b L_021ffc48
L_021ffac4:
    add r4, r4, #0xc
    b L_021ffc48
L_021ffacc:
    add r4, r4, #0x3a
    b L_021ffc48
L_021ffad4:
    add r4, r4, #0x3a
    b L_021ffc48
L_021ffadc:
    add r4, r4, #0x3a
    b L_021ffc48
L_021ffae4:
    add r4, r4, #0xd
    b L_021ffc48
L_021ffaec:
    add r4, r4, #0xe
    b L_021ffc48
L_021ffaf4:
    add r4, r4, #0xf
    b L_021ffc48
L_021ffafc:
    add r4, r4, #0x10
    b L_021ffc48
L_021ffb04:
    add r4, r4, #0x11
    b L_021ffc48
L_021ffb0c:
    add r4, r4, #0x12
    b L_021ffc48
L_021ffb14:
    add r4, r4, #0x13
    b L_021ffc48
L_021ffb1c:
    add r4, r4, #0x14
    b L_021ffc48
L_021ffb24:
    add r4, r4, #0x15
    b L_021ffc48
L_021ffb2c:
    add r4, r4, #0x16
    b L_021ffc48
L_021ffb34:
    add r4, r4, #0x17
    b L_021ffc48
L_021ffb3c:
    add r4, r4, #0x18
    b L_021ffc48
L_021ffb44:
    add r4, r4, #0x19
    b L_021ffc48
L_021ffb4c:
    add r4, r4, #0x1a
    b L_021ffc48
L_021ffb54:
    add r4, r4, #0x1b
    b L_021ffc48
L_021ffb5c:
    add r4, r4, #0x1c
    b L_021ffc48
L_021ffb64:
    add r4, r4, #0x1d
    b L_021ffc48
L_021ffb6c:
    add r4, r4, #0x1e
    b L_021ffc48
L_021ffb74:
    add r4, r4, #0x1f
    b L_021ffc48
L_021ffb7c:
    add r4, r4, #0x20
    b L_021ffc48
L_021ffb84:
    add r4, r4, #0x21
    b L_021ffc48
L_021ffb8c:
    add r4, r4, #0x22
    b L_021ffc48
L_021ffb94:
    add r4, r4, #0x23
    b L_021ffc48
L_021ffb9c:
    add r4, r4, #0x24
    b L_021ffc48
L_021ffba4:
    add r4, r4, #0x25
    b L_021ffc48
L_021ffbac:
    add r4, r4, #0x26
    b L_021ffc48
L_021ffbb4:
    add r4, r4, #0x27
    b L_021ffc48
L_021ffbbc:
    add r4, r4, #0x28
    b L_021ffc48
L_021ffbc4:
    add r4, r4, #0x29
    b L_021ffc48
L_021ffbcc:
    add r4, r4, #0x2a
    b L_021ffc48
L_021ffbd4:
    add r4, r4, #0x2b
    b L_021ffc48
L_021ffbdc:
    add r4, r4, #0x2c
    b L_021ffc48
L_021ffbe4:
    add r4, r4, #0x2d
    b L_021ffc48
L_021ffbec:
    add r4, r4, #0x2e
    b L_021ffc48
L_021ffbf4:
    add r4, r4, #0x2e
    b L_021ffc48
L_021ffbfc:
    add r4, r4, #0x2f
    b L_021ffc48
L_021ffc04:
    add r4, r4, #0x30
    b L_021ffc48
L_021ffc0c:
    add r4, r4, #0x31
    b L_021ffc48
L_021ffc14:
    add r4, r4, #0x32
    b L_021ffc48
L_021ffc1c:
    add r4, r4, #0x33
    b L_021ffc48
L_021ffc24:
    add r4, r4, #0x35
    b L_021ffc48
L_021ffc2c:
    add r4, r4, #0x37
    b L_021ffc48
L_021ffc34:
    add r4, r4, #0x39
    b L_021ffc48
L_021ffc3c:
    add r4, r4, #0x3c
    b L_021ffc48
L_021ffc44:
    add r4, r4, #0x3e
L_021ffc48:
    ldr r1, L_021ffcbc
    ldr r3, L_021ffcc0
    mov r0, #0xe8
    mov r2, #0x4
    bl Heap_Alloc
    movs r9, r0
    beq L_021ffc98
    add r0, r8, #0x3fc
    mov r1, #0x3c
    bl TitleRandom_NextBounded
    ldr r2, [sp, #0x28]
    mov r1, r7
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r9
    mov r2, r6
    mov r3, r5
    str r4, [sp, #0x8]
    bl Overlay017_Effect_Init
    mov r9, r0
L_021ffc98:
    ldr r0, L_021ffcc4
    mov r1, r9
    bl PresentationList_Append
    mov r0, r9
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_021ffcb0: .word 0x5012
L_021ffcb4: .word 0x5046
L_021ffcb8: .word 0x15e
L_021ffcbc: .word data_ov017_022016b4
L_021ffcc0: .word gHeapContext
L_021ffcc4: .word data_ov017_02201754

    .size Overlay017_SpawnEventEffect, . - Overlay017_SpawnEventEffect
