.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern Heap_Alloc
.extern Scene_Init
.extern Scene_SetFlags03
.extern data_021052fc
.extern data_ov062_02211c14
.extern data_ov062_02211c40
.extern func_02004fe0
.extern func_02005580
.extern func_02005afc
.extern func_02005c3c
.extern Actor_SetDirectionFromVector
.extern Type7Actor_EnterSpecialPresentationState
.extern func_020593ac
.extern func_0205974c
.extern func_02072b68
.extern func_ov062_0220fd20
.extern gHeapContext
.extern gSoundContext

.global func_ov062_02210b38
func_ov062_02210b38:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r4, r0
    bl Scene_Init
    ldr r1, .L_02211030
    add r0, r4, #0x24
    str r1, [r4, #0x0]
    bl func_02004fe0
    add r0, r4, #0x34
    bl func_02004fe0
    add r0, r4, #0x44
    bl func_02004fe0
    mov r1, #0x0
    str r1, [r4, #0x70]
    str r1, [r4, #0x74]
    mov r0, #0x1
    str r0, [r4, #0x78]
    mov r0, #0xc
    stmib r4, {r0, r1}
    ldr r0, .L_02211034
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r2, [r0, #0xea4]
    str r2, [r4, #0x58]
    ldr r0, [r2, #0x230]
    bic r0, r0, #0x4
    str r0, [r2, #0x230]
    ldr r0, [r4, #0x58]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    mov r1, #0x0
    ldr r0, [r4, #0x58]
    mov r2, r1
    add r0, r0, #0x38
    mov r3, r1
    bl func_ov062_0220fd20
    mov r1, #0x0
    ldr r0, [r4, #0x58]
    mov r2, r1
    add r0, r0, #0x88
    mov r3, r1
    bl func_ov062_0220fd20
    mov r1, #0x0
    ldr r0, [r4, #0x58]
    mov r2, r1
    add r0, r0, #0x98
    mov r3, r1
    bl func_ov062_0220fd20
    ldr r2, [r4, #0x58]
    ldr r0, .L_02211034
    ldr r1, [r2, #0x230]
    orr r1, r1, #0x100
    str r1, [r2, #0x230]
    ldr r2, [r4, #0x58]
    ldr r1, [r2, #0x14]
    orr r1, r1, #0x2
    str r1, [r2, #0x14]
    ldr r5, [r4, #0x58]
    ldr r0, [r0, #0x0]
    ldr r2, [r5, #0x1c]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r1, [r5, #0x20]
    ldr r3, [r0, #0x0]
    mov r6, r2, asr #0x10
    mov r7, r1, asr #0x10
    ldr r3, [r3, #0x2c]
    mov r1, r6
    mov r2, r7
    blx r3
    mov r1, r0, lsl #0x16
    mov r1, r1, lsr #0x1b
    str r0, [sp, #0xc]
    str r0, [sp, #0x10]
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_02210e14
.L_02210c70:
    b .L_02210e14
    b .L_02210e14
    b .L_02210c88
    b .L_02210d5c
    b .L_02210d00
    b .L_02210db8
.L_02210c88:
    mov r0, #0x0
    strh r0, [r4, #0x54]
    add r0, r7, #0x1
    mov r9, r0, lsl #0x10
    ldr r1, [r5, #0x1c]
    ldr r3, [r5, #0x24]
    add r0, r4, #0x44
    add r2, r9, #0x4000
    bl func_ov062_0220fd20
    sub r0, r7, #0x1
    ldr r3, [r5, #0x24]
    mov r6, r0, lsl #0x10
    ldr r1, [r5, #0x1c]
    add r0, r4, #0x34
    sub r2, r6, #0x8000
    sub r3, r3, #0x18000
    bl func_ov062_0220fd20
    ldr r0, [r5, #0x24]
    add r2, r6, #0xa000
    sub r3, r0, #0x3000
    add r0, r4, #0x34
    ldr r1, [r5, #0x1c]
    bl func_ov062_0220fd20
    sub r2, r9, #0x3000
    add r0, r4, #0x24
    ldr r1, [r5, #0x1c]
    ldr r3, [r5, #0x24]
    sub r3, r3, #0x3000
    bl func_ov062_0220fd20
    b .L_02210e34
.L_02210d00:
    mov r0, #0x1
    strh r0, [r4, #0x54]
    mov r6, r7, lsl #0x10
    ldr r1, [r5, #0x1c]
    ldr r3, [r5, #0x24]
    add r0, r4, #0x44
    sub r2, r6, #0x4000
    bl func_ov062_0220fd20
    add r0, r7, #0x1
    ldr r3, [r5, #0x24]
    mov r2, r0, lsl #0x10
    ldr r1, [r5, #0x1c]
    add r0, r4, #0x34
    add r2, r2, #0x8000
    sub r3, r3, #0x18000
    bl func_ov062_0220fd20
    ldr r0, [r5, #0x24]
    ldr r1, [r5, #0x1c]
    add r2, r6, #0x3000
    sub r3, r0, #0x3000
    add r0, r4, #0x24
    bl func_ov062_0220fd20
    b .L_02210e34
.L_02210d5c:
    mov r0, #0x2
    strh r0, [r4, #0x54]
    mov r7, r6, lsl #0x10
    ldr r2, [r5, #0x20]
    ldr r3, [r5, #0x24]
    add r0, r4, #0x44
    sub r1, r7, #0x4000
    bl func_ov062_0220fd20
    add r0, r6, #0x1
    ldr r3, [r5, #0x24]
    mov r1, r0, lsl #0x10
    ldr r2, [r5, #0x20]
    add r0, r4, #0x34
    add r1, r1, #0x10000
    sub r3, r3, #0x18000
    bl func_ov062_0220fd20
    ldr r0, [r5, #0x24]
    ldr r2, [r5, #0x20]
    add r1, r7, #0x3000
    sub r3, r0, #0x3000
    add r0, r4, #0x24
    bl func_ov062_0220fd20
    b .L_02210e34
.L_02210db8:
    mov r0, #0x3
    strh r0, [r4, #0x54]
    add r0, r6, #0x1
    mov r7, r0, lsl #0x10
    ldr r2, [r5, #0x20]
    ldr r3, [r5, #0x24]
    add r0, r4, #0x44
    add r1, r7, #0x4000
    bl func_ov062_0220fd20
    ldr r3, [r5, #0x24]
    mov r1, r6, lsl #0x10
    ldr r2, [r5, #0x20]
    add r0, r4, #0x34
    sub r1, r1, #0x10000
    sub r3, r3, #0x18000
    bl func_ov062_0220fd20
    ldr r0, [r5, #0x24]
    ldr r2, [r5, #0x20]
    sub r1, r7, #0x3000
    sub r3, r0, #0x3000
    add r0, r4, #0x24
    bl func_ov062_0220fd20
    b .L_02210e34
.L_02210e14:
    cmp r4, #0x0
    beq .L_02210e2c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210e2c:
    mov r0, r4
    b .L_02211028
.L_02210e34:
    ldr r1, .L_02211038
    ldr r3, .L_0221103c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210e60
    ldr r1, .L_02211040
    sub r2, r1, #0x10
    add r3, r1, #0x1
    bl func_02005580
.L_02210e60:
    ldr r1, .L_02211038
    str r0, [r4, #0x5c]
    ldr r3, .L_0221103c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210e90
    ldr r1, .L_02211044
    sub r2, r1, #0x12
    add r3, r1, #0x1
    bl func_02005580
.L_02210e90:
    mov r2, #0x0
    str r0, [r4, #0x60]
    str r2, [sp, #0x0]
    mov r0, #0x2
    stmib sp, {r0, r2}
    ldr r0, [r4, #0x58]
    ldr r1, [r4, #0x5c]
    ldr r0, [r0, #0x54]
    mov r3, r2
    ldr r0, [r0, #0x0]
    bl func_02005c3c
    str r0, [r4, #0x64]
    ldrsh r0, [r4, #0x54]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02210f40
.L_02210ed0:
    b .L_02210ee0
    b .L_02210ef8
    b .L_02210f10
    b .L_02210f28
.L_02210ee0:
    mov r1, #0x0
    ldr r0, [r4, #0x58]
    sub r2, r1, #0x1000
    mov r8, #0x10
    bl Actor_SetDirectionFromVector
    b .L_02210f40
.L_02210ef8:
    ldr r0, [r4, #0x58]
    mov r1, #0x0
    mov r2, #0x1000
    mov r8, #0xc
    bl Actor_SetDirectionFromVector
    b .L_02210f40
.L_02210f10:
    ldr r0, [r4, #0x58]
    mov r1, #0x1000
    mov r2, #0x0
    mov r8, #0x12
    bl Actor_SetDirectionFromVector
    b .L_02210f40
.L_02210f28:
    mov r1, #0x1000
    ldr r0, [r4, #0x58]
    rsb r1, r1, #0x0
    mov r2, #0x0
    mov r8, #0xe
    bl Actor_SetDirectionFromVector
.L_02210f40:
    ldr r0, [r4, #0x64]
    and r1, r8, #0xff
    bl func_02072b68
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x64]
    ldr r1, [r5, #0x1c]
    ldr r2, [r5, #0x20]
    ldr r3, [r5, #0x24]
    bl func_02005afc
    ldr r1, .L_02211038
    ldr r3, .L_0221103c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210f94
    ldr r1, .L_02211048
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_02005580
.L_02210f94:
    mov r2, #0x0
    str r0, [r4, #0x68]
    str r2, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x2
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x58]
    ldr r1, [r4, #0x68]
    ldr r0, [r0, #0x54]
    mov r3, r2
    ldr r0, [r0, #0x0]
    bl func_02005c3c
    ldr r1, .L_0221104c
    str r0, [r4, #0x6c]
    ldr r0, [r1, #0x0]
    mov r1, #0x1b8
    bl func_0205974c
    mov r1, #0x0
    str r1, [sp, #0x0]
    sub r2, r1, #0x100
    ldr r0, .L_0221104c
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x28
    mov r3, #0x50
    bl func_020593ac
    ldr r0, .L_02211034
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_0221101c
    bl Type7Actor_EnterSpecialPresentationState
.L_0221101c:
    mov r0, r4
    bl Scene_SetFlags03
    mov r0, r4
.L_02211028:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_02211030: .word data_ov062_02211c14
.L_02211034: .word data_021052fc
.L_02211038: .word data_ov062_02211c40
.L_0221103c: .word gHeapContext
.L_02211040: .word 0x1011
.L_02211044: .word 0x1013
.L_02211048: .word 0x162b
.L_0221104c: .word gSoundContext
.size func_ov062_02210b38, . - func_ov062_02210b38
