.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern Heap_Free
.extern __destroy_arr
.extern data_ov071_02212394
.extern VecFx32Object_Destroy
.extern func_02099fb0
.extern func_ov071_022101a0

.global func_ov071_022101a4
func_ov071_022101a4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02210228
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0xe8]
    cmp r4, #0x0
    beq .L_02210208
    add r0, r4, #0x1a4
    ldr r3, .L_0221022c
    add r0, r0, #0x400
    mov r1, #0x3c
    mov r2, #0xc
    bl __destroy_arr
    ldr r3, .L_0221022c
    add r0, r4, #0x2d4
    mov r1, #0x3c
    mov r2, #0xc
    bl __destroy_arr
    ldr r3, .L_0221022c
    add r0, r4, #0x4
    mov r1, #0x3c
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r4
    bl Heap_Free
.L_02210208:
    add r0, r5, #0x5c
    bl VecFx32Object_Destroy
    add r0, r5, #0x4c
    bl VecFx32Object_Destroy
    mov r0, r5
    bl func_02099fb0
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02210228: .word data_ov071_02212394
.L_0221022c: .word func_ov071_022101a0
.size func_ov071_022101a4, . - func_ov071_022101a4
