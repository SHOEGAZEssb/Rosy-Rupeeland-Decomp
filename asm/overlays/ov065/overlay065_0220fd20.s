.text
; Matching fallback for the portable implementation in src/overlays/ov065/overlay065_recovery.c.
.extern Heap_Alloc
.extern data_ov065_02210be4
.extern data_ov065_02210c00
.extern GraphicsSpriteState_Create
.extern func_02006328
.extern gHeapContext

.global func_ov065_0220fd20
func_ov065_0220fd20:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r2, #0x0
    mov r4, r0
    strh r2, [r4, #0x4]
    strh r2, [r4, #0x6]
    mov r0, #0x3
    strh r0, [r4, #0x8]
    strh r2, [r4, #0xa]
    ldr r0, .L_0220fda0
    strh r1, [r4, #0xc]
    ldr r1, [r0, #0x0]
    mov r0, #0xa
    str r2, [sp, #0x0]
    stmib sp, {r0, r2}
    ldr r0, [r1, #0x24]
    ldr r1, [r1, #0x14c]
    mov r3, r2
    bl GraphicsSpriteState_Create
    str r0, [r4, #0x0]
    ldr r1, .L_0220fda4
    ldr r3, .L_0220fda8
    mov r0, #0x30
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fd90
    bl func_02006328
.L_0220fd90:
    str r0, [r4, #0x10]
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_0220fda0: .word data_ov065_02210c00
.L_0220fda4: .word data_ov065_02210be4
.L_0220fda8: .word gHeapContext
.size func_ov065_0220fd20, . - func_ov065_0220fd20
