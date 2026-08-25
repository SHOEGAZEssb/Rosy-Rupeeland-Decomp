.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_presentation_array.c.
.extern Heap_Alloc
.extern data_ov090_0221cc78
.extern data_ov090_0221cc98
.extern Heap_AllocAlternateEntry
.extern VecFx32Triple_Init
.extern func_020befec
.extern func_ov090_0221b9a0
.extern gHeapContext

.global func_ov090_0221bc84
func_ov090_0221bc84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    ldrsh r4, [sp, #0x38]
    mov r10, r0
    ldr r5, .L_0221bd6c
    ldr r0, [sp, #0x34]
    str r5, [r10, #0x0]
    strh r4, [r10, #0x8]
    str r0, [r10, #0xc]
    mov r0, #0x1000
    str r0, [r10, #0x10]
    ldr r6, [sp, #0x30]
    add r0, r10, #0x18
    ldr r4, [r6, #0xc]
    mov r9, r1
    mov r8, r2
    mov r7, r3
    str r4, [r10, #0x14]
    ldr r5, [sp, #0x3c]
    bl VecFx32Triple_Init
    ldrsh r0, [sp, #0x38]
    ldr r1, .L_0221bd70
    ldr r3, .L_0221bd74
    mov r2, #0x4
    mov r0, r0, lsl #0x2
    bl Heap_AllocAlternateEntry
    str r0, [r10, #0x4]
    mov r4, #0x0
    mov r11, #0x18
    b .L_0221bd40
.L_0221bcfc:
    ldr r1, .L_0221bd70
    ldr r3, .L_0221bd74
    mov r0, r11
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221bd34
    mov r1, r4, lsl #0x1
    ldrsh r3, [r5, r1]
    mov r1, r9
    mov r2, r8
    stmia sp, {r3, r6}
    mov r3, r7
    bl func_ov090_0221b9a0
.L_0221bd34:
    ldr r1, [r10, #0x4]
    str r0, [r1, r4, lsl #0x2]
    add r4, r4, #0x1
.L_0221bd40:
    ldrsh r0, [r10, #0x8]
    cmp r4, r0
    blt .L_0221bcfc
    ldrsh r1, [sp, #0x38]
    mov r0, #0x8000
    sub r1, r1, #0x1
    bl func_020befec
    strh r0, [r10, #0xa]
    mov r0, r10
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221bd6c: .word data_ov090_0221cc78
.L_0221bd70: .word data_ov090_0221cc98
.L_0221bd74: .word gHeapContext
.size func_ov090_0221bc84, . - func_ov090_0221bc84
