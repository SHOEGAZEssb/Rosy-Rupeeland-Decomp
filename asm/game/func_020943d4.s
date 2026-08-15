.text
; Matching fallback for the portable implementation in src/game/inventory_scroll_controller.c.
.extern GraphicsSpriteGroup_Destroy
.extern data_020f263c
.extern func_02071eb8

.global func_020943d4
func_020943d4:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0209442c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    beq .L_020943fc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020943fc:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_02094414
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02094414:
    ldr r0, [r4, #0x50]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x54
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0209442c: .word data_020f263c
.size func_020943d4, . - func_020943d4
