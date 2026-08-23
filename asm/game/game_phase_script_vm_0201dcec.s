; Matching retail form; see src/game/runtime_presentation_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern func_020a1f80
.extern func_020a20d4
.extern func_020a214c
.extern ActorMotionAreaFollower_GetPosition
.extern FieldEffectList_Init
.extern FieldEffectList_Clear
.extern FieldEffectList_RemoveNode
.extern FieldEffectList_Append
.extern RuntimePresentationManager_DestroyAllEffects
.extern gFieldEffectListVtable
.extern gFieldEffectListNodeAllocationTag
.extern gGraphics3dPresentationAllocationTag
.extern data_021052fc
.extern gHeapContext
.global RuntimePresentationManager_Update
RuntimePresentationManager_Update: ; 0x0201dcec
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r4, r1
    ldr r6, [r5, #0x4]
    b L_0201dd44
L_0201dd00:
    ldr r7, [r6, #0x8]
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq L_0201dd40
    cmp r7, #0x0
    beq L_0201dd34
    mov r0, r7
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201dd34:
    mov r0, r5
    mov r1, r6
    bl FieldEffectList_RemoveNode
L_0201dd40:
    ldr r6, [r6, #0x0]
L_0201dd44:
    cmp r6, #0x0
    bne L_0201dd00
    ldr r7, [r5, #0x14]
    b L_0201dd98
L_0201dd54:
    ldr r6, [r7, #0x8]
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq L_0201dd94
    cmp r6, #0x0
    beq L_0201dd88
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201dd88:
    mov r1, r7
    add r0, r5, #0x10
    bl FieldEffectList_RemoveNode
L_0201dd94:
    ldr r7, [r7, #0x0]
L_0201dd98:
    cmp r7, #0x0
    bne L_0201dd54
    ldr r0, [r5, #0x20]
    cmp r0, #0x0
    ldrneb r0, [r0, #0x50a]
    cmpne r0, #0x0
    beq L_0201ddd8
    ldr r0, L_0201dde0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    ldr r0, [r5, #0x20]
    mov r2, r4
    bl func_020a214c
L_0201ddd8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201dde0: .word data_021052fc


.size RuntimePresentationManager_Update, . - RuntimePresentationManager_Update
