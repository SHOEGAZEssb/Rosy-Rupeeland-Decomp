.text

/* Exact fallback; see src/overlays/ov031/overlay031_scene_teardown.c for documented portable C. */
.extern data_ov031_021fe774
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.extern TitleCharacterResourceCollection_Destroy
.extern Heap_Free


    .global func_ov031_021fdb60
func_ov031_021fdb60:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fdbcc
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x548]
    cmp r0, #0x0
    beq L_021fdb94
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_021fdb94:
    ldr r0, [r4, #0x98]
    cmp r0, #0x0
    beq L_021fdbac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdbac:
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x70
    bl TitleCharacterResourceCollection_Destroy
    add r0, r4, #0x5c
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fdbcc: .word data_ov031_021fe774
.size func_ov031_021fdb60, .-func_ov031_021fdb60
    .global func_ov031_021fdbd0
func_ov031_021fdbd0:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fdc44
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x548]
    cmp r0, #0x0
    beq L_021fdc04
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
L_021fdc04:
    ldr r0, [r4, #0x98]
    cmp r0, #0x0
    beq L_021fdc1c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fdc1c:
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x70
    bl TitleCharacterResourceCollection_Destroy
    add r0, r4, #0x5c
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fdc44: .word data_ov031_021fe774
.size func_ov031_021fdbd0, .-func_ov031_021fdbd0
