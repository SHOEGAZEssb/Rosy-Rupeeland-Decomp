.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_object_lifecycle.c. */
.extern data_ov041_02205820
.extern Heap_FreeAlternateEntry
.extern func_02099fb0
.extern CxxArray_DestroyAndFree
.extern func_ov041_021fce00

    .global func_ov041_021ff530
func_ov041_021ff530: ; 0x021ff530
    stmdb sp!, {r4, lr}
    ldr r1, .L_021ff5a0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x80]
    bl Heap_FreeAlternateEntry
    ldr r0, [r4, #0x84]
    ldr r3, .L_021ff5a4
    mov r1, #0xc
    mov r2, #0x8
    bl CxxArray_DestroyAndFree
    ldr r0, [r4, #0x88]
    ldr r3, .L_021ff5a4
    mov r1, #0xc
    mov r2, #0x8
    bl CxxArray_DestroyAndFree
    ldr r0, [r4, #0x8c]
    bl Heap_FreeAlternateEntry
    ldr r0, [r4, #0x90]
    bl Heap_FreeAlternateEntry
    ldr r0, [r4, #0x94]
    bl Heap_FreeAlternateEntry
    ldr r0, [r4, #0x98]
    bl Heap_FreeAlternateEntry
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_021ff5a0: .word data_ov041_02205820
.L_021ff5a4: .word func_ov041_021fce00
    .size func_ov041_021ff530, . - func_ov041_021ff530

