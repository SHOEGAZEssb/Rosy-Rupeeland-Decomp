.text

/* Exact fallback; see src/overlays/ov032/overlay032_child_controller_base.c for documented portable C. */
.extern GraphicsSpriteGroup_CreateStateFromSource

    .global Overlay032Controller_CreateObject
Overlay032Controller_CreateObject:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    mov r0, r4
    mov r1, r2
    str r2, [r5, #0x4]
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r5, #0x0]
    str r4, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.size Overlay032Controller_CreateObject, .-Overlay032Controller_CreateObject

