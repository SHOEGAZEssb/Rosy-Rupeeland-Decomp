.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_main_scene_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov051_0220dfb8
.extern RuntimePresentationManager_AppendSecondListEffect
.extern func_ov051_0220dbf0
.extern gHeapContext

.global func_ov051_0220dd90
func_ov051_0220dd90:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    ldr r0, .L_0220dde8
    ldr r1, .L_0220ddec
    ldr r3, .L_0220ddf0
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0220ddd0
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov051_0220dbf0
    mov r1, r0
.L_0220ddd0:
    ldr r0, .L_0220ddf4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendSecondListEffect
    ldmia sp!, {r4, r5, r6, pc}
.L_0220dde8: .word 0x1814
.L_0220ddec: .word data_ov051_0220dfb8
.L_0220ddf0: .word gHeapContext
.L_0220ddf4: .word data_021052fc
.size func_ov051_0220dd90, . - func_ov051_0220dd90
