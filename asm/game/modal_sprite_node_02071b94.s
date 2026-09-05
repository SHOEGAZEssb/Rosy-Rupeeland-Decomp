.text
; Matching fallback for the portable implementation in src/game/modal_sprite_node.c.
.extern GraphicsArchive_AcquireCellResource
.extern GraphicsArchive_AcquireCharacterResource
.extern GraphicsArchive_AcquirePaletteResource

.global func_02071b94
func_02071b94:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r2
    mov r4, r3
    bl GraphicsArchive_AcquireCharacterResource
    ldr r2, [sp, #0x10]
    mov r1, r5
    str r0, [r2, #0x0]
    mov r0, r6
    bl GraphicsArchive_AcquirePaletteResource
    ldr r2, [sp, #0x14]
    mov r1, r4
    str r0, [r2, #0x0]
    mov r0, r6
    bl GraphicsArchive_AcquireCellResource
    ldr r1, [sp, #0x18]
    str r0, [r1, #0x0]
    ldmia sp!, {r4, r5, r6, pc}
.size func_02071b94, . - func_02071b94
