; Matching retail form; see src/game/actor_runtime_scene_teardown.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200b8cc
.extern func_02007f0c
.extern func_02032cac
.extern GameWork_TestFlag
.extern func_0204b680
.extern func_02038aac
.extern GameWork_ClearFlag
.extern func_020337d4
.extern func_0202d358
.extern func_02030b58
.extern Scene_Destroy
.extern Heap_Free
.extern data_020d448c
.extern data_021052fc
.extern gGameWork
.global func_0200b56c
func_0200b56c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_0200b6b0
    mov r5, r0
    str r1, [r5, #0x0]
    bl func_0200b8cc
    ldr r0, L_0200b6b4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r4, [r0, #0xe7c]
    mov r1, #0x0
    mov r0, r4
    bl func_02032cac
    ldr r0, L_0200b6b8
    mov r1, #0x3ec
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r0, [r4, #0x230]
    orrne r0, r0, #0x4
    strne r0, [r4, #0x230]
    ldr r1, [r4, #0x10]
    ldr r0, L_0200b6b4
    bic r1, r1, #0x1000000
    bic r1, r1, #0x8
    str r1, [r4, #0x10]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq L_0200b5f0
    bl func_0204b680
L_0200b5f0:
    ldr r0, L_0200b6b8
    ldr r1, L_0200b6bc
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200b638
    ldr r0, L_0200b6b8
    ldr r1, L_0200b6c0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200b638
    ldr r2, [r4, #0x54]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x20
    strh r1, [r2, #0x24]
    bl func_02038aac
L_0200b638:
    ldr r0, L_0200b6b8
    ldr r1, L_0200b6c0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_0200b6b8
    mov r1, #0x410
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r4, [r5, #0x24]
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x3
    ldreqh r0, [r4, #0x4e]
    cmpeq r0, #0x2
    bne L_0200b680
    mov r0, r4
    bl func_020337d4
    mov r1, r4
    bl func_0202d358
L_0200b680:
    ldr r0, L_0200b6b4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r1, #0x1
    bl func_02030b58
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_0200b6b0: .word data_020d448c
L_0200b6b4: .word data_021052fc
L_0200b6b8: .word gGameWork
L_0200b6bc: .word 0x3f3
L_0200b6c0: .word 0x403
.size func_0200b56c, . - func_0200b56c

