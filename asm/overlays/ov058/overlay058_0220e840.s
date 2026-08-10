.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern GameWork_ClearFlag
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern Heap_Alloc
.extern __construct_array
.extern data_020f4e14
.extern data_ov058_0220fcc4
.extern data_ov058_0220fcec
.extern data_ov058_0220fcf4
.extern data_ov058_0220fd0c
.extern func_0201e250
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern GraphicsSpriteRenderer_GetObjectPaletteAddress
.extern GraphicsSpriteRenderer_ConfigureTextGridPriority
.extern func_02092798
.extern func_02092814
.extern func_ov058_0220e400
.extern func_ov058_0220e5fc
.extern func_ov058_0220f11c
.extern gDebugFont
.extern gGameWork
.extern gHeapContext

.global func_ov058_0220e840
func_ov058_0220e840:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_0201e250
    ldr r0, .L_0220ea2c
    ldr ip, .L_0220ea30
    str r0, [r4, #0x0]
    ldr r3, .L_0220ea34
    add r0, r4, #0x18
    mov r1, #0x4
    mov r2, #0xc
    str ip, [sp, #0x0]
    bl __construct_array
    mov r1, #0x0
    add r0, r4, #0x84
    str r1, [r4, #0x50]
    bl func_02092798
    ldr r1, .L_0220ea38
    add r0, r4, #0x84
    bl func_02092814
    add r0, r4, #0x84
    ldr r1, .L_0220ea3c
    bl func_02092814
    ldr r1, .L_0220ea40
    ldr r0, .L_0220ea44
    ldr r2, [r1, #0x0]
    mov r1, #0x2
    str r2, [r4, #0xa8]
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
    ldr r0, .L_0220ea48
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
    ldr r0, .L_0220ea44
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0xc]
    ldr r0, .L_0220ea48
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x10]
    mov r0, #0x34
    ldr r1, .L_0220ea4c
    mov r2, #0x4
    ldr r3, .L_0220ea50
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220e918
    ldr r1, [r4, #0xc]
    ldr r2, [r4, #0x10]
    bl func_ov058_0220e400
.L_0220e918:
    str r0, [r4, #0x14]
    mov r0, #0x4
    ldr r1, .L_0220ea54
    ldr r3, .L_0220ea50
    mov r2, r0
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220e93c
    bl func_ov058_0220e5fc
.L_0220e93c:
    mov r3, #0x0
    str r0, [r4, #0x80]
    str r3, [r4, #0x48]
    str r3, [r4, #0x4c]
    mvn r2, #0x0
    mov r1, r3
.L_0220e954:
    add r0, r4, r3, lsl #0x2
    str r2, [r0, #0x58]
    add r3, r3, #0x1
    str r1, [r0, #0x6c]
    cmp r3, #0x5
    blt .L_0220e954
    str r1, [r4, #0x58]
    str r1, [r4, #0x6c]
    mov r0, #0x1
    str r0, [r4, #0x5c]
    mov r0, #0xc
    str r0, [r4, #0x70]
    mov r0, #0x2
    str r0, [r4, #0x60]
    mov r0, #0x18
    str r0, [r4, #0x74]
    mov r0, #0x3
    str r0, [r4, #0x54]
    ldr r0, .L_0220ea44
    str r1, [r4, #0xac]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldr r1, .L_0220ea58
    ldr r2, .L_0220ea5c
    strh r1, [r0, #0x4]
    ldr r1, .L_0220ea48
    strh r2, [r0, #0x6]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldr r2, .L_0220ea58
    ldr r1, .L_0220ea5c
    strh r2, [r0, #0x4]
    strh r1, [r0, #0x6]
    mov r0, r4
    bl func_ov058_0220f11c
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x14]
    blx r2
    ldr r0, .L_0220ea60
    ldr r1, .L_0220ea64
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_0220ea60
    mov r1, #0x3d4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x4]
    mov r0, r4
    orr r1, r1, #0x2
    str r1, [r4, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0220ea2c: .word data_ov058_0220fcc4
.L_0220ea30: .word GraphicsResourceSet_Destroy
.L_0220ea34: .word GraphicsResourceSet_Init
.L_0220ea38: .word 0x7001
.L_0220ea3c: .word 0x7009
.L_0220ea40: .word data_ov058_0220fd0c
.L_0220ea44: .word data_020f4e14
.L_0220ea48: .word gDebugFont
.L_0220ea4c: .word data_ov058_0220fcec
.L_0220ea50: .word gHeapContext
.L_0220ea54: .word data_ov058_0220fcf4
.L_0220ea58: .word 0xc85
.L_0220ea5c: .word 0x25d3
.L_0220ea60: .word gGameWork
.L_0220ea64: .word 0x3d3
.size func_ov058_0220e840, . - func_ov058_0220e840
