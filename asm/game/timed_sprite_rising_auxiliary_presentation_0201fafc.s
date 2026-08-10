; Matching retail form; see src/game/timed_sprite_rising_auxiliary_presentation.c.
.text
.extern Heap_Free
.extern data_020d6180
.extern data_021052fc
.extern DisplayController_GetSubScreenVerticalOffset
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorMotionAreaFollower_GetPosition
.extern func_0201f724
.extern func_0201fa44

.global func_0201fafc
    .type func_0201fafc, @function
func_0201fafc: ; 0x0201fafc
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    ldr ip, [sp, #0x20]
    ldr lr, [sp, #0x24]
    str ip, [sp, #0x0]
    ldr ip, [sp, #0x28]
    str lr, [sp, #0x4]
    ldr lr, [sp, #0x2c]
    str ip, [sp, #0x8]
    ldr ip, [sp, #0x30]
    str lr, [sp, #0xc]
    str ip, [sp, #0x10]
    mov ip, #0x1
    mov r4, r0
    str ip, [sp, #0x14]
    bl func_0201f724
    ldr r1, .L_0201fb50
    mov r0, r4
    str r1, [r4, #0x0]
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_0201fb50: .word data_020d6180
    .size func_0201fafc, .-func_0201fafc

