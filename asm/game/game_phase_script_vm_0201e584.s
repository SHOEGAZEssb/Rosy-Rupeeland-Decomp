; Matching retail form; see src/game/timed_sprite_offset_variant.c.
.text
.extern Heap_Free
.extern func_0201e290
.extern func_0201e380
.extern func_0201e3b8
.extern func_020050a4
.extern func_020050c8
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
.extern func_02072b68
.extern data_020d6084
.global func_0201e584
func_0201e584: ; 0x0201e584
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_0201e290
    ldr r1, L_0201e5ec
    add r0, r4, #0x8
    str r1, [r4, #0x0]
    add r1, r7, #0x10
    str r5, [r4, #0x2c]
    bl func_020050a4
    add r0, r4, #0x18
    add r1, r7, #0x20
    bl func_020050a4
    ldr r0, [r7, #0x30]
    mov r1, r6
    str r0, [r4, #0x28]
    ldr r2, [r4, #0x4]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x4]
    bl func_02072b68
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201e5ec: .word data_020d6084


.size func_0201e584, . - func_0201e584
