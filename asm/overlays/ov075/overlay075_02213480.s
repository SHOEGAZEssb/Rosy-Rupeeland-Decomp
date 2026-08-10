.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_021052fc
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern TrackedResourceActor_SpawnFromKey

.global func_ov075_02213480
func_ov075_02213480:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x2a0]
    cmp r0, #0x0
    beq .L_0221351c
    ldr r0, [r4, #0x10]
    tst r0, #0x4
    beq .L_0221351c
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x14
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne .L_0221351c
    add r0, sp, #0x0
    add r1, r4, #0x18
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0xc]
    ldr r0, .L_02213524
    sub r1, r1, #0x4000
    ldr r0, [r0, #0x0]
    str r1, [sp, #0xc]
    add r0, r0, #0x2000
    ldr r2, [r0, #0xea4]
    ldr r1, [r4, #0x2a0]
    add r2, r2, #0x18
    ldrsh r0, [r1, #0x0]
    add r1, sp, #0x0
    bl TrackedResourceActor_SpawnFromKey
    mov r1, #0x10000
    ldr r2, [r0, #0x5c]
    rsb r1, r1, #0x0
    and r1, r2, r1
    orr r1, r1, #0x3e8
    orr r1, r1, #0xfc00
    str r1, [r0, #0x5c]
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_0221351c:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_02213524: .word data_021052fc
.size func_ov075_02213480, . - func_ov075_02213480
