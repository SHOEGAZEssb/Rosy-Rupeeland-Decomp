.text
.extern AnimationResourceState_ReplaceResources
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern func_020957f0
.extern GraphicsSpriteGroup_Destroy
.extern AnimationResourceState_ReleaseResources
.extern func_020958d8
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern data_020f4e18
.extern data_020f4e14

    .global func_ov043_0220bc2c
func_ov043_0220bc2c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r2, #0x18
    str r2, [sp, #0x0]
    ldr r1, .L_0220bcec
    mov r4, r0
    ldr r1, [r1, #0x0]
    add r0, r4, #0x80
    mov r2, #0x16
    mov r3, #0x17
    bl AnimationResourceState_ReplaceResources
    ldr r0, .L_0220bcf0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    add r1, r4, #0x80
    mov r2, #0x1
    str r0, [r4, #0x8c]
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r2, #0x0
    mov r1, r0
    str r2, [sp, #0x0]
    add r0, r4, #0x13c
    mov r3, #0x2
    bl func_020957f0
    ldr r0, [r4, #0x8c]
    add r1, r4, #0x80
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0x1e8
    mov r2, #0x1
    mov r3, #0x2
    bl func_020957f0
    ldr r0, [r4, #0x8c]
    add r1, r4, #0x80
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r2, #0x2
    mov r1, r0
    add r0, r4, #0x90
    mov r3, r2
    bl func_020957f0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0220bcec: .word data_020f4e18
.L_0220bcf0: .word data_020f4e14
.size func_ov043_0220bc2c, . - func_ov043_0220bc2c

    .global func_ov043_0220bcf4
func_ov043_0220bcf4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8c]
    bl GraphicsSpriteGroup_Destroy
    mov r1, #0x0
    str r1, [r4, #0x8c]
    str r1, [r4, #0x1d8]
    str r1, [r4, #0x284]
    add r0, r4, #0x80
    str r1, [r4, #0x12c]
    bl AnimationResourceState_ReleaseResources
    ldmia sp!, {r4, pc}
.size func_ov043_0220bcf4, . - func_ov043_0220bcf4

    .global Overlay043_UpdatePresentationResources
Overlay043_UpdatePresentationResources:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x13c
    bl func_020958d8
    add r0, r4, #0x1e8
    bl func_020958d8
    add r0, r4, #0x90
    bl func_020958d8
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
.size Overlay043_UpdatePresentationResources, . - Overlay043_UpdatePresentationResources

