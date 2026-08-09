.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern Scene_ClearFlags03
.extern data_021052fc
.extern data_ov074_02211db8
.extern func_02005058
.extern func_020068e0
.extern func_02006a5c
.extern func_02006acc
.extern func_02007a24
.extern func_02007ae8
.extern func_02007b18
.extern func_02007f0c
.extern func_02008148
.extern func_0200ec6c
.extern func_0200ecbc
.extern func_0200f878
.extern func_020122a0
.extern func_02029c94
.extern func_0202d68c
.extern func_ov074_02210878
.extern gHeapContext
.extern gSceneManager

.global func_ov074_022105b4
func_ov074_022105b4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4c
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl Scene_ClearFlags03
    ldr r0, .L_02210720
    ldr r0, [r0, #0x0]
    bl func_02007ae8
    ldr r0, .L_02210720
    mov r1, r6
    ldr r0, [r0, #0x0]
    bl func_02007b18
    add r0, sp, #0x3c
    mov r1, r5
    bl func_02006acc
    ldr r0, .L_02210720
    add r1, sp, #0x3c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200ecbc
    add r0, sp, #0x3c
    bl func_02005058
    ldr r0, .L_02210720
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200ec6c
    ldr r0, .L_02210720
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    bl func_02029c94
    ldr r0, .L_02210720
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02008148
    ldr r0, .L_02210720
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl func_02007a24
    ldr r2, [r4, #0x24]
    add r0, sp, #0x0
    mov r1, r4
    bl func_ov074_02210878
    add r0, r4, #0xc8
    add r1, sp, #0x0
    bl func_02006a5c
    add r0, sp, #0x0
    bl func_020068e0
    ldr r0, [r4, #0x124]
    cmp r0, #0x0
    bne .L_022106ac
    ldr r0, .L_02210720
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl func_020122a0
    b .L_022106c4
.L_022106ac:
    ldr r0, .L_02210720
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r1, #0x0
    bl func_0202d68c
.L_022106c4:
    ldr r0, .L_02210720
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    bl func_02029c94
    mov r0, #0x28
    ldr r1, .L_02210724
    ldr r3, .L_02210728
    sub r2, r0, #0x2c
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210700
    mov r1, #0x1
    bl func_0200f878
.L_02210700:
    ldr r0, .L_0221072c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    add sp, sp, #0x4c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02210720: .word data_021052fc
.L_02210724: .word data_ov074_02211db8
.L_02210728: .word gHeapContext
.L_0221072c: .word gSceneManager
.size func_ov074_022105b4, . - func_ov074_022105b4
