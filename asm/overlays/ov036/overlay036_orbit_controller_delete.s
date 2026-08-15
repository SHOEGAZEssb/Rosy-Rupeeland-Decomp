.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_controller_destroy.c for documented portable C. */

    .extern PresentationList_DeleteAll
    .extern Graphics3DResourceOwner_RemoveManager
    .extern GraphicsResourceSetVariant_Destroy
    .extern Heap_Free
    .extern data_ov036_02206060
    .extern data_ov036_02205eac

    .global func_ov036_0220094c
func_ov036_0220094c:
    stmdb sp!, {r4, lr}
    ldr r1, L_022009b0
    mov r4, r0
    str r1, [r4, #0x0]
    add r0, r4, #0x11c
    bl PresentationList_DeleteAll
    ldr r1, [r4, #0x100]
    ldr r0, [r1, #0x0]
    bl Graphics3DResourceOwner_RemoveManager
    ldr r1, L_022009b4
    add r0, r4, #0x11c
    str r1, [r4, #0x11c]
    bl PresentationList_DeleteAll
    add r0, r4, #0xf4
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xe8
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xdc
    bl GraphicsResourceSetVariant_Destroy
    add r0, r4, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_022009b0: .word data_ov036_02206060
L_022009b4: .word data_ov036_02205eac
    .size func_ov036_0220094c, .-func_ov036_0220094c

