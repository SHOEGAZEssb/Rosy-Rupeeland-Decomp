; Matching retail form; see src/game/game_phase_resume_scene.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Free
.extern SceneManager_GetCurrent
.extern Scene_Destroy
.extern Scene_Init
.extern data_020d5594
.extern func_02002d54
.extern func_02002d74
.extern ActorDescriptorBatch_ApplyCategoryCallback
.extern gGameWork
.extern gSceneManager

    .global func_0200f878
func_0200f878: ; 0x0200f878
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl Scene_Init
    ldr r1, L_0200f8ac
    ldr r0, L_0200f8b0
    str r1, [r5, #0x0]
    str r4, [r5, #0x24]
    ldr r0, [r0, #0x0]
    ldr r1, L_0200f8b4
    bl GameWork_SetFlag
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_0200f8ac: .word data_020d5594
L_0200f8b0: .word gGameWork
L_0200f8b4: .word 0x3f3
    .size func_0200f878, . - func_0200f878

    .global func_0200f8b8
func_0200f8b8: ; 0x0200f8b8
    stmdb sp!, {r4, lr}
    ldr r1, L_0200f8e8
    mov r4, r0
    ldr r0, L_0200f8ec
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    ldr r1, L_0200f8f0
    bl GameWork_ClearFlag
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200f8e8: .word data_020d5594
L_0200f8ec: .word gGameWork
L_0200f8f0: .word 0x3f3
    .size func_0200f8b8, . - func_0200f8b8

    .global func_0200f8f4
func_0200f8f4: ; 0x0200f8f4
    stmdb sp!, {r4, lr}
    ldr r1, L_0200f92c
    mov r4, r0
    ldr r0, L_0200f930
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    ldr r1, L_0200f934
    bl GameWork_ClearFlag
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200f92c: .word data_020d5594
L_0200f930: .word gGameWork
L_0200f934: .word 0x3f3
    .size func_0200f8f4, . - func_0200f8f4

    .global func_0200f938
func_0200f938: ; 0x0200f938
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0200f960
    cmp r0, #0x1
    beq L_0200f98c
    cmp r0, #0x2
    beq L_0200f9bc
    b L_0200fa2c
L_0200f960:
    mov r0, #0x0
    bl ActorDescriptorBatch_ApplyCategoryCallback
    ldr r0, L_0200fa34
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
L_0200f98c:
    mov r0, #0x1
    bl ActorDescriptorBatch_ApplyCategoryCallback
    ldr r0, L_0200fa34
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b L_0200fa2c
L_0200f9bc:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    bne L_0200fa0c
    ldr r0, L_0200fa38
    ldr r1, L_0200fa3c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_0200f9f4
    ldr r0, L_0200fa38
    ldr r1, L_0200fa3c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    b L_0200fa0c
L_0200f9f4:
    mov r0, #0x1
    mov r1, #0x10
    bl func_02002d54
    mov r0, #0x1
    mov r1, #0x10
    bl func_02002d74
L_0200fa0c:
    cmp r4, #0x0
    beq L_0200fa24
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200fa24:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0200fa2c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0200fa34: .word gSceneManager
L_0200fa38: .word gGameWork
L_0200fa3c: .word 0x386
    .size func_0200f938, . - func_0200f938

