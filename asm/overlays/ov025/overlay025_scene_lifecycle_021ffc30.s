.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_lifecycle.c. */
.extern __destroy_arr
.extern data_020f4e14
.extern data_ov025_02203318
.extern data_ov025_02203370
.extern func_020597fc
.extern func_02071eb8
.extern func_0207419c
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern func_020926f8
.extern func_020927b8
.extern func_02095308
.extern func_ov025_021fdec8
.extern func_ov025_021ff1c8
.extern func_ov094_022196a4
.extern gSoundContext
.extern Heap_Free


    .global func_ov025_021ffc30
func_ov025_021ffc30:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021ffde0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x20]
    ldr r0, L_021ffde4
    bic r1, r1, #0x400
    str r1, [r4, #0x20]
    ldr r0, [r0, #0x0]
    ldr r1, L_021ffde8
    bl func_020597fc
    add r0, r4, #0xf8
    add r0, r0, #0x400
    bl func_02095308
    ldr r0, [r4, #0x50c]
    cmp r0, #0x0
    beq L_021ffc80
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ffc80:
    ldr r5, [r4, #0x5c0]
    cmp r5, #0x0
    beq L_021ffc9c
    mov r0, r5
    bl func_ov094_022196a4
    mov r0, r5
    bl Heap_Free
L_021ffc9c:
    ldr r0, L_021ffdec
    mov r5, #0x0
    strh r5, [r0, #0x0]
    add r0, r0, #0x1000
    strh r5, [r0, #0x0]
L_021ffcb0:
    add r0, r4, r5, lsl #0x2
    ldr r6, [r0, #0xe4]
    cmp r6, #0x0
    beq L_021ffce0
    ldr r0, [r6, #0xc]
    bl func_0207419c
    add r0, r6, #0x30
    bl func_020927b8
    mov r0, r6
    bl func_02071eb8
    mov r0, r6
    bl Heap_Free
L_021ffce0:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt L_021ffcb0
    ldr r5, [r4, #0x598]
    cmp r5, #0x0
    beq L_021ffd10
    ldr r0, [r5, #0x0]
    bl func_0207419c
    add r0, r5, #0x4
    bl func_02071eb8
    mov r0, r5
    bl Heap_Free
L_021ffd10:
    ldr r0, [r4, #0x59c]
    cmp r0, #0x0
    beq L_021ffd28
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ffd28:
    ldr r0, [r4, #0xb0]
    bl func_0207419c
    ldr r0, [r4, #0xb4]
    bl func_0207419c
    ldr r0, L_021ffdf0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x174
    add r0, r0, #0x400
    bl func_020927b8
    add r0, r4, #0x530
    bl func_020926f8
    ldr r1, L_021ffdf4
    add r0, r4, #0xf8
    str r1, [r4, #0x4f8]
    add r0, r0, #0x400
    bl func_02095308
    add r0, r4, #0x2f4
    mov r1, #0x3
    mov r2, #0xac
    ldr r3, L_021ffdf8
    bl __destroy_arr
    add r0, r4, #0x248
    bl func_ov025_021fdec8
    add r0, r4, #0x19c
    bl func_ov025_021fdec8
    add r0, r4, #0xf0
    bl func_ov025_021fdec8
    add r0, r4, #0xa4
    bl func_02071eb8
    add r0, r4, #0x98
    bl func_02071eb8
    add r0, r4, #0x8c
    bl func_02071eb8
    add r0, r4, #0x80
    bl func_02071eb8
    add r0, r4, #0x74
    bl func_02071eb8
    add r0, r4, #0x68
    bl func_02071eb8
    add r0, r4, #0x5c
    bl func_02071eb8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021ffde0: .word data_ov025_02203370
L_021ffde4: .word gSoundContext
L_021ffde8: .word 0x16f
L_021ffdec: .word 0x4000050
L_021ffdf0: .word data_020f4e14
L_021ffdf4: .word data_ov025_02203318
L_021ffdf8: .word func_ov025_021ff1c8
.size func_ov025_021ffc30, .-func_ov025_021ffc30

