.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern data_021052fc
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern ActorMotionAreaFollower_GetPosition
.extern Actor_SnapshotTransientState
.extern TrackedResourceActor_SpawnFromKey
.extern func_ov088_0221a98c
.extern gTouchPanelManager

.global Overlay088Actor_SnapshotTransientStateAndProcessDeferredTouch
Overlay088Actor_SnapshotTransientStateAndProcessDeferredTouch:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r4, r0
    bl Actor_SnapshotTransientState
    add r0, r4, #0x200
    ldrh r1, [r0, #0x1a]
    tst r1, #0x800
    beq .L_0221b4f8
    bic r1, r1, #0x800
    strh r1, [r0, #0x1a]
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    bne .L_0221b4f8
    add r0, sp, #0x10
    bl VecFx32Object_Init
    ldr r0, .L_0221b500
    ldr r1, .L_0221b504
    ldr r0, [r0, #0x0]
    ldr r5, [r1, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r1, .L_0221b500
    ldrh r3, [r5, #0x40]
    ldr r2, .L_0221b504
    ldr r1, [r1, #0x0]
    ldr r5, [r0, #0x4]
    add r0, r1, #0x3bc
    add r1, r5, r3, lsl #0xc
    ldr r5, [r2, #0x0]
    str r1, [sp, #0x14]
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r3, [r0, #0x8]
    ldrh r2, [r5, #0x42]
    ldr r1, [sp, #0x1c]
    add r0, sp, #0x0
    add r3, r3, r2, lsl #0xc
    add r2, r1, #0x10000
    mov r1, r4
    str r3, [sp, #0x18]
    str r2, [sp, #0x1c]
    bl func_ov088_0221a98c
    ldr r0, [r4, #0x238]
    add r1, sp, #0x0
    ldrsh r0, [r0, #0x2c]
    add r2, sp, #0x10
    bl TrackedResourceActor_SpawnFromKey
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_0221b4f8:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_0221b500: .word data_021052fc
.L_0221b504: .word gTouchPanelManager
.size Overlay088Actor_SnapshotTransientStateAndProcessDeferredTouch, . - Overlay088Actor_SnapshotTransientStateAndProcessDeferredTouch
