.text
.extern gFrameTaskVTable
.extern data_020d41ec
.extern Heap_Free
.extern GameStringList_Clear

/* Matching lifecycle code; portable equivalents are in game_string_list.c. */
.global FrameTask_Construct
.type FrameTask_Construct, @function
FrameTask_Construct:
    ldr r2, base_vtable
    mov r1, #0
    str r2, [r0]
    str r1, [r0, #4]
    bx lr
base_vtable:
    .word gFrameTaskVTable
    .size FrameTask_Construct, .-FrameTask_Construct

.global FrameTask_Destroy
.type FrameTask_Destroy, @function
FrameTask_Destroy:
    bx lr
    .size FrameTask_Destroy, .-FrameTask_Destroy

.global FrameTask_DestroyAndFree
.type FrameTask_DestroyAndFree, @function
FrameTask_DestroyAndFree:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size FrameTask_DestroyAndFree, .-FrameTask_DestroyAndFree

.global FrameTask_DestroyBase
.type FrameTask_DestroyBase, @function
FrameTask_DestroyBase:
    bx lr
    .size FrameTask_DestroyBase, .-FrameTask_DestroyBase

.global FrameTask_UpdateNoop
.type FrameTask_UpdateNoop, @function
FrameTask_UpdateNoop:
    mov r0, #0
    bx lr
    .size FrameTask_UpdateNoop, .-FrameTask_UpdateNoop

.global GameStringList_Destroy
.type GameStringList_Destroy, @function
GameStringList_Destroy:
    stmdb sp!, {r4, lr}
    ldr r1, list_vtable
    mov r4, r0
    str r1, [r4]
    bl GameStringList_Clear
    mov r0, r4
    ldmia sp!, {r4, pc}
list_vtable:
    .word data_020d41ec
    .size GameStringList_Destroy, .-GameStringList_Destroy
