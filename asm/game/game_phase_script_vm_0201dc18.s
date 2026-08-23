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
.global func_0201dc18
func_0201dc18: ; 0x0201dc18
    ldr r2, L_0201dc34
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    bx lr
L_0201dc34: .word gRuntimePresentationListVTable


.size func_0201dc18, . - func_0201dc18
