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
.global func_0201dc98
func_0201dc98: ; 0x0201dc98
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_0201df64
    ldr r4, [r5, #0x20]
    cmp r4, #0x0
    beq L_0201dcc0
    mov r0, r4
    bl func_020a20d4
    mov r0, r4
    bl Heap_Free
L_0201dcc0:
    ldr r1, L_0201dce8
    add r0, r5, #0x10
    str r1, [r5, #0x10]
    bl func_0201dc58
    ldr r1, L_0201dce8
    mov r0, r5
    str r1, [r5, #0x0]
    bl func_0201dc58
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_0201dce8: .word gRuntimePresentationListVTable


.size func_0201dc98, . - func_0201dc98
