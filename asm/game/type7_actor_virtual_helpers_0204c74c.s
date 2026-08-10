; Matching retail form; see src/game/type7_actor_virtual_helpers.c.
.extern SceneManager_GetCurrent
.extern gSceneManager
.extern AttachmentController_SetEnabled
.text
    .global Type7Actor_IsInteractionSceneActive
Type7Actor_IsInteractionSceneActive: ; 0x0204c74c
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
.size Type7Actor_IsInteractionSceneActive, . - Type7Actor_IsInteractionSceneActive

    .global Type7Actor_ReturnZero
Type7Actor_ReturnZero: ; 0x0204c778
    mov r0, #0x0
    bx lr
.size Type7Actor_ReturnZero, . - Type7Actor_ReturnZero

    .global Type7Actor_SetAttachmentControllerEnabled
Type7Actor_SetAttachmentControllerEnabled: ; 0x0204c780
    ldr ip, .L_0204c78c
    add r0, r0, #0x2a8
    bx ip
.L_0204c78c: .word AttachmentController_SetEnabled
.size Type7Actor_SetAttachmentControllerEnabled, . - Type7Actor_SetAttachmentControllerEnabled

    .global Type7Actor_ReturnFlag80000
Type7Actor_ReturnFlag80000: ; 0x0204c790
    mov r0, #0x80000
    bx lr
.size Type7Actor_ReturnFlag80000, . - Type7Actor_ReturnFlag80000

