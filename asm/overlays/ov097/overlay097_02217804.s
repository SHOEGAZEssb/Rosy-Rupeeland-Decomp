.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern GameWork_TestFlag
.extern data_ov097_0221a4c8
.extern data_ov097_0221a5f4
.extern func_02004fe0
.extern ActorExtendedType2_GetDescriptorValue25
.extern func_ov075_02212ae0
.extern func_ov097_022177e0
.extern func_ov097_02217934
.extern gGameWork

.global func_ov097_02217804
func_ov097_02217804:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl func_ov075_02212ae0
    ldr r1, .L_02217920
    add r0, r4, #0x200
    str r1, [r4, #0x0]
    mov r2, #0x0
    strh r2, [r0, #0xb8]
    strh r2, [r0, #0xba]
    strb r2, [r4, #0x2bc]
    mov r1, #0x1
    strb r1, [r4, #0x2bd]
    strh r2, [r0, #0xbe]
    strh r2, [r0, #0xc0]
    strh r2, [r0, #0xc2]
    add r0, r4, #0x2c8
    str r2, [r4, #0x2c4]
    bl func_02004fe0
    add r0, r4, #0x2d8
    bl func_02004fe0
    mov r2, #0x8
    str r2, [sp, #0x0]
    sub r1, r2, #0x26
    add r0, r4, #0x8
    sub r2, r2, #0x1c
    mov r3, #0x1e
    bl func_ov097_02217934
    mov r1, #0x19
    add r0, r4, #0x200
    strh r1, [r0, #0x9e]
    ldr r0, .L_02217924
    mov r1, #0x4
    ldr r3, [r0, #0x40]
    ldr r2, [r0, #0x44]
    mov r0, r4
    str r3, [r4, #0x2a4]
    str r2, [r4, #0x2a8]
    strh r1, [r4, #0xda]
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    ldr r0, .L_02217928
    moveq r2, #0x4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    movne r2, #0x5
    mov r3, r1
    bl func_ov097_022177e0
    mov r0, r4
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022178f4
    ldr r0, .L_02217928
    ldr r1, .L_0221792c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    b .L_02217904
.L_022178f4:
    ldr r0, .L_02217928
    ldr r1, .L_02217930
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
.L_02217904:
    cmp r0, #0x0
    ldrne r0, [r4, #0x260]
    orrne r0, r0, #0x2000
    strne r0, [r4, #0x260]
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02217920: .word data_ov097_0221a5f4
.L_02217924: .word data_ov097_0221a4c8
.L_02217928: .word gGameWork
.L_0221792c: .word 0x415
.L_02217930: .word 0x416
.size func_ov097_02217804, . - func_ov097_02217804
