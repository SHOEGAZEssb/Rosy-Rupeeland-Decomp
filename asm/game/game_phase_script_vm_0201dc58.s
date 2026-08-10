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
.extern func_0201dee0
.extern func_0201df64
.extern gRuntimePresentationListVTable
.extern gRuntimePresentationListNodeAllocationTag
.extern gRuntimePresentationAuxiliaryAllocationTag
.extern data_021052fc
.extern gHeapContext
.global func_0201dc58
func_0201dc58: ; 0x0201dc58
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b L_0201dc7c
L_0201dc68:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq L_0201dc78
    bl Heap_Free
L_0201dc78:
    mov r0, r4
L_0201dc7c:
    cmp r0, #0x0
    bne L_0201dc68
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}


.size func_0201dc58, . - func_0201dc58
