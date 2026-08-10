.text
; Matching fallback for the portable implementation in src/overlays/ov049/overlay049_resource_recovery.c.
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_0209f09c

.global func_ov049_0220bbdc
func_ov049_0220bbdc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x100
    mov r7, r1
    mov r4, r2
    mov r5, r0
    mov r1, #0x0
    mov r6, r3
    ldr r2, .L_0220be18
    add r0, sp, #0x0
    mov r3, r1
    bl VecFx32Object_InitComponents
    mov r1, #0x800
    add r0, sp, #0x10
    rsb r1, r1, #0x0
    mov r2, #0x800
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r2, #0x0
    ldr r1, .L_0220be1c
    add r0, sp, #0x20
    mov r3, r2
    bl VecFx32Object_InitComponents
    mov r1, #0x800
    rsb r1, r1, #0x0
    add r0, sp, #0x30
    mov r2, r1
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r1, #0x0
    ldr r2, .L_0220be1c
    add r0, sp, #0x40
    mov r3, r1
    bl VecFx32Object_InitComponents
    mov r1, #0x800
    add r0, sp, #0x50
    sub r2, r1, #0x1000
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r2, #0x0
    ldr r1, .L_0220be18
    add r0, sp, #0x60
    mov r3, r2
    bl VecFx32Object_InitComponents
    mov r1, #0x800
    add r0, sp, #0x70
    mov r2, r1
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r1, #0x0
    ldr r2, .L_0220be20
    add r0, sp, #0x80
    mov r3, r1
    bl VecFx32Object_InitComponents
    mov r1, #0x1800
    add r0, sp, #0x90
    rsb r1, r1, #0x0
    mov r2, #0x1800
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r2, #0x0
    ldr r1, .L_0220be24
    add r0, sp, #0xa0
    mov r3, r2
    bl VecFx32Object_InitComponents
    mov r1, #0x1800
    rsb r1, r1, #0x0
    add r0, sp, #0xb0
    mov r2, r1
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r1, #0x0
    ldr r2, .L_0220be24
    add r0, sp, #0xc0
    mov r3, r1
    bl VecFx32Object_InitComponents
    mov r1, #0x1800
    add r0, sp, #0xd0
    sub r2, r1, #0x3000
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r2, #0x0
    ldr r1, .L_0220be20
    add r0, sp, #0xe0
    mov r3, r2
    bl VecFx32Object_InitComponents
    mov r1, #0x1800
    add r0, sp, #0xf0
    mov r2, r1
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    cmp r6, #0x0
    bne .L_0220bd80
    ldr r2, [r5, #0x84]
    mov r1, r7
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r5, #0x84]
    add r0, r0, #0x2c
    bl VecFx32Object_Assign
    add r1, sp, #0x0
    add r0, r5, #0x8c
    add r1, r1, r4, lsl #0x4
    bl VecFx32Object_Assign
    b .L_0220bd90
.L_0220bd80:
    ldr r0, [r5, #0x48]
    mov r1, r7
    ldr r0, [r0, #0x10]
    bl func_0209f09c
.L_0220bd90:
    add r0, sp, #0xf0
    bl VecFx32Object_Destroy
    add r0, sp, #0xe0
    bl VecFx32Object_Destroy
    add r0, sp, #0xd0
    bl VecFx32Object_Destroy
    add r0, sp, #0xc0
    bl VecFx32Object_Destroy
    add r0, sp, #0xb0
    bl VecFx32Object_Destroy
    add r0, sp, #0xa0
    bl VecFx32Object_Destroy
    add r0, sp, #0x90
    bl VecFx32Object_Destroy
    add r0, sp, #0x80
    bl VecFx32Object_Destroy
    add r0, sp, #0x70
    bl VecFx32Object_Destroy
    add r0, sp, #0x60
    bl VecFx32Object_Destroy
    add r0, sp, #0x50
    bl VecFx32Object_Destroy
    add r0, sp, #0x40
    bl VecFx32Object_Destroy
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220be18: .word 0xb33
.L_0220be1c: .word 0xfffff4cd
.L_0220be20: .word 0x219a
.L_0220be24: .word 0xffffde66
.size func_ov049_0220bbdc, . - func_ov049_0220bbdc
