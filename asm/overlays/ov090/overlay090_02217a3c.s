.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_actor_lifecycle.c.
.extern Heap_Alloc
.extern data_ov090_0221cc00
.extern AnimationResource_Init
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern func_0204d3d8
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState
.extern func_ov090_0221ad64
.extern gHeapContext

.global func_ov090_02217a3c
func_ov090_02217a3c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_0204d3d8
    ldr r1, .L_02217b58
    mov r0, r4
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_ov090_0221ad64
    ldr r1, .L_02217b5c
    ldr r3, .L_02217b60
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217a88
    ldr r1, .L_02217b64
    ldr r2, .L_02217b68
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_02217a88:
    mov r5, r0
    str r0, [r4, #0x240]
    mov r0, r4
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r1, #0x1
    str r1, [sp, #0x0]
    ldmib r5, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0x23c]
    mov r1, #0x31
    strh r1, [r0, #0x2c]
    mov r1, #0xb2
    strh r1, [r0, #0x2e]
    ldr r0, [r4, #0x23c]
    mov r1, #0x0
    strb r1, [r0, #0x3a]
    ldr r2, [r4, #0x23c]
    mov r1, #0x6
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x12
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x23c]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, .L_02217b5c
    ldr r3, .L_02217b60
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217b14
    ldr r1, .L_02217b6c
    sub r2, r1, #0x318
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_02217b14:
    mov r5, r0
    str r0, [r4, #0x24c]
    mov r0, r4
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r5, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    str r0, [r4, #0x248]
    mov r1, #0x0
    strb r1, [r0, #0x3a]
    ldr r1, [r4, #0x248]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x12
    strh r0, [r1, #0x24]
    ldmia sp!, {r3, r4, r5, pc}
.L_02217b58: .word 0x1026
.L_02217b5c: .word data_ov090_0221cc00
.L_02217b60: .word gHeapContext
.L_02217b64: .word 0x138a
.L_02217b68: .word 0x1078
.L_02217b6c: .word 0x1390
.size func_ov090_02217a3c, . - func_ov090_02217a3c
