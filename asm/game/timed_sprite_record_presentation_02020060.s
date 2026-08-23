; Matching retail form; see src/game/timed_sprite_record_presentation.c.
.text
.extern Heap_Alloc
.extern data_020d62d0
.extern data_021052fc
.extern RuntimePresentationManager_AppendFirstListEffect
.extern func_0201ff2c
.extern gHeapContext

.global func_02020060
    .type func_02020060, @function
func_02020060: ; 0x02020060
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    ldr r1, .L_020200b0
    ldr r3, .L_020200b4
    mov r0, #0x20
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_02020098
    mov r1, r5
    mov r2, r4
    bl func_0201ff2c
    mov r1, r0
.L_02020098:
    ldr r0, .L_020200b8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    ldmia sp!, {r3, r4, r5, pc}
.L_020200b0: .word data_020d62d0
.L_020200b4: .word gHeapContext
.L_020200b8: .word data_021052fc
    .size func_02020060, .-func_02020060
