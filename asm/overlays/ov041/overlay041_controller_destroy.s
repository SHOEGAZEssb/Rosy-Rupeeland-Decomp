.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_graphics_lifecycle.c. */
.extern GraphicsResourceSet_Destroy
.extern Heap_Free
.extern __destroy_arr
.extern data_020f4e14
.extern func_02005058
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern func_02075020
.extern func_02099fb0
.extern func_ov041_021fce00
.extern func_ov041_021fdeb4
.extern func_ov041_021ff530
.extern func_ov041_022012f4
.extern func_ov070_02210238
.extern gDebugFont

    .global func_ov041_021fdd64
func_ov041_021fdd64: ; 0x021fdd64
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_ov041_021fdeb4
    ldr r5, [r4, #0x14]
    cmp r5, #0x0
    beq .L_021fddac
    beq .L_021fdda4
    ldr r3, .L_021fdea4
    add r0, r5, #0x64
    mov r1, #0x4
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r5
    bl func_02099fb0
    mov r0, r5
    bl Heap_Free
.L_021fdda4:
    mov r0, #0x0
    str r0, [r4, #0x14]
.L_021fddac:
    ldr r5, [r4, #0x10]
    cmp r5, #0x0
    beq .L_021fddd4
    beq .L_021fddcc
    mov r0, r5
    bl func_ov041_021ff530
    mov r0, r5
    bl Heap_Free
.L_021fddcc:
    mov r0, #0x0
    str r0, [r4, #0x10]
.L_021fddd4:
    ldr r5, [r4, #0xc]
    cmp r5, #0x0
    beq .L_021fddfc
    beq .L_021fddf4
    mov r0, r5
    bl func_ov041_022012f4
    mov r0, r5
    bl Heap_Free
.L_021fddf4:
    mov r0, #0x0
    str r0, [r4, #0xc]
.L_021fddfc:
    ldr r5, [r4, #0x8]
    cmp r5, #0x0
    beq .L_021fde24
    beq .L_021fde1c
    mov r0, r5
    bl func_ov070_02210238
    mov r0, r5
    bl Heap_Free
.L_021fde1c:
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_021fde24:
    ldr r0, .L_021fdea8
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, .L_021fdeac
    ldr r0, [r0, #0x0]
    bl func_02075020
    add r0, r4, #0x19c
    bl func_02005058
    add r0, r4, #0x18c
    bl func_02005058
    add r0, r4, #0xf0
    mov r1, #0xa
    mov r2, #0xc
    ldr r3, .L_021fdeb0
    bl __destroy_arr
    add r0, r4, #0x90
    mov r1, #0x8
    mov r2, #0xc
    ldr r3, .L_021fdeb0
    bl __destroy_arr
    add r0, r4, #0x48
    mov r1, #0x6
    mov r2, #0xc
    ldr r3, .L_021fdeb0
    bl __destroy_arr
    add r0, r4, #0x2c
    bl func_02005058
    add r0, r4, #0x1c
    bl func_02005058
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_021fdea4: .word func_ov041_021fce00
.L_021fdea8: .word data_020f4e14
.L_021fdeac: .word gDebugFont
.L_021fdeb0: .word GraphicsResourceSet_Destroy
    .size func_ov041_021fdd64, . - func_ov041_021fdd64

