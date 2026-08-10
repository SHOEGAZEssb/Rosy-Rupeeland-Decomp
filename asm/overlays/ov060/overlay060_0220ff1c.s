.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern Heap_Alloc
.extern Scene_GetEmbedded10
.extern TouchRegionManager_Add
.extern TouchRegionManager_Allocate
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov060_0221064c
.extern func_02071ea4
.extern func_02071ee0
.extern GraphicsSpriteGroup_CreateState
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_ov060_0220fd20
.extern func_ov060_0220fd84
.extern func_ov060_0220fe50
.extern func_ov060_0220ff00
.extern func_ov060_02210098
.extern gHeapContext

.global func_ov060_0220ff1c
func_ov060_0220ff1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r7, r0
    add r0, r7, #0x4
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02071ea4
    mov r0, #0x0
    bl func_ov060_0220ff00
    ldrh r2, [sp, #0x30]
    ldr r1, .L_02210088
    ldrh r3, [sp, #0x2c]
    str r2, [sp, #0x0]
    ldrh r2, [sp, #0x28]
    ldr r1, [r1, #0x0]
    add r0, r7, #0x4
    bl func_02071ee0
    ldr r0, .L_0221008c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r7, #0x0]
    mov r0, r6
    bl Scene_GetEmbedded10
    mov r1, #0x2
    bl TouchRegionManager_Allocate
    mov r1, #0x0
    mov r3, #0x2c
    add r0, sp, #0x4
    mov r2, r1
    str r3, [sp, #0x0]
    bl func_ov060_02210098
    ldr r1, .L_02210090
    ldr r3, .L_02210094
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    movs r8, r0
    beq .L_0220ffc8
    add r2, sp, #0x4
    mov r1, #0x64
    bl func_ov060_0220fd20
    mov r8, r0
.L_0220ffc8:
    mov r0, r6
    bl Scene_GetEmbedded10
    mov r1, r8
    bl TouchRegionManager_Add
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldmia r7, {r0, r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    mov r1, r0
    mov r0, r8
    mov r2, #0x0
    mov r3, #0x1
    bl func_ov060_0220fd84
    mov r0, r8
    sub r1, r5, #0x3c
    mov r2, r4
    bl func_ov060_0220fe50
    ldr r1, .L_02210090
    ldr r3, .L_02210094
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    movs r8, r0
    beq .L_02210038
    add r2, sp, #0x4
    mov r1, #0x65
    bl func_ov060_0220fd20
    mov r8, r0
.L_02210038:
    mov r0, r6
    bl Scene_GetEmbedded10
    mov r1, r8
    bl TouchRegionManager_Add
    mov r0, #0x1
    str r0, [sp, #0x0]
    ldmia r7, {r0, r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    mov r1, r0
    mov r0, r8
    mov r2, #0x2
    mov r3, #0x3
    bl func_ov060_0220fd84
    mov r0, r8
    add r1, r5, #0xc
    mov r2, r4
    bl func_ov060_0220fe50
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_02210088: .word data_020f4e18
.L_0221008c: .word data_020f4e14
.L_02210090: .word data_ov060_0221064c
.L_02210094: .word gHeapContext
.size func_ov060_0220ff1c, . - func_ov060_0220ff1c
