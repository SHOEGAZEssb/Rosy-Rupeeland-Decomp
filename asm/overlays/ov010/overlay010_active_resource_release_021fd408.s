    .text
    .extern Heap_Free
    .extern GraphicsResourceSetVariant_ReleaseHandles
    .extern GraphicsAnimationInstanceManager_DestroyInstance
    .extern Graphics3DResourceBinding_Destroy

/* Exact fallback; see src/overlays/ov010/overlay010_active_resource_release.c. */
    .global Overlay010_ReleaseActiveResource
Overlay010_ReleaseActiveResource: ; 0x021fd408
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x12c]
    cmp r4, #0x0
    beq L_021fd43c
    beq L_021fd430
    mov r0, r4
    bl Graphics3DResourceBinding_Destroy
    mov r0, r4
    bl Heap_Free
L_021fd430:
    mov r0, #0x0
    str r0, [r5, #0x12c]
    ldmia sp!, {r3, r4, r5, pc}
L_021fd43c:
    ldr r0, [r5, #0x88]
    ldr r1, [r5, #0x8c]
    bl GraphicsAnimationInstanceManager_DestroyInstance
    mov r1, #0x0
    add r0, r5, #0x7c
    str r1, [r5, #0x8c]
    bl GraphicsResourceSetVariant_ReleaseHandles
    ldmia sp!, {r3, r4, r5, pc}

    .size Overlay010_ReleaseActiveResource, . - Overlay010_ReleaseActiveResource
