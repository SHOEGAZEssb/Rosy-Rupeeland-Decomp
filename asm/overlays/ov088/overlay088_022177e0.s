.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern data_020ed470
.extern data_021056f0
.extern data_ov088_0221b928
.extern ActorCollection_QueueActorForRemoval
.extern Actor_GetCollisionBounds
.extern Actor_GetCollection
.extern ActorDerivedRuntime_Init
.extern func_020befec
.extern func_ov088_022179e0
.extern func_ov088_022179f4
.extern func_ov088_02217a18
.extern func_ov088_02217c3c

.global func_ov088_022177e0
func_ov088_022177e0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    bl ActorDerivedRuntime_Init
    ldr r2, .L_022179d4
    mov r1, #0x0
    str r2, [r5, #0x0]
    add r0, r5, #0x200
    str r1, [r5, #0x208]
    strh r1, [r0, #0x14]
    strh r1, [r0, #0x16]
    mov r2, #0xf
    strh r2, [r0, #0x18]
    strh r1, [r0, #0x1a]
    strh r1, [r0, #0x1e]
    str r1, [r5, #0x220]
    str r1, [r5, #0x224]
    str r1, [r5, #0x228]
    str r1, [r5, #0x22c]
    strh r1, [r0, #0x30]
    mov r2, #0xc
    strh r2, [r0, #0x32]
    strh r1, [r0, #0x34]
    strh r1, [r0, #0x36]
    strh r1, [r0, #0x40]
    strh r1, [r0, #0x42]
    str r1, [r5, #0x24c]
    str r1, [r5, #0x250]
    str r1, [r5, #0x254]
    mov r2, r1
    mov r3, r1
    str r1, [r5, #0x258]
    mov ip, #0x1800
    add r0, r5, #0x25c
    str ip, [sp, #0x0]
    bl func_ov088_022179e0
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x6c]
    strh r1, [r0, #0x6e]
    strh r1, [r0, #0x70]
    ldrh r1, [r4, #0x2]
    ldr r2, .L_022179d8
    mov r0, #0x30
    mla r0, r1, r0, r2
    str r0, [r5, #0x238]
    ldrb r0, [r0, #0x2]
    mov r1, #0x64
    mov r0, r0, lsl #0xc
    bl func_020befec
    str r0, [r5, #0x210]
    ldr r0, [r5, #0x238]
    mov r1, #0x64
    ldrb r0, [r0, #0x3]
    mov r0, r0, lsl #0xc
    bl func_020befec
    str r0, [r5, #0x20c]
    ldr r0, [r5, #0x238]
    add r1, r5, #0x200
    ldrsh r3, [r0, #0x16]
    mov r0, #0x3c
    mov r2, #0x0
    smulbb r0, r3, r0
    strh r0, [r1, #0x1c]
    strh r2, [r5, #0xda]
    ldr r1, [r5, #0x5c]
    sub r0, r2, #0x10000
    and r0, r1, r0
    orr r0, r0, #0x20
    str r0, [r5, #0x5c]
    ldr r0, [r5, #0x14]
    tst r0, #0x400
    ldrne r0, [r5, #0xd0]
    orrne r0, r0, #0x4
    strne r0, [r5, #0xd0]
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_0221792c
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_0221792c:
    ldr r2, [r5, #0x24]
    add r0, r5, #0x244
    add r1, r5, #0x60
    str r2, [r5, #0x23c]
    bl func_ov088_022179f4
    mov r4, #0x5
    add r0, sp, #0x8
    sub r1, r4, #0x19
    sub r2, r4, #0xf
    mov r3, #0x14
    str r4, [sp, #0x0]
    bl func_ov088_02217c3c
    add r1, sp, #0x8
    add r0, r5, #0x8
    bl func_ov088_02217a18
    mov r2, r4
    str r2, [sp, #0x0]
    sub r1, r2, #0x15
    add r0, sp, #0x4
    sub r2, r2, #0xf
    mov r3, #0x10
    bl func_ov088_02217c3c
    mov r0, r5
    bl Actor_GetCollisionBounds
    add r1, sp, #0x4
    bl func_ov088_02217a18
    add r0, r5, #0x200
    ldrh r2, [r0, #0x1a]
    ldr r1, .L_022179dc
    orr r2, r2, #0x20
    strh r2, [r0, #0x1a]
    ldr r0, [r1, #0x0]
    cmp r0, #0x0
    streq r5, [r1, #0x0]
    beq .L_022179c8
    mov r0, r5
    bl Actor_GetCollection
    mov r1, r5
    bl ActorCollection_QueueActorForRemoval
.L_022179c8:
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_022179d4: .word data_ov088_0221b928
.L_022179d8: .word data_020ed470
.L_022179dc: .word data_021056f0
.size func_ov088_022177e0, . - func_ov088_022177e0
