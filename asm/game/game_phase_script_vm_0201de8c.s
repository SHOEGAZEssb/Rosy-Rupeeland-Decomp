; Matching retail form; see src/game/runtime_presentation_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern func_020a1f80
.extern func_020a20d4
.extern func_020a214c
.extern ActorMotionAreaFollower_GetPosition
.extern func_0201dc18
.extern func_0201dc58
.extern func_0201dde4
.extern FieldEffectList_Append
.extern func_0201df64
.extern gRuntimePresentationListVTable
.extern gRuntimePresentationListNodeAllocationTag
.extern gRuntimePresentationAuxiliaryAllocationTag
.extern data_021052fc
.extern gHeapContext
.global func_0201de8c
func_0201de8c: ; 0x0201de8c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r4, [r0, #0x14]
    b L_0201dec4
L_0201de9c:
    ldr r0, [r4, #0x8]
    ldr r1, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    movs r1, r1, asr #0x1f
    beq L_0201dec0
    ldr r2, [r0, #0x0]
    mov r1, r5
    ldr r2, [r2, #0x10]
    blx r2
L_0201dec0:
    ldr r4, [r4, #0x0]
L_0201dec4:
    cmp r4, #0x0
    bne L_0201de9c
    ldmia sp!, {r3, r4, r5, pc}


.size func_0201de8c, . - func_0201de8c
