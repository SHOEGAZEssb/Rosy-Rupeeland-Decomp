    .text
    .extern GraphicsResourceSet_Init
    .extern GraphicsResourceSet_Load
    .extern func_02070fd4
    .extern func_020b44e8
    .extern func_02070638
    .extern func_02070b50
    .extern func_02070e0c
    .extern func_020706c4
    .extern func_02070bc4
    .extern func_02070eac
    .extern func_02072000
    .extern func_0205974c
    .extern GraphicsResourceSet_Destroy
    .extern data_020f4e18
    .extern gSoundContext
    .global func_ov004_021fba28
func_ov004_021fba28: ; 0x021fba28
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r0, [r4, #0x150]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fbbbc
L_021fba4c: ; jump table
    b L_021fbbbc ; case 0
    b L_021fba78 ; case 1
    b L_021fba9c ; case 2
    b L_021fbac0 ; case 3
    b L_021fbae4 ; case 4
    b L_021fbb08 ; case 5
    b L_021fbb2c ; case 6
    b L_021fbb50 ; case 7
    b L_021fbb74 ; case 8
    b L_021fbb98 ; case 9
    b L_021fbbbc ; case 10
L_021fba78:
    ldr r3, L_021fbea4
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbbdc
L_021fba9c:
    ldr r3, L_021fbeac
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbbdc
L_021fbac0:
    ldr r3, L_021fbeb0
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbbdc
L_021fbae4:
    ldr r3, L_021fbeb4
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbbdc
L_021fbb08:
    ldr r3, L_021fbeb8
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbbdc
L_021fbb2c:
    ldr r3, L_021fbebc
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbbdc
L_021fbb50:
    ldr r3, L_021fbec0
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbbdc
L_021fbb74:
    ldr r3, L_021fbec4
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbbdc
L_021fbb98:
    ldr r3, L_021fbec8
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbbdc
L_021fbbbc:
    ldr r1, L_021fbecc
    ldr r0, L_021fbea8
    str r1, [sp, #0x0]
    mov r2, #0xa100
    ldr r1, [r0, #0x0]
    add r0, sp, #0x4
    add r3, r2, #0x1
    bl GraphicsResourceSet_Load
L_021fbbdc:
    ldr r0, [sp, #0xc]
    bl func_02070fd4
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0x8]
    mov r1, #0x4000
    bl func_02070b50
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0x4]
    mov r1, #0x2
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x8]
    mov r1, #0x4000
    bl func_02070bc4
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070eac
    ldr r0, [r4, #0x150]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fbd0c
L_021fbc50: ; jump table
    b L_021fbd0c ; case 0
    b L_021fbc7c ; case 1
    b L_021fbc7c ; case 2
    b L_021fbca0 ; case 3
    b L_021fbca0 ; case 4
    b L_021fbcc4 ; case 5
    b L_021fbcc4 ; case 6
    b L_021fbce8 ; case 7
    b L_021fbce8 ; case 8
    b L_021fbd0c ; case 9
    b L_021fbd0c ; case 10
L_021fbc7c:
    ldr r3, L_021fbed0
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbd2c
L_021fbca0:
    ldr r3, L_021fbed4
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbd2c
L_021fbcc4:
    ldr r3, L_021fbed8
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbd2c
L_021fbce8:
    ldr r3, L_021fbedc
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    b L_021fbd2c
L_021fbd0c:
    ldr r3, L_021fbee0
    ldr r0, L_021fbea8
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
L_021fbd2c:
    ldr r0, [sp, #0xc]
    bl func_02070fd4
    bl func_020b44e8
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02070638
    ldr r0, [sp, #0x8]
    mov r1, #0x6000
    bl func_02070b50
    ldr r0, [sp, #0xc]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0x4]
    mov r1, #0x3
    mov r2, #0x0
    bl func_020706c4
    ldr r0, [sp, #0x8]
    mov r1, #0x6000
    bl func_02070bc4
    ldr r0, [sp, #0xc]
    mov r1, #0x3
    mov r2, #0x0
    bl func_02070eac
    add r0, sp, #0x4
    bl func_02072000
    ldr r0, [r4, #0x150]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fbdd4
L_021fbda8: ; jump table
    b L_021fbdd4 ; case 0
    b L_021fbdd4 ; case 1
    b L_021fbdd4 ; case 2
    b L_021fbde8 ; case 3
    b L_021fbdfc ; case 4
    b L_021fbe10 ; case 5
    b L_021fbe24 ; case 6
    b L_021fbe38 ; case 7
    b L_021fbe4c ; case 8
    b L_021fbe60 ; case 9
    b L_021fbe74 ; case 10
L_021fbdd4:
    mov r0, #0xf6
    str r0, [r4, #0x154]
    mov r0, #0x7b00
    str r0, [r4, #0x158]
    b L_021fbe84
L_021fbde8:
    ldr r1, L_021fbee4
    ldr r0, L_021fbee8
    str r1, [r4, #0x154]
    str r0, [r4, #0x158]
    b L_021fbe84
L_021fbdfc:
    mov r0, #0x218
    str r0, [r4, #0x154]
    mov r0, #0x6600
    str r0, [r4, #0x158]
    b L_021fbe84
L_021fbe10:
    ldr r1, L_021fbeec
    ldr r0, L_021fbef0
    str r1, [r4, #0x154]
    str r0, [r4, #0x158]
    b L_021fbe84
L_021fbe24:
    ldr r1, L_021fbef4
    mov r0, #0x6700
    str r1, [r4, #0x154]
    str r0, [r4, #0x158]
    b L_021fbe84
L_021fbe38:
    ldr r1, L_021fbef8
    ldr r0, L_021fbefc
    str r1, [r4, #0x154]
    str r0, [r4, #0x158]
    b L_021fbe84
L_021fbe4c:
    mov r0, #0x21c
    str r0, [r4, #0x154]
    mov r0, #0x6800
    str r0, [r4, #0x158]
    b L_021fbe84
L_021fbe60:
    ldr r1, L_021fbf00
    ldr r0, L_021fbf04
    str r1, [r4, #0x154]
    str r0, [r4, #0x158]
    b L_021fbe84
L_021fbe74:
    ldr r1, L_021fbf08
    mov r0, #0x6900
    str r1, [r4, #0x154]
    str r0, [r4, #0x158]
L_021fbe84:
    ldr r0, L_021fbf0c
    ldr r1, [r4, #0x154]
    ldr r0, [r0, #0x0]
    bl func_0205974c
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fbea4: .word 0xa0e7
L_021fbea8: .word data_020f4e18
L_021fbeac: .word 0xa0ea
L_021fbeb0: .word 0xa0ed
L_021fbeb4: .word 0xa0f0
L_021fbeb8: .word 0xa0f3
L_021fbebc: .word 0xa0f6
L_021fbec0: .word 0xa0f9
L_021fbec4: .word 0xa0fc
L_021fbec8: .word 0xa0ff
L_021fbecc: .word 0xa102
L_021fbed0: .word 0xa0d8
L_021fbed4: .word 0xa0e1
L_021fbed8: .word 0xa0db
L_021fbedc: .word 0xa0de
L_021fbee0: .word 0xa0e4
L_021fbee4: .word 0x217
L_021fbee8: .word 0x6580
L_021fbeec: .word 0x219
L_021fbef0: .word 0x6680
L_021fbef4: .word 0x21a
L_021fbef8: .word 0x21b
L_021fbefc: .word 0x6780
L_021fbf00: .word 0x21d
L_021fbf04: .word 0x6880
L_021fbf08: .word 0x21e
L_021fbf0c: .word gSoundContext
    .size func_ov004_021fba28, .-func_ov004_021fba28

