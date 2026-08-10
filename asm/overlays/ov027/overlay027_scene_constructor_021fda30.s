.text

/* Exact fallback; see src/overlays/ov027/overlay027_scene_constructor.c. */
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov027_021fe928
.extern data_ov027_021fea04
.extern data_ov027_021feb54
.extern data_ov027_021feeb4
.extern data_ov027_021fef24
.extern data_ov027_021fef2c
.extern data_ov027_021fef34
.extern data_ov027_021fef3c
.extern func_020720c0
.extern func_020720e8
.extern func_02074568
.extern func_02075238
.extern GraphicsAnimationInstanceManager_CreateInstance
.extern Graphics3DResourceOwner_Init
.extern Graphics3DResourceOwner_CreateManager
.extern Graphics3DResourceOwner_PrepareResources
.extern Graphics3DSceneState_Init
.extern func_02091b6c
.extern func_02091e28
.extern func_02092364
.extern func_020923a4
.extern func_02094ad4
.extern func_02094bbc
.extern func_02095274
.extern func_020ae6dc
.extern func_ov027_021fce04
.extern func_ov027_021fd180
.extern func_ov027_021fd1c8
.extern func_ov027_021fd9c8
.extern func_ov027_021fda08
.extern func_ov027_021fe0ac
.extern func_ov043_0220b740
.extern G3X_Init
.extern gDebugFont
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov027_021fda30
func_ov027_021fda30:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xf4
    mov r10, r0
    bl func_02091e28
    ldr r1, L_021fdde4
    add r0, r10, #0x5c
    str r1, [r10, #0x0]
    bl func_020720c0
    add r0, r10, #0x68
    bl func_020720c0
    add r0, r10, #0x74
    bl func_020720c0
    add r0, r10, #0x80
    bl Graphics3DSceneState_Init
    add r0, r10, #0x120
    bl func_ov027_021fd9c8
    add r0, r10, #0x130
    bl func_ov027_021fd9c8
    add r0, r10, #0x140
    bl func_ov027_021fd9c8
    add r0, r10, #0x150
    bl func_ov027_021fd9c8
    add r0, r10, #0x164
    bl func_02092364
    add r0, r10, #0x198
    bl func_ov043_0220b740 ; func_ov044_0220b740, func_ov045_0220b740, func_ov046_0220b740, func_ov047_0220b740, func_ov048_0220b740, func_ov049_0220b740
    mov r0, #0x0
    str r0, [r10, #0x5bc]
    add r0, r10, #0x1c4
    add r0, r0, #0x400
    bl func_02091b6c
    bl G3X_Init
    mov r0, #0x0
    str r0, [r10, #0x50]
    add r0, r10, #0x164
    bl func_020923a4
    ldr r0, L_021fdde8
    ldr r0, [r0, #0x0]
    bl func_02075238
    ldr r0, L_021fdde8
    ldr r0, [r0, #0x0]
    bl func_02074568
    ldr r0, L_021fddec
    ldr r0, [r0, #0x0]
    bl func_02075238
    ldr r0, L_021fddec
    ldr r0, [r0, #0x0]
    bl func_02074568
    bl func_020ae6dc
    ldr r0, L_021fddf0
    ldr r1, L_021fddf4
    mov r2, #0x4
    ldr r3, L_021fddf8
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdb1c
    mov r1, #0x4
    mov r2, #0x2
    bl Graphics3DResourceOwner_Init
L_021fdb1c:
    str r0, [r10, #0x54]
    bl Graphics3DResourceOwner_CreateManager
    ldr r3, L_021fddfc
    str r0, [r10, #0x58]
    ldr r0, L_021fde00
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r10, #0x5c
    sub r3, r3, #0x1
    bl func_020720e8
    ldr r0, [r10, #0x54]
    add r1, r10, #0x5c
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_021fde04
    ldr r1, L_021fde00
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r10, #0x68
    sub r3, r3, #0x1
    bl func_020720e8
    ldr r0, [r10, #0x54]
    add r1, r10, #0x68
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_021fde08
    ldr r1, L_021fde00
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r10, #0x74
    sub r3, r3, #0x1
    bl func_020720e8
    ldr r0, [r10, #0x54]
    add r1, r10, #0x74
    bl Graphics3DResourceOwner_PrepareResources
    ldr r1, L_021fde0c
    ldr r3, L_021fddf8
    mov r0, #0x9c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdbcc
    bl func_02094ad4
L_021fdbcc:
    str r0, [r10, #0x118]
    mov r1, r0
    add r0, r10, #0x120
    bl func_02095274
    ldr r1, L_021fde0c
    ldr r3, L_021fddf8
    mov r0, #0x9c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdbfc
    bl func_02094ad4
L_021fdbfc:
    str r0, [r10, #0x11c]
    mov r1, r0
    add r0, r10, #0x120
    bl func_02095274
    ldr r1, L_021fde10
    ldr r3, L_021fddf8
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdc30
    ldr r1, [r10, #0x54]
    bl func_ov027_021fce04
L_021fdc30:
    str r0, [r10, #0x114]
    mov r1, r0
    add r0, r10, #0x120
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r10, #0x118]
    sub r2, r1, #0x600
    mov r3, #0x3000
    bl func_02094bbc
    mov r1, #0x0
    ldr r0, [r10, #0x11c]
    mov r3, r1
    sub r2, r1, #0x600
    bl func_02094bbc
    mov r1, #0x0
    add r0, sp, #0xc
    b L_021fdc7c
L_021fdc74:
    str r1, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
L_021fdc7c:
    cmp r1, #0x3a
    blo L_021fdc74
    mov r0, #0xc
    mov r8, #0x0
    add r7, sp, #0xc
    ldr r4, L_021fde14
    mov r1, r0
    b L_021fdcd8
L_021fdc9c:
    add r9, r8, #0x1
    b L_021fdccc
L_021fdca4:
    ldr r6, [r7, r9, lsl #0x2]
    ldr r5, [r7, r8, lsl #0x2]
    mla r2, r6, r1, r4
    mla r3, r5, r0, r4
    ldr r3, [r3, #0x8]
    ldr r2, [r2, #0x8]
    cmp r3, r2
    strlt r6, [r7, r8, lsl #0x2]
    strlt r5, [r7, r9, lsl #0x2]
    add r9, r9, #0x1
L_021fdccc:
    cmp r9, #0x3a
    blo L_021fdca4
    add r8, r8, #0x1
L_021fdcd8:
    cmp r8, #0x39
    blo L_021fdc9c
    mov r9, #0x0
    ldr r6, L_021fde14
    add r5, sp, #0xc
    mov r7, #0xb0
    ldr r11, L_021fde18
    mov r4, #0xc
    b L_021fdd4c
L_021fdcfc:
    ldr r0, [r10, #0x58]
    add r1, r10, #0x5c
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r8, r0
    ldr r3, L_021fddf8
    mov r0, r7
    mov r1, r11
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq L_021fdd40
    ldr r3, [r5, r9, lsl #0x2]
    mov r1, r8
    mla r2, r3, r4, r6
    mov r3, r9
    bl func_ov027_021fd1c8
    mov r1, r0
L_021fdd40:
    add r0, r10, #0x130
    bl func_02095274
    add r9, r9, #0x1
L_021fdd4c:
    cmp r9, #0x3a
    blo L_021fdcfc
    mov r4, #0x0
    ldr r8, L_021fde1c
    mov r7, r4
    mov r6, #0x11
    mov r5, #0xc
    b L_021fdd98
L_021fdd6c:
    ldr r0, [r10, #0x58]
    add r1, r10, #0x68
    bl GraphicsAnimationInstanceManager_CreateInstance
    mul r1, r4, r5
    str r7, [sp, #0x0]
    stmib sp, {r6, r7}
    add r3, r8, r1
    ldr r1, [r8, r1]
    ldmib r3, {r2, r3}
    bl func_ov027_021fd180
    add r4, r4, #0x1
L_021fdd98:
    cmp r4, #0x1c
    blo L_021fdd6c
    mov r0, #0x0
    str r0, [r10, #0x5bc]
    str r0, [r10, #0x160]
    mov r1, #0x20000
    mov r0, r10
    str r1, [r10, #0x5c0]
    bl func_ov027_021fe0ac
    ldr r0, [r10, #0x20]
    ldr r1, L_021fde20
    orr r0, r0, #0x400
    str r0, [r10, #0x20]
    mov r0, r10
    ldmia r1, {r1, r2}
    bl func_ov027_021fda08
    mov r0, r10
    add sp, sp, #0xf4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fdde4: .word data_ov027_021feeb4
L_021fdde8: .word data_020f4e14
L_021fddec: .word gDebugFont
L_021fddf0: .word 0x624
L_021fddf4: .word data_ov027_021fef24
L_021fddf8: .word gHeapContext
L_021fddfc: .word 0x6032
L_021fde00: .word data_020f4e18
L_021fde04: .word 0x6038
L_021fde08: .word 0x6035
L_021fde0c: .word data_ov027_021fef2c
L_021fde10: .word data_ov027_021fef34
L_021fde14: .word data_ov027_021feb54
L_021fde18: .word data_ov027_021fef3c
L_021fde1c: .word data_ov027_021fea04
L_021fde20: .word data_ov027_021fe928
.size func_ov027_021fda30, .-func_ov027_021fda30

