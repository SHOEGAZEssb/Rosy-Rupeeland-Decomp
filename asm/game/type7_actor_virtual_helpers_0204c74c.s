; Matching retail form; see src/game/type7_actor_virtual_helpers.c.
.extern SceneManager_GetCurrent
.extern gSceneManager
.extern func_02035518
.text
    .global func_0204c74c
func_0204c74c: ; 0x0204c74c
    stmdb sp!, {r3, lr}
    ldr r0, .L_0204c774
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    cmpne r0, #0x16
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_0204c774: .word gSceneManager
.size func_0204c74c, . - func_0204c74c

    .global func_0204c778
func_0204c778: ; 0x0204c778
    mov r0, #0x0
    bx lr
.size func_0204c778, . - func_0204c778

    .global func_0204c780
func_0204c780: ; 0x0204c780
    ldr ip, .L_0204c78c
    add r0, r0, #0x2a8
    bx ip
.L_0204c78c: .word func_02035518
.size func_0204c780, . - func_0204c780

    .global func_0204c790
func_0204c790: ; 0x0204c790
    mov r0, #0x80000
    bx lr
.size func_0204c790, . - func_0204c790

