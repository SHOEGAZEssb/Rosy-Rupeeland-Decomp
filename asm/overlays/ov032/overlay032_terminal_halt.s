.text

/* Exact fallback; see src/overlays/ov032/overlay032_terminal_and_child_init.c for documented portable C. */
.extern GraphicsResourceSet_Load
.extern Heap_Alloc
.extern OS_Halt
.extern Sound_Reset
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov032_02202348
.extern func_02058ce0
.extern func_0207042c
.extern func_02070638
.extern func_02070b50
.extern func_02070e0c
.extern GraphicsResourceSet_ReleaseHandles
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_020959d4
.extern func_02095c30
.extern func_020b44e8
.extern gDebugFont
.extern gHeapContext
.extern gSoundContext

    .global func_ov032_02200da4
func_ov032_02200da4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0xb64]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_02200f5c
L_02200dc0: ; jump table
    b L_02200dd0 ; case 0
    b L_02200e64 ; case 1
    b L_02200f2c ; case 2
    b L_02200f4c ; case 3
L_02200dd0:
    ldr r0, L_02200f68
    ldr r0, [r0, #0x0]
    bl func_02058ce0
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq L_02200df4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02200df4:
    ldr r0, L_02200f6c
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, L_02200f70
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    mov r2, #0x4000000
    ldr r0, [r2, #0x0]
    add r1, r2, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1400
    str r0, [r2, #0x0]
    ldr r0, [r1, #0x0]
    bic r0, r0, #0x1f00
    str r0, [r1, #0x0]
    bl func_020b44e8
    ldr r0, L_02200f70
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_02200f6c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200f5c
L_02200e64:
    ldr r3, L_02200f74
    ldr r1, L_02200f78
    str r3, [sp, #0x0]
    add r0, r4, #0x318
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r0, #0xc00
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    ldr r0, [r4, #0xf18]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070638
    ldr r0, [r4, #0xf18]
    bl func_0207042c
    cmp r0, #0x0
    movne r1, #0x6000
    ldr r0, [r4, #0xf1c]
    moveq r1, #0x0
    bl func_02070b50
    ldr r0, [r4, #0xf20]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070e0c
    add r0, r4, #0x318
    add r0, r0, #0xc00
    bl GraphicsResourceSet_ReleaseHandles
    ldr r1, L_02200f7c
    mov r0, #0x5000000
    strh r1, [r0, #0x0]
    ldr r1, L_02200f80
    ldr r3, L_02200f84
    mov r0, #0x2d0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200f08
    mov r1, #0x0
    mov r2, r1
    bl func_020959d4
L_02200f08:
    mov r1, #0x1f
    str r0, [r4, #0xf24]
    bl func_02095c30
    mov r0, #0x0
    str r0, [r4, #0xb74]
    ldr r0, [r4, #0xb64]
    add r0, r0, #0x1
    str r0, [r4, #0xb64]
    b L_02200f5c
L_02200f2c:
    ldr r1, [r4, #0xb74]
    add r0, r1, #0x1
    str r0, [r4, #0xb74]
    cmp r1, #0x5
    ldrge r0, [r4, #0xb64]
    addge r0, r0, #0x1
    strge r0, [r4, #0xb64]
    b L_02200f5c
L_02200f4c:
    ldr r0, L_02200f68
    ldr r0, [r0, #0x0]
    bl Sound_Reset
    bl OS_Halt
L_02200f5c:
    mov r0, #0x2
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_02200f68: .word gSoundContext
L_02200f6c: .word gDebugFont
L_02200f70: .word data_020f4e14
L_02200f74: .word 0x8032
L_02200f78: .word data_020f4e18
L_02200f7c: .word 0x24a3
L_02200f80: .word data_ov032_02202348
L_02200f84: .word gHeapContext
.size func_ov032_02200da4, .-func_ov032_02200da4

