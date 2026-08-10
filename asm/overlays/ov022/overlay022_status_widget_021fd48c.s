    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern gDebugFont
    .extern genrand_int32

.global func_ov022_021fd48c
func_ov022_021fd48c:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd4d0
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x1c]
    mov r1, #0x60
    str r1, [r0, #0x1c]
    mov r1, #0x0
    str r1, [r4, #0x20]
    str r1, [r4, #0x24]
    mov r0, #0x1
    str r0, [r4, #0x28]
    str r1, [r4, #0x2c]
    bl genrand_int32
    str r0, [r4, #0x30]
    ldmia sp!, {r4, pc}
L_021fd4d0: .word gDebugFont
.size func_ov022_021fd48c, . - func_ov022_021fd48c
