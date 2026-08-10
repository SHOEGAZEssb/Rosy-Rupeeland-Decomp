.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern Heap_Alloc
.extern data_020f4e14
.extern data_ov055_0220f058
.extern data_ov055_0220f080
.extern VecFx32Object_Init
.extern func_0201e250
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_ov055_0220e574
.extern gDebugFont
.extern gHeapContext

.global func_ov055_0220e8b8
func_ov055_0220e8b8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl func_0201e250
    ldr r1, .L_0220e958
    add r0, r4, #0x8
    str r1, [r4, #0x0]
    bl VecFx32Object_Init
    mov r0, #0x0
    str r0, [r4, #0x1c]
    str r6, [r4, #0x28]
    ldr r0, .L_0220e95c
    str r5, [r4, #0x2c]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x1c]
    ldr r0, .L_0220e960
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x20]
    mov r0, #0x48
    ldr r1, .L_0220e964
    mov r2, #0x4
    ldr r3, .L_0220e968
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220e938
    ldr r1, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    ldr r3, [r4, #0x2c]
    bl func_ov055_0220e574
.L_0220e938:
    str r0, [r4, #0x24]
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x14]
    blx r2
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_0220e958: .word data_ov055_0220f058
.L_0220e95c: .word data_020f4e14
.L_0220e960: .word gDebugFont
.L_0220e964: .word data_ov055_0220f080
.L_0220e968: .word gHeapContext
.size func_ov055_0220e8b8, . - func_ov055_0220e8b8
