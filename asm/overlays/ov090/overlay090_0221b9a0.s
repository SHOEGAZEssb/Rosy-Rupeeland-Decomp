.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern Heap_Alloc
.extern data_ov090_0221cc68
.extern data_ov090_0221cc90
.extern DisplayController_GetVerticalOffset
.extern func_02005030
.extern UtilAnimationResource_Init
.extern func_02072b68
.extern func_ov090_0221b97c
.extern gHeapContext

.global func_ov090_0221b9a0
func_ov090_0221b9a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x14
    mov r6, r0
    mov r5, r1
    ldr r7, .L_0221ba60
    ldr r1, [sp, #0x3c]
    add r0, r6, #0x8
    mov r4, r2
    mov r10, r3
    str r7, [r6, #0x0]
    bl func_02005030
    ldr r1, .L_0221ba64
    ldr r3, .L_0221ba68
    mov r0, #0x20
    mov r2, #0x4
    bl Heap_Alloc
    movs r7, r0
    beq .L_0221ba24
    ldr r8, [r10, #0xc]
    ldr r9, [r10, #0x8]
    ldr r10, [r10, #0x4]
    bl DisplayController_GetVerticalOffset
    mov r1, #0x2
    stmia sp, {r1, r10}
    str r9, [sp, #0x8]
    str r8, [sp, #0xc]
    str r0, [sp, #0x10]
    mov r0, r7
    mov r2, r5
    mov r3, r4
    mov r1, #0x0
    bl UtilAnimationResource_Init
    mov r7, r0
.L_0221ba24:
    ldr r1, [sp, #0x38]
    str r7, [r6, #0x4]
    ldr r0, [r7, #0x4]
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, [sp, #0x38]
    ldr r0, [r7, #0x8]
    and r1, r1, #0xff
    bl func_02072b68
    ldr r0, [r6, #0x4]
    mov r1, #0x2
    bl func_ov090_0221b97c
    mov r0, r6
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0221ba60: .word data_ov090_0221cc68
.L_0221ba64: .word data_ov090_0221cc90
.L_0221ba68: .word gHeapContext
.size func_ov090_0221b9a0, . - func_ov090_0221b9a0
