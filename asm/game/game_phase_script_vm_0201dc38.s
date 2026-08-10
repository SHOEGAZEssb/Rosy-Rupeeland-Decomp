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
.extern data_020d5e20
.extern data_020d5e08
.extern data_020d5e40
.extern data_021052fc
.extern gHeapContext
.global func_0201dc38
func_0201dc38: ; 0x0201dc38
    stmdb sp!, {r4, lr}
    ldr r1, L_0201dc54
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_0201dc58
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201dc54: .word data_020d5e20


.size func_0201dc38, . - func_0201dc38
