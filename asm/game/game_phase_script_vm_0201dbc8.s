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
.global func_0201dbc8
func_0201dbc8: ; 0x0201dbc8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201dc18
    add r0, r4, #0x10
    bl func_0201dc18
    ldr r0, L_0201dc0c
    ldr r1, L_0201dc10
    ldr r3, L_0201dc14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201dc00
    mov r1, #0x1
    bl func_020a1f80
L_0201dc00:
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201dc0c: .word 0x50c
L_0201dc10: .word gRuntimePresentationAuxiliaryAllocationTag
L_0201dc14: .word gHeapContext


.size func_0201dbc8, . - func_0201dbc8
