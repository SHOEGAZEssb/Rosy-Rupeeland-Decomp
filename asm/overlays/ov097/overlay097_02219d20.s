.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_ov097_0221aaa4
.extern ActorCollection_FindActorByDescriptorValue
.extern Actor_GetCollection
.extern TrackedResourceActorType28_InitBase
.extern func_ov097_022177e0
.extern func_ov097_02217fd8
.extern func_ov097_02219970
.extern gGameWork

.global func_ov097_02219d20
func_ov097_02219d20:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    bl TrackedResourceActorType28_InitBase
    ldr r0, .L_02219e44
    mov r6, #0x0
    str r0, [r4, #0x0]
    str r6, [r4, #0x200]
    ldr r0, .L_02219e48
    str r6, [r4, #0x204]
    ldr r0, [r0, #0x0]
    mov r1, r6
    mov r2, #0x4
    bl func_ov097_02217fd8
    ldr r1, .L_02219e48
    mov r5, r0
    ldr r0, [r1, #0x0]
    mov r1, r6
    mov r2, #0x5
    bl func_ov097_02217fd8
    cmp r5, #0x2
    cmpne r0, #0x2
    moveq r6, #0x1
    beq .L_02219dc0
    cmp r5, #0x0
    cmpne r0, #0x0
    bne .L_02219dc0
    ldr r0, .L_02219e48
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl func_ov097_02217fd8
    cmp r0, #0x0
    ble .L_02219dc0
    ldr r1, .L_02219e48
    sub r3, r0, #0x1
    ldr r0, [r1, #0x0]
    mov r1, #0x0
    mov r2, #0xc
    mov r6, #0x1
    bl func_ov097_022177e0
.L_02219dc0:
    cmp r6, #0x0
    beq .L_02219e3c
    mov r7, #0x0
    mov r6, r7
    ldr r5, .L_02219e48
    b .L_02219e34
.L_02219dd8:
    ldr r0, [r5, #0x0]
    mov r1, r6
    add r2, r7, #0x6
    bl func_ov097_02217fd8
    cmp r0, #0x0
    bne .L_02219e30
    mov r0, r4
    bl Actor_GetCollection
    ldr r1, .L_02219e48
    mov r5, r0
    ldr r0, [r1, #0x0]
    add r2, r7, #0x9
    mov r1, #0x0
    bl func_ov097_02217fd8
    mov r1, r0
    mov r0, r5
    bl ActorCollection_FindActorByDescriptorValue
    mov r1, r4
    mov r2, #0x19000
    str r0, [r4, #0x204]
    bl func_ov097_02219970
    b .L_02219e3c
.L_02219e30:
    add r7, r7, #0x1
.L_02219e34:
    cmp r7, #0x3
    blt .L_02219dd8
.L_02219e3c:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02219e44: .word data_ov097_0221aaa4
.L_02219e48: .word gGameWork
.size func_ov097_02219d20, . - func_ov097_02219d20
