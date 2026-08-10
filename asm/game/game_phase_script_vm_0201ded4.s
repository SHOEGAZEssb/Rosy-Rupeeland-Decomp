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
.global func_0201ded4
func_0201ded4: ; 0x0201ded4
    ldr ip, L_0201dedc
    bx ip
L_0201dedc: .word func_0201dee0


.size func_0201ded4, . - func_0201ded4
