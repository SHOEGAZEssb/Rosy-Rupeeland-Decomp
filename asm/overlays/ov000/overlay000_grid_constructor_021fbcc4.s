; Matching retail form; see src/overlays/ov000/overlay000_grid_constructor.c.
.text
.extern data_ov000_021fcd30
.extern data_020f4e18
.extern data_021e9ac0
.extern data_ov000_021fcd54
.extern gHeapContext
.extern func_020683c8
.extern func_020683f4
.extern data_ov000_021fcd5c
.extern func_02003e20
.extern Heap_Alloc
.extern func_02062b28
.extern func_02071ea4
.extern func_02071ee0
.extern func_02073e48
.extern func_02073ffc
.extern func_020742cc
.extern func_02092798
.extern func_02092814
.extern func_02093a88
.extern func_02093adc
.extern func_02094154
.extern func_020957bc
.extern func_020957f0
.extern func_02095820
.extern func_02095940
.extern func_020befec
.extern func_020c09cc
.extern func_ov000_021fc658
.global func_ov000_021fbcc4
func_ov000_021fbcc4: ; 0x021fbcc4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    ldr r2, L_021fc030
    add r0, r10, #0x10
    mov r4, r1
    str r2, [r10, #0x0]
    bl func_02071ea4
    add r0, r10, #0x24
    bl func_020957bc
    add r0, r10, #0xd0
    bl func_020957bc
    add r0, r10, #0x17c
    bl func_020957bc
    add r0, r10, #0x228
    bl func_02092798
    add r0, r10, #0x270
    bl func_02093a88
    str r4, [r10, #0x4]
    mov r2, #0x0
    str r2, [r10, #0x25c]
    str r2, [r10, #0x264]
    str r2, [r10, #0x1c]
    str r2, [r10, #0x2a8]
    mov r0, #0x1e
    str r0, [r10, #0x2ac]
    mov r0, #0x2
    str r0, [sp, #0x0]
    ldr r1, L_021fc034
    add r0, r10, #0x10
    ldr r1, [r1, #0x0]
    mov r3, #0x1
    bl func_02071ee0
    ldr r0, [r10, #0x4]
    bl func_020742cc
    str r0, [r10, #0x8]
    ldr r0, [r10, #0x4]
    bl func_020742cc
    str r0, [r10, #0xc]
    ldr r1, [r10, #0x264]
    rsb r2, r1, #0x0
    mov r1, #0x0
    str r1, [r0, #0x18]
    str r2, [r0, #0x1c]
    ldr r0, [r10, #0xc]
    add r1, r10, #0x10
    mov r2, #0x1
    bl func_02073ffc
    str r0, [r10, #0x20]
    mov r1, #0x2
    mov r2, #0x38
    str r1, [sp, #0x0]
    mov r0, #0x0
    stmib sp, {r0, r1}
    ldr r0, [r10, #0x20]
    mov r3, r2
    bl func_02073e48
    ldr r0, [r10, #0xc]
    add r1, r10, #0x10
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r4, #0x0
    add r0, r10, #0x24
    mov r2, #0x3a
    mov r3, #0x2
    str r4, [sp, #0x0]
    bl func_020957f0
    add r0, r10, #0x24
    mov r1, #0xec
    mov r2, #0xaa
    bl func_02095820
    add r0, r10, #0x24
    bl func_02095940
    ldr r0, [r10, #0xc]
    add r1, r10, #0x10
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r0, r4
    str r0, [sp, #0x0]
    add r0, r10, #0xd0
    mov r2, #0x4
    mov r3, #0x2
    bl func_020957f0
    add r0, r10, #0xd0
    mov r1, #0x40
    mov r2, #0x10
    bl func_02095820
    add r0, r10, #0xd0
    bl func_02095940
    ldr r0, [r10, #0xc]
    add r1, r10, #0x10
    mov r2, #0x1
    bl func_02073ffc
    mov r1, r0
    mov r0, r4
    str r0, [sp, #0x0]
    add r0, r10, #0x17c
    mov r2, #0x43
    mov r3, #0x2
    bl func_020957f0
    add r0, r10, #0x17c
    mov r1, #0xdc
    mov r2, #0x10
    bl func_02095820
    add r0, r10, #0x17c
    bl func_02095940
    ldr r1, L_021fc038
    add r0, r10, #0x228
    bl func_02092814
    ldr r1, [r10, #0x264]
    mov r5, r4
    rsb r1, r1, #0x34
    ldr r0, L_021fc03c
    str r1, [r10, #0x268]
    ldr r0, [r0, #0x0]
    mov r4, #0x24
    str r0, [r10, #0x24c]
    str r5, [r10, #0x254]
    b L_021fbec4
L_021fbea8:
    ldr r0, [r1, #0x8]
    mla r0, r5, r4, r0
    bl func_02062b28
    cmp r0, #0x0
    addeq r0, r5, #0x1
    streq r0, [r10, #0x254]
    add r5, r5, #0x1
L_021fbec4:
    ldr r1, [r10, #0x24c]
    ldr r0, [r1, #0x10]
    cmp r5, r0
    blt L_021fbea8
    ldr r0, [r10, #0x254]
    mov r1, #0x5
    cmp r0, #0xf
    movlt r0, #0xf
    strlt r0, [r10, #0x254]
    ldr r0, [r10, #0x254]
    add r0, r0, #0x4
    bl func_020befec
    add r5, r0, r0, lsl #0x2
    str r0, [r10, #0x258]
    mov r0, r5, lsl #0x5
    ldr r1, L_021fc040
    ldr r3, L_021fc044
    add r0, r0, #0x8
    mov r2, #0x4
    str r5, [r10, #0x254]
    bl func_02003e20
    cmp r0, #0x0
    beq L_021fbf40
    ldr r1, L_021fc048
    ldr r4, L_021fc04c
    str r1, [sp, #0x0]
    mov r1, r5
    mov r2, #0x20
    mov r3, #0x8
    str r4, [sp, #0x4]
    bl func_020c09cc
L_021fbf40:
    mov r6, #0x5
    mov r4, #0x24
    str r0, [r10, #0x250]
    mov r8, #0x0
    mov r7, #0x1
    mov r11, r6
    mov r5, r4
    b L_021fbfa4
L_021fbf60:
    mov r0, r10
    mov r1, r8
    mov r2, r7
    bl func_ov000_021fc658
    ldr r2, [r10, #0x250]
    mov r0, r8
    mov r1, r6
    add r9, r2, r8, lsl #0x5
    bl func_020befec
    mul r2, r1, r4
    mov r0, r8
    str r2, [r9, #0x14]
    mov r1, r11
    bl func_020befec
    mul r1, r0, r5
    str r1, [r9, #0x18]
    add r8, r8, #0x1
L_021fbfa4:
    ldr r0, [r10, #0x254]
    cmp r8, r0
    blt L_021fbf60
    ldr r5, [r10, #0x268]
    ldr r4, [r10, #0x8]
    mov r0, #0x38
    str r0, [r4, #0x18]
    ldr r1, L_021fc050
    ldr r3, L_021fc044
    mov r0, #0x80
    mov r2, #0x4
    str r5, [r4, #0x1c]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fc00c
    mov r1, #0xea
    str r1, [sp, #0x0]
    ldr r2, [r10, #0x264]
    mov r1, #0x0
    rsb r2, r2, #0x2a
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r1, [r10, #0x4]
    ldr r2, [r10, #0x258]
    mov r3, #0x3
    bl func_02094154
L_021fc00c:
    mov r1, #0x0
    str r0, [r10, #0x26c]
    mov r3, r1
    add r0, r10, #0x270
    mov r2, #0x4
    bl func_02093adc
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fc030: .word data_ov000_021fcd30
L_021fc034: .word data_020f4e18
L_021fc038: .word 0x7004
L_021fc03c: .word data_021e9ac0
L_021fc040: .word data_ov000_021fcd54
L_021fc044: .word gHeapContext
L_021fc048: .word func_020683c8
L_021fc04c: .word func_020683f4
L_021fc050: .word data_ov000_021fcd5c
.size func_ov000_021fbcc4, . - func_ov000_021fbcc4

