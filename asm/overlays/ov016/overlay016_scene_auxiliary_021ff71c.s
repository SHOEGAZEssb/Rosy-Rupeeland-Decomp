    .text

/* Exact fallback; see src/overlays/ov016/overlay016_scene_auxiliary.c. */
    .extern Heap_Free
    .extern func_ov000_021fb848
    .extern Overlay000_CaptureViewState
    .extern func_ov016_021fe24c
.global func_ov016_021ff71c
func_ov016_021ff71c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r5, [r4, #0x450]
    cmp r5, #0x0
    beq L_021ff744
    mov r0, r5
    bl func_ov000_021fb848 ; func_ov006_021fb848
    mov r0, r5
    bl Heap_Free
L_021ff744:
    mov r0, #0x0
    str r0, [r4, #0x450]
    ldr r5, [r4, #0x470]
    cmp r5, #0x0
    beq L_021ff768
    mov r0, r5
    bl func_ov016_021fe24c
    mov r0, r5
    bl Heap_Free
L_021ff768:
    mov r0, #0x0
    str r0, [r4, #0x470]
    ldr r1, [r4, #0x44c]
    add r0, sp, #0x0
    bl Overlay000_CaptureViewState
    ldr r0, [sp, #0x0]
    str r0, [r4, #0x454]
    ldr r0, [sp, #0x4]
    str r0, [r4, #0x458]
    ldr r0, [sp, #0x8]
    str r0, [r4, #0x45c]
    ldr r0, [r4, #0x44c]
    cmp r0, #0x0
    beq L_021ff7ac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff7ac:
    mov r0, #0x0
    str r0, [r4, #0x44c]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
    .size func_ov016_021ff71c, . - func_ov016_021ff71c

