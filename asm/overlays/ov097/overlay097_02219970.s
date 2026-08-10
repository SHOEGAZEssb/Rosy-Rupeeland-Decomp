.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern data_021052fc
.extern data_ov097_0221a4c8
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorExtendedType2_InitializeTransformAndMotion
.extern func_020593dc
.extern func_ov097_022177e0
.extern gGameWork
.extern gSoundContext

.global func_ov097_02219970
func_ov097_02219970:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    movs r5, r1
    mov r6, r0
    mov r4, r2
    str r5, [r6, #0x2b0]
    beq .L_02219a90
    mov r1, #0x0
    add r0, sp, #0x8
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r2, sp, #0x8
    mov r0, r6
    add r1, r5, #0x18
    bl ActorExtendedType2_InitializeTransformAndMotion
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    mov r0, r6
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
    ldr r1, .L_02219a98
    mov r0, r6
    ldr r1, [r1, #0x0]
    ldr r2, [r0, #0x0]
    add r1, r1, #0x2000
    ldr r2, [r2, #0xd4]
    ldr r1, [r1, #0xea4]
    blx r2
    ldr r2, .L_02219a9c
    add r1, r5, #0x18
    ldr r3, [r2, #0x20]
    ldr r2, [r2, #0x24]
    add r0, r6, #0x18
    str r3, [r6, #0x218]
    str r2, [r6, #0x21c]
    ldr r2, [r6, #0x10]
    orr r2, r2, #0x1f0000
    str r2, [r6, #0x10]
    ldr r2, [r6, #0x14]
    bic r2, r2, #0x2000000
    str r2, [r6, #0x14]
    str r4, [r6, #0x2b4]
    bl VecFx32Object_Assign
    ldr r1, [r6, #0x24]
    ldr r0, .L_02219aa0
    add r1, r1, r4
    str r1, [r6, #0x24]
    ldr r0, [r0, #0x0]
    ldr r2, [r6, #0x2b8]
    mov r1, #0x0
    mov r3, #0x1
    bl func_ov097_022177e0
    mov r0, #0x10000
    ldr r1, [r6, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0xfe0
    orr r0, r0, #0xf000
    str r0, [r6, #0x5c]
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    add r1, r0, #0xed
    ldr r0, .L_02219aa4
    mov r3, r6
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    bl func_020593dc
.L_02219a90:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_02219a98: .word data_021052fc
.L_02219a9c: .word data_ov097_0221a4c8
.L_02219aa0: .word gGameWork
.L_02219aa4: .word gSoundContext
.size func_ov097_02219970, . - func_ov097_02219970
