.text

/* Exact fallback; see src/overlays/ov032/overlay032_dialog_children.c for documented portable C. */
.extern AnimationResourceState_ReleaseResources
.extern func_ov032_0220147c

    .global func_ov032_021fe8a0
func_ov032_021fe8a0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    add r0, r0, #0x44
    mov r6, #0x0
    add r5, r0, #0xc00
    mov r4, #0x6c
L_021fe8b4:
    mla r7, r6, r4, r5
    add r0, r7, #0xc
    bl AnimationResourceState_ReleaseResources
    add r0, r7, #0x18
    bl func_ov032_0220147c
    add r6, r6, #0x1
    cmp r6, #0x5
    blt L_021fe8b4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov032_021fe8a0, .-func_ov032_021fe8a0

