.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern GX_SetGraphicsMode
.extern Heap_Alloc
.extern Scene_Init
.extern Scene_SetFlags03
.extern data_ov066_02210f20
.extern data_ov066_02210f4c
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_StartSubTransition
.extern func_ov066_0220fd20
.extern func_ov066_0220fe40
.extern func_ov066_0220fee0
.extern func_ov066_022107ac
.extern gHeapContext

.global func_ov066_0220fd3c
func_ov066_0220fd3c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    mov r5, r1
    bl Scene_Init
    ldr r3, .L_0220fe30
    mov r1, #0x0
    mov r2, r1
    add r0, r4, #0x30
    str r3, [r4, #0x0]
    bl func_ov066_0220fe40
    mov r0, #0x0
    str r5, [r4, #0x3c]
    bl func_ov066_0220fd20
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl GX_SetGraphicsMode
    mov r0, #0x1bc
    ldr r1, .L_0220fe34
    mov r2, #0x4
    ldr r3, .L_0220fe38
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fdd0
    mov r2, #0x40
    ldr r1, .L_0220fe3c
    str r2, [sp, #0x0]
    mov r2, #0x28
    str r2, [sp, #0x4]
    mov r2, #0xc0
    str r2, [sp, #0x8]
    mov ip, #0xb4
    add r2, r1, #0x1
    add r3, r1, #0x2
    str ip, [sp, #0xc]
    bl func_ov066_022107ac
.L_0220fdd0:
    str r0, [r4, #0x24]
    mov r5, #0x0
.L_0220fdd8:
    mov r0, r4
    bl func_ov066_0220fee0
    add r5, r5, #0x1
    cmp r5, #0xa
    blt .L_0220fdd8
    mov r0, #0x1
    str r0, [r4, #0x28]
    mov r2, #0x0
    mov r1, #0x10
    str r2, [r4, #0x2c]
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq .L_0220fe24
    mov r0, r4
    bl Scene_SetFlags03
.L_0220fe24:
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0220fe30: .word data_ov066_02210f20
.L_0220fe34: .word data_ov066_02210f4c
.L_0220fe38: .word gHeapContext
.L_0220fe3c: .word 0x1714
.size func_ov066_0220fd3c, . - func_ov066_0220fd3c
