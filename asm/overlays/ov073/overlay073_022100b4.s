.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov073_02210c04
.extern func_02003e20
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern GamePhaseRuntime_GetActorCollection
.extern ActorCollection_GetSpriteOwner
.extern func_020befec
.extern func_020bf1f8
.extern func_ov073_0220fd20
.extern func_ov073_0220ff28
.extern func_ov073_022102bc
.extern gHeapContext
.extern genrand_int32

.global func_ov073_022100b4
func_ov073_022100b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x3c
    mov r10, r0
    mov r4, r1
    mov r1, r2
    mov r2, r3
    ldr r3, [sp, #0x60]
    add r0, r10, #0x8
    str r4, [r10, #0x4]
    ldr r9, [sp, #0x70]
    bl VecFx32Object_InitComponents
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r10, #0x18
    bl VecFx32Object_InitComponents
    mov r2, #0x0
    str r2, [r10, #0x28]
    ldr r1, [sp, #0x78]
    strh r2, [r10, #0x2c]
    strh r1, [r10, #0x2e]
    ldr r0, [sp, #0x64]
    ldr r1, .L_022102b0
    str r0, [r10, #0x30]
    mov r0, #0x1000
    str r0, [r10, #0x34]
    str r2, [r10, #0x38]
    ldr r0, [sp, #0x74]
    ldr r3, .L_022102b4
    str r0, [r10, #0x3c]
    mov r0, r0, lsl #0x2
    mov r2, #0x4
    bl func_02003e20
    str r0, [r10, #0x0]
    add r0, sp, #0x4
    bl func_ov073_022102bc
    ldr r0, .L_022102b8
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    bl ActorCollection_GetSpriteOwner
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x4]
    mov r7, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x8]
    mov r1, #0x2
    str r0, [sp, #0xc]
    ldr r2, [r4, #0xc]
    ldr r0, [sp, #0x68]
    str r2, [sp, #0x10]
    str r1, [sp, #0x38]
    str r0, [sp, #0x34]
    str r7, [sp, #0x2c]
    str r7, [sp, #0x28]
    add r6, sp, #0x14
    mov r5, #0x6000
    mov r4, #0x48
    ldr r11, .L_022102b0
    b .L_0221027c
.L_022101a4:
    mov r0, r6
    add r1, r10, #0x8
    bl VecFx32Object_Assign
    bl genrand_int32
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldr r1, [sp, #0x18]
    sub r0, r0, #0x8000
    add r0, r1, r0
    str r0, [sp, #0x18]
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    sub r0, r1, #0x6000
    ldr r2, [sp, #0x1c]
    ldr r3, .L_022102b4
    add r0, r2, r0
    str r0, [sp, #0x1c]
    mov r0, r4
    mov r1, r11
    mov r2, #0x4
    bl Heap_Alloc
    movs r8, r0
    beq .L_02210238
    ldr r1, [r10, #0x3c]
    mov r0, #0x10000
    bl func_020befec
    mul r1, r0, r7
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp, #0x0]
    mov r0, r8
    add r1, r10, #0x8
    add r2, sp, #0x4
    mov r3, #0x1
    bl func_ov073_0220fd20
    mov r8, r0
.L_02210238:
    cmp r9, #0x0
    ldr r0, [r10, #0x0]
    str r8, [r0, r7, lsl #0x2]
    ldr r0, [r10, #0x0]
    ldr r0, [r0, r7, lsl #0x2]
    ldr r1, [r0, #0x4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    beq .L_02210278
    ldr r0, [r10, #0x0]
    mov r2, r7, lsl #0x1
    ldr r0, [r0, r7, lsl #0x2]
    mov r1, #0x6
    add r2, r2, #0x1
    bl func_ov073_0220ff28
.L_02210278:
    add r7, r7, #0x1
.L_0221027c:
    ldr r0, [r10, #0x3c]
    cmp r7, r0
    blt .L_022101a4
    cmp r9, #0x0
    movne r0, #0x1000
    strne r0, [r10, #0x38]
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    mov r0, r10
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022102b0: .word data_ov073_02210c04
.L_022102b4: .word gHeapContext
.L_022102b8: .word data_021052fc
.size func_ov073_022100b4, . - func_ov073_022100b4
