.text

/* Exact fallback; see src/overlays/ov032/overlay032_runtime_setup.c for documented portable C. */
.extern GraphicsResourceSet_Destroy
.extern __destroy_arr
.extern data_020f4e14
.extern data_020f4e18
.extern Sound_SetModalEnvelopeEnabled
.extern Sound_ReleaseGroup
.extern GraphicsArchive_ReleaseResourceE4
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern GraphicsBankStateSnapshot_Destroy
.extern func_ov032_021fce00
.extern Overlay032Child_Destroy
.extern gDebugFont
.extern gSoundContext

    .global func_ov032_021fd7f8
func_ov032_021fd7f8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r3, #0x1e
    ldr r2, L_021fd908
    mov r1, #0x0
    str r3, [sp, #0x0]
    mov r4, r0
    ldr r0, [r2, #0x0]
    mov r2, r1
    mov r3, #0x14
    bl Sound_SetModalEnvelopeEnabled
    ldr r0, L_021fd908
    mov r1, #0x81
    ldr r0, [r0, #0x0]
    bl Sound_ReleaseGroup
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq L_021fd84c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd84c:
    ldr r0, L_021fd90c
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, L_021fd910
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, L_021fd914
    ldr r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_ReleaseResourceE4
    add r0, r4, #0x318
    add r0, r0, #0xc00
    bl GraphicsResourceSet_Destroy
    add r0, r4, #0x44
    add r0, r0, #0xc00
    mov r1, #0x5
    mov r2, #0x6c
    ldr r3, L_021fd918
    bl __destroy_arr
    add r0, r4, #0x3e8
    add r0, r0, #0x800
    bl GraphicsBankStateSnapshot_Destroy
    add r0, r4, #0x344
    add r0, r0, #0x800
    bl GraphicsResourceSet_Destroy
    add r0, r4, #0x334
    mov r1, #0x28
    mov r2, #0x30
    ldr r3, L_021fd91c
    bl __destroy_arr
    add r0, r4, #0x58
    bl AnimationResourceState_Destroy
    add r0, r4, #0x4c
    bl AnimationResourceState_Destroy
    add r0, r4, #0x40
    bl AnimationResourceState_Destroy
    add r0, r4, #0x34
    bl AnimationResourceState_Destroy
    add r0, r4, #0x28
    bl AnimationResourceState_Destroy
    add r0, r4, #0x1c
    bl AnimationResourceState_Destroy
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fd908: .word gSoundContext
L_021fd90c: .word gDebugFont
L_021fd910: .word data_020f4e14
L_021fd914: .word data_020f4e18
L_021fd918: .word Overlay032Child_Destroy
L_021fd91c: .word func_ov032_021fce00
.size func_ov032_021fd7f8, .-func_ov032_021fd7f8

