.text

/* Exact fallback; see src/overlays/ov031/overlay031_transition_setup.c for documented portable C. */
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern func_ov031_021fce00


    .global func_ov031_021fe148
func_ov031_021fe148:
    stmdb sp!, {r4, lr}
    ldr lr, L_021fe178
    ldr r4, [sp, #0x8]
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    orr r0, r0, r4, lsl #0xd
    strh r0, [lr, #0x0]
    ldmia sp!, {r4, pc}
L_021fe178: .word 0x4001008
.size func_ov031_021fe148, .-func_ov031_021fe148
    .global func_ov031_021fe17c
func_ov031_021fe17c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    add r0, r4, #0xa4
    mov r1, #0x1
    mov r2, #0x8
    bl func_ov031_021fce00
    mov r0, #0x1
    str r0, [r4, #0xa0]
    ldmia sp!, {r4, pc}
.size func_ov031_021fe17c, .-func_ov031_021fe17c
