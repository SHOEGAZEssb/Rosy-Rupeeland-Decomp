.text
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern Heap_Alloc
.extern OverlaySlot_Init
.extern OverlaySlot_LoadOverlay
.extern TouchPoint_InitZero
.extern VecFx32Object_Init
.extern data_020f3158
.extern data_020f3160
.extern data_020f4e14
.extern func_0209ef24
.extern func_020a6404
.extern func_020a68dc
.extern func_020a6940
.extern func_ov007_021fb720
.extern func_ov010_021fce84
.extern func_ov039_022058d8
.extern func_ov049_0220b780
.extern func_ov069_02211894
.extern gDebugFont
.extern gGamePhaseRuntime
.extern gHeapContext

.global func_0209def4
func_0209def4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    add r0, r4, #0x24
    mov r6, r1
    mov r5, r2
    bl VecFx32Object_Init
    add r0, r4, #0x34
    bl VecFx32Object_Init
    add r0, r4, #0x50
    bl func_020a6940
    add r0, r4, #0x80
    bl TouchPoint_InitZero
    add r0, r4, #0x94
    bl OverlaySlot_Init
    add r0, r4, #0xa0
    bl OverlaySlot_Init
    add r0, r4, #0xac
    bl OverlaySlot_Init
    add r0, r4, #0xb8
    bl OverlaySlot_Init
    cmp r5, #0x2
    moveq r5, #0x1
    ldr r0, .L_0209e16c
    str r6, [r4, #0xc4]
    ldr r0, [r0, #0x0]
    movne r5, #0x0
    bl GraphicsSpriteGroupOwner_CreateGroup
    ldr r1, .L_0209e170
    str r0, [r4, #0x0]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x4]
    ldr r1, .L_0209e174
    add r0, r4, #0x94
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_0209e178
    add r0, r4, #0xa0
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_0209e17c
    add r0, r4, #0xac
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_0209e180
    add r0, r4, #0xb8
    bl OverlaySlot_LoadOverlay
    mov r0, #0x0
    str r0, [r4, #0x14]
    str r0, [r4, #0x18]
    ldr r1, .L_0209e184
    ldr r3, .L_0209e188
    mov r0, #0xd8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209dfd8
    ldr r2, [r4, #0x0]
    mov r1, r4
    bl func_ov039_022058d8
.L_0209dfd8:
    str r0, [r4, #0x8]
    ldr r0, .L_0209e18c
    ldr r1, .L_0209e190
    ldr r3, .L_0209e188
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209e008
    ldr r2, [r4, #0x0]
    mov r1, r4
    mov r3, r5
    bl func_ov010_021fce84
.L_0209e008:
    ldr r1, .L_0209e184
    str r0, [r4, #0x14]
    ldr r3, .L_0209e188
    mov r0, #0xbc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209e038
    ldr r2, [r4, #0x0]
    mov r1, r4
    mov r3, r5
    bl func_ov049_0220b780
.L_0209e038:
    ldr r1, .L_0209e184
    str r0, [r4, #0xc]
    ldr r3, .L_0209e188
    mov r0, #0x8c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209e060
    ldr r1, [r4, #0x0]
    bl func_0209ef24
.L_0209e060:
    ldr r1, .L_0209e184
    str r0, [r4, #0x10]
    ldr r3, .L_0209e188
    mov r0, #0xdc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209e088
    mov r1, r4
    bl func_ov007_021fb720
.L_0209e088:
    str r0, [r4, #0x20]
    cmp r5, #0x1
    bne .L_0209e0c4
    ldr r1, .L_0209e184
    ldr r3, .L_0209e188
    mov r0, #0x68
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209e0bc
    ldr r2, [r4, #0x0]
    mov r1, r4
    bl func_ov069_02211894
.L_0209e0bc:
    str r0, [r4, #0x1c]
    b .L_0209e110
.L_0209e0c4:
    ldr r0, .L_0209e194
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x1c]
    beq .L_0209e110
    ldr r1, .L_0209e184
    ldr r3, .L_0209e188
    mov r0, #0x68
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0209e10c
    ldr r2, [r4, #0x0]
    mov r1, r4
    bl func_ov069_02211894
.L_0209e10c:
    str r0, [r4, #0x1c]
.L_0209e110:
    mov r0, #0x1
    str r0, [r4, #0x74]
    ldr r0, [r4, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a6404
    mov r0, #0x1
    str r0, [r4, #0x78]
    mov r1, #0x180000
    str r1, [r4, #0x28]
    str r1, [r4, #0x2c]
    str r1, [r4, #0x38]
    mov r0, #0x0
    str r1, [r4, #0x3c]
    str r0, [r4, #0x48]
    str r0, [r4, #0x44]
    str r0, [r4, #0x90]
    str r0, [r4, #0x4c]
    str r0, [r4, #0x7c]
    ldr r0, [r4, #0xc4]
    ldr r0, [r0, #0x34]
    bl func_020a68dc
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_0209e16c: .word data_020f4e14
.L_0209e170: .word gDebugFont
.L_0209e174: .word 0x27
.L_0209e178: .word 0x45
.L_0209e17c: .word 0x31
.L_0209e180: .word 0x7
.L_0209e184: .word data_020f3158
.L_0209e188: .word gHeapContext
.L_0209e18c: .word 0x1db4
.L_0209e190: .word data_020f3160
.L_0209e194: .word gGamePhaseRuntime
.size func_0209def4, . - func_0209def4
