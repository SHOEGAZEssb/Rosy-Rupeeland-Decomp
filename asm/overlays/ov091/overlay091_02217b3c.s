.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern GameWork_SetFlag
.extern Heap_Free
.extern data_021052fc
.extern gActorCategory1DescriptorTable
.extern data_ov091_02218cd0
.extern VecFx32Object_Destroy
.extern ActorMotion_BindActor
.extern ActorMotionAreaFollower_BindActor
.extern ActorCollection_SpawnDescriptorsBySelector
.extern Actor_SetActive
.extern Actor_GetCollection
.extern func_0204d570
.extern GraphicsSpriteState_ReleaseFromGroup
.extern gGameWork

.global func_ov091_02217b3c
func_ov091_02217b3c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_02217cd0
    mov r5, r0
    ldr r0, .L_02217cd4
    str r1, [r5, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    cmp r4, #0x0
    beq .L_02217c4c
    ldr r1, [r4, #0x230]
    ldr r0, .L_02217cd8
    orr r1, r1, #0x4
    str r1, [r4, #0x230]
    ldr r2, [r4, #0xd0]
    mov r1, #0x3ec
    bic r2, r2, #0x40000
    str r2, [r4, #0xd0]
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_02217cd4
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_BindActor
    ldr r0, .L_02217cd4
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_BindActor
    ldr r0, [r5, #0x238]
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r5, #0x234]
    cmp r0, #0x0
    beq .L_02217bdc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217bdc:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xd0]
    blx r1
    cmp r0, #0x4
    bne .L_02217c40
    ldr r1, [r5, #0x1f4]
    mov r0, r5
    ldr r2, [r1, #0x54]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x10
    strh r1, [r2, #0x24]
    ldr r2, [r5, #0x1f4]
    ldr r1, [r2, #0x14]
    orr r1, r1, #0x2
    str r1, [r2, #0x14]
    ldr r2, [r5, #0x1f4]
    ldr r1, [r2, #0x14]
    orr r1, r1, #0x4
    str r1, [r2, #0x14]
    bl Actor_GetCollection
    ldr r1, .L_02217cdc
    mvn r2, #0x0
    ldr r1, [r1, #0x0]
    bl ActorCollection_SpawnDescriptorsBySelector
.L_02217c40:
    mov r0, r4
    mov r1, #0x0
    bl Actor_SetActive
.L_02217c4c:
    ldr r0, .L_02217cd4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_02217c6c
    mov r1, #0x0
    bl Actor_SetActive
.L_02217c6c:
    ldr r0, [r5, #0x1f4]
    mov r1, #0x0
    bl Actor_SetActive
    ldr r0, [r5, #0x1f0]
    mov r1, #0x0
    bl Actor_SetActive
    mov r6, #0x0
    mov r4, r6
.L_02217c8c:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0x1f8]
    mov r1, r4
    bl Actor_SetActive
    add r6, r6, #0x1
    cmp r6, #0x6
    blt .L_02217c8c
    add r0, r5, #0x224
    bl VecFx32Object_Destroy
    add r0, r5, #0x210
    bl VecFx32Object_Destroy
    mov r0, r5
    bl func_0204d570
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
.L_02217cd0: .word data_ov091_02218cd0
.L_02217cd4: .word data_021052fc
.L_02217cd8: .word gGameWork
.L_02217cdc: .word gActorCategory1DescriptorTable
.size func_ov091_02217b3c, . - func_ov091_02217b3c
