.text
/* Exact fallback; see overlay039_scene_lifecycle.c for portable C. */
    .extern func_ov039_021fce00
    .extern VecFx32Object_Init
    .extern func_ov039_0220482c
    .extern func_ov049_0220c124
    .extern func_ov069_022109c4
    .extern func_ov039_021fce40
    .extern RuntimePresentationManager_GetGraphics3dPresentation
    .extern Graphics3dPresentation_LoadResourceProfile
    .extern func_ov039_02200f9c
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_Assign
    .extern VecFx32Object_Destroy
    .extern Heap_Alloc
    .extern func_ov039_021fce60
    .extern func_ov039_02203ef0
    .extern genrand_int32
    .extern func_ov069_02210dc0
    .extern data_ov039_02208438
    .extern gGamePhaseRuntime
    .extern data_ov039_0220846c
    .extern gHeapContext
    .global func_ov039_02200cd8
func_ov039_02200cd8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov039_021fce00
    ldr r1, L_02200f3c
    add r0, r6, #0xac
    str r1, [r6, #0x0]
    bl VecFx32Object_Init
    add r0, r6, #0xbc
    bl func_ov039_0220482c
    add r0, r6, #0x64
    add r0, r0, #0x400
    bl func_ov049_0220c124
    add r0, r6, #0x30c
    add r0, r0, #0x800
    bl func_ov069_022109c4
    add r0, r6, #0xe8
    add r0, r0, #0x1c00
    bl func_ov039_021fce40
    str r5, [r6, #0x48]
    str r5, [r6, #0xb0c]
    ldr r0, L_02200f40
    str r5, [r6, #0xbc]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x7
    bl Graphics3dPresentation_LoadResourceProfile
    mov r0, #0x200000
    str r0, [r6, #0x30]
    mov r0, #0x118000
    str r0, [r6, #0x34]
    mov r2, #0x0
    str r2, [r6, #0x38]
    mov r0, #0x100
    strh r0, [r6, #0x3c]
    strh r0, [r6, #0x3e]
    strh r2, [r6, #0x40]
    add r0, r6, #0x1000
    str r2, [r0, #0xcf0]
    str r2, [r0, #0xcec]
    mov r1, r4
    mov r0, r6
    bl func_ov039_02200f9c
    mov r1, #0x3c
    add r0, r6, #0x1c00
    strh r1, [r0, #0xa4]
    mov r1, #0x0
    strh r1, [r0, #0xde]
    strh r1, [r0, #0xe0]
    add r2, r6, #0x1000
    str r1, [r2, #0xcc4]
    strh r1, [r0, #0xc8]
    str r1, [r2, #0xcc0]
    strh r1, [r0, #0xbc]
    str r1, [r6, #0xa8]
    str r1, [r2, #0xccc]
    str r1, [r2, #0xcd0]
    str r1, [r2, #0xcd8]
    add r0, sp, #0x0
    sub r2, r1, #0xa000
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, r6, #0xac
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, r6, #0x1c00
    mov r2, #0x1
    mov r1, #0x0
    strh r2, [r0, #0xb0]
    strh r1, [r0, #0xaa]
    strh r1, [r0, #0xa8]
    strh r1, [r0, #0xa6]
    add r0, r6, #0x1000
    str r1, [r0, #0xcac]
    mov r0, #0xa
    ldrh r1, [r6, #0x42]
    sub r4, r0, #0x1
    ldr r8, L_02200f44
    bic r0, r1, #0x4
    ldr r5, L_02200f48
    strh r0, [r6, #0x42]
    mov r9, #0x20
    mov r7, #0x4
L_02200e3c:
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, r5
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200e5c
    bl func_ov039_021fce60
L_02200e5c:
    add r1, r6, r4, lsl #0x2
    str r0, [r1, #0x74]
    subs r4, r4, #0x1
    bpl L_02200e3c
    mov r0, #0x3
    ldr r7, L_02200f44
    ldr r4, L_02200f48
    sub r9, r0, #0x1
    mov r8, #0x148
    mov r5, #0x4
L_02200e84:
    mov r0, r8
    mov r1, r7
    mov r2, r5
    mov r3, r4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200ea4
    bl func_ov039_02203ef0
L_02200ea4:
    add r1, r6, r9, lsl #0x2
    str r0, [r1, #0x9c]
    subs r9, r9, #0x1
    bpl L_02200e84
    mov r0, #0x8
    sub r5, r0, #0x1
    mov r4, #0x0
L_02200ec0:
    bl genrand_int32
    add r1, r6, r5, lsl #0x1
    add r1, r1, #0x1c00
    strh r0, [r1, #0xf4]
    bl genrand_int32
    add r1, r6, r5, lsl #0x1
    add r1, r1, #0x1d00
    strh r0, [r1, #0x4]
    bl genrand_int32
    add r1, r6, r5, lsl #0x1
    add r1, r1, #0x1d00
    strh r0, [r1, #0x14]
    bl genrand_int32
    add r1, r6, r5, lsl #0x1
    add r2, r6, r5, lsl #0x2
    add r1, r1, #0x1d00
    strh r0, [r1, #0x24]
    add r0, r2, #0x1000
    str r4, [r0, #0xd34]
    subs r5, r5, #0x1
    bpl L_02200ec0
    mov r0, #0x1
    str r0, [r6, #0x464]
    ldr r1, [r6, #0x4c]
    add r0, r6, #0x30c
    add r0, r0, #0x800
    add r1, r1, #0x2c
    bl func_ov069_02210dc0
    mov r0, r6
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_02200f3c: .word data_ov039_02208438
L_02200f40: .word gGamePhaseRuntime
L_02200f44: .word data_ov039_0220846c
L_02200f48: .word gHeapContext
    .size func_ov039_02200cd8, .-func_ov039_02200cd8

