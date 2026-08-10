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
.global func_0201de4c
func_0201de4c: ; 0x0201de4c
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x14]
    b L_0201de7c
L_0201de58:
    ldr r0, [r4, #0x8]
    ldr r1, [r0, #0x4]
    mov r1, r1, lsl #0x1e
    movs r1, r1, asr #0x1f
    beq L_0201de78
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
L_0201de78:
    ldr r4, [r4, #0x0]
L_0201de7c:
    cmp r4, #0x0
    bne L_0201de58
    ldmia sp!, {r4, pc}


.size func_0201de4c, . - func_0201de4c
