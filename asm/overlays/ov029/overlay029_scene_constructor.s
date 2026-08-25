.text

/* Exact fallback; see src/overlays/ov029/overlay029_scene_constructor.c. */
.extern data_020f4e18
.extern gGamePhaseRuntime
.extern data_ov029_021fec30
.extern data_ov029_021fecfc
.extern data_ov029_021fed10
.extern data_ov029_021fed18
.extern RuntimePresentationManager_BroadcastSlot1C
.extern GraphicsArchive_AcquirePaletteResource
.extern RecordDescriptor_GetMessage
.extern SceneInputBase_Init
.extern TitleCharacterResourceCollection_Init
.extern TitleCharacterResourceCollection_Append
.extern TitleScrollValue_Init
.extern TitleDialog_Init
.extern func_02092f88
.extern func_020afd0c
.extern func_ov029_021fce00
.extern func_ov029_021fce34
.extern func_ov029_021fce4c
.extern func_ov029_021fd464
.extern func_ov029_021fd578
.extern func_ov045_0220b83c
.extern func_ov045_0220c128
.extern func_ov045_0220c48c
.extern GameWork_ClearFlag
.extern gDebugFont
.extern genrand_int32
.extern gGameWork
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov029_021fce74
func_ov029_021fce74:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    mov r4, r1
    bl SceneInputBase_Init
    ldr r1, L_021fd134
    add r0, r5, #0x78
    str r1, [r5, #0x0]
    bl TitleCharacterResourceCollection_Init
    mov r1, #0x0
    add r0, r5, #0xec
    str r1, [r5, #0xe4]
    bl TitleScrollValue_Init
    ldr r0, L_021fd138
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_BroadcastSlot1C
    bl genrand_int32
    ldr r1, L_021fd13c
    str r0, [r5, #0xe4]
    ldr r0, [r1, #0x0]
    ldr r1, L_021fd140
    bl GameWork_ClearFlag
    str r4, [r5, #0x68]
    mov r1, r4
    add r0, sp, #0x4
    bl func_ov029_021fce00
    ldr r0, [sp, #0x8]
    mov r1, #0x0
    ldr r2, [r0, #0xc]
    sub r0, r1, #0x1
    and r2, r2, #0xff
    str r2, [r5, #0x54]
    ldr r2, [sp, #0x8]
    ldrh r2, [r2, #0x4]
    str r2, [r5, #0x58]
    ldr r2, [sp, #0x8]
    ldr r2, [r2, #0x10]
    str r2, [r5, #0x5c]
    ldr r2, [sp, #0x8]
    ldr r2, [r2, #0x18]
    str r2, [r5, #0x60]
    str r1, [r5, #0x6c]
    str r0, [r5, #0x70]
    str r1, [r5, #0x74]
    ldr r0, [r5, #0x5c]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b L_021fcf88
L_021fcf40: ; jump table
    b L_021fcf60 ; case 0
    b L_021fcf70 ; case 1
    b L_021fcf60 ; case 2
    b L_021fcf70 ; case 3
    b L_021fcf70 ; case 4
    b L_021fcf60 ; case 5
    b L_021fcf70 ; case 6
    b L_021fcf84 ; case 7
L_021fcf60:
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x14]
    str r0, [r5, #0x64]
    b L_021fcf88
L_021fcf70:
    ldr r0, L_021fd13c
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x7cc]
    str r0, [r5, #0x64]
    b L_021fcf88
L_021fcf84:
    str r1, [r5, #0x64]
L_021fcf88:
    ldr r0, L_021fd144
    ldr r1, L_021fd148
    ldr r0, [r0, #0x0]
    bl GraphicsArchive_AcquirePaletteResource
    str r0, [r5, #0xe8]
    ldr r1, L_021fd14c
    add r0, r5, #0x78
    bl TitleCharacterResourceCollection_Append
    ldr r1, L_021fd150
    add r0, r5, #0x78
    bl TitleCharacterResourceCollection_Append
    mov r0, r5
    bl func_ov029_021fd464
    mov r0, r5
    bl func_ov029_021fd578
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0x58]
    mov r2, #0x0
    bl func_ov045_0220c48c ; func_ov049_0220c48c
    str r0, [r5, #0xa4]
    ldr r0, [r0, #0x30]
    mov r1, #0x0
    cmp r0, #0x0
    ldrne r0, [r5, #0x4c]
    orrne r0, r0, #0x2
    strne r0, [r5, #0x4c]
    add r0, sp, #0x4
    bl RecordDescriptor_GetMessage
    ldrh r2, [r0, #0x0]
    ldr r1, L_021fd154
    cmp r2, r1
    bne L_021fd014
    ldrh r1, [r0, #0x2]
    ldr r0, [r5, #0xa4]
    bl func_ov045_0220c128
L_021fd014:
    ldr r0, L_021fd158
    mov r3, #0x8
    mov r1, #0x4
    mov r2, #0x18
    str r3, [sp, #0x0]
    bl func_020afd0c
    mov r3, #0x8
    ldr r0, L_021fd15c
    mov r1, #0x4
    mov r2, #0x18
    str r3, [sp, #0x0]
    bl func_020afd0c
    mov r2, #0x0
    mov r1, r2
L_021fd04c:
    add r0, r5, r2, lsl #0x1
    add r2, r2, #0x1
    strh r1, [r0, #0xb0]
    cmp r2, #0x10
    blt L_021fd04c
    ldr r1, L_021fd160
    ldr r3, L_021fd164
    mov r0, #0xec
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd08c
    ldr r1, L_021fd168
    ldr r2, [r5, #0x78]
    ldr r1, [r1, #0x0]
    bl TitleDialog_Init
L_021fd08c:
    str r0, [r5, #0x9c]
    mov r0, #0x84
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x9c]
    mov r1, #0x50
    mov r2, #0x28
    mov r3, #0xa8
    bl func_ov029_021fce34
    ldr r0, [r5, #0x9c]
    mvn r1, #0x1
    str r1, [r0, #0xbc]
    ldr r1, [r5, #0x9c]
    mov r0, #0xd
    str r0, [r1, #0xd0]
    mov r0, #0x0
    str r0, [r1, #0xd4]
    ldr r0, [r5, #0x9c]
    add r2, r5, #0xb0
    mov r1, #0x6
    bl func_02092f88
    mov r2, #0x0
    str r2, [r5, #0xa8]
    ldr r1, L_021fd16c
    ldr r3, L_021fd164
    mov r0, #0x70
    str r2, [r5, #0xa0]
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd108
    bl func_ov045_0220b83c
L_021fd108:
    str r0, [r5, #0xd0]
    ldr r0, [r5, #0x20]
    ldr r1, L_021fd170
    orr r0, r0, #0x400
    str r0, [r5, #0x20]
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    mov r0, r5
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
L_021fd134: .word data_ov029_021fecfc
L_021fd138: .word gGamePhaseRuntime
L_021fd13c: .word gGameWork
L_021fd140: .word 0x38a
L_021fd144: .word data_020f4e18
L_021fd148: .word 0xc007
L_021fd14c: .word 0x7007
L_021fd150: .word 0x7005
L_021fd154: .word 0xee0e
L_021fd158: .word 0x4000050
L_021fd15c: .word 0x4001050
L_021fd160: .word data_ov029_021fed10
L_021fd164: .word gHeapContext
L_021fd168: .word gDebugFont
L_021fd16c: .word data_ov029_021fed18
L_021fd170: .word data_ov029_021fec30
.size func_ov029_021fce74, .-func_ov029_021fce74
