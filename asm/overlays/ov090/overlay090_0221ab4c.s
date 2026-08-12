.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_periodic_effect_spawn.c.
.extern data_021052fc
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern TrackedResourceActor_SpawnFromKey
.extern func_020befec
.extern func_ov090_0221a460

.global func_ov090_0221ab4c
func_ov090_0221ab4c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r5, r0
    add r2, r5, #0x100
    ldrh r1, [r2, #0xf2]
    add r0, r5, #0x200
    add r1, r1, #0x1
    strh r1, [r2, #0xf2]
    ldrh r1, [r2, #0xf2]
    ldrh r0, [r0, #0x36]
    cmp r1, r0
    blo .L_0221ad58
    mov r3, #0x0
    mov r1, #0x200000
    strh r3, [r2, #0xf2]
    add r0, sp, #0x20
    sub r2, r1, #0xca000
    bl VecFx32Object_InitComponents
    ldrb r0, [r5, #0x246]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_0221abe4
.L_0221aba4:
    b .L_0221abcc
    b .L_0221abd4
    b .L_0221abd4
    b .L_0221abd4
    b .L_0221abdc
    b .L_0221abdc
    b .L_0221abdc
    b .L_0221abe4
    b .L_0221abe4
    b .L_0221abe4
.L_0221abcc:
    mov r4, #0x0
    b .L_0221abe8
.L_0221abd4:
    mov r4, #0x3
    b .L_0221abe8
.L_0221abdc:
    mov r4, #0x5
    b .L_0221abe8
.L_0221abe4:
    mov r4, #0xa
.L_0221abe8:
    ldrb r0, [r5, #0x1ee]
    cmp r0, r4
    blt .L_0221ac44
    ldr r0, .L_0221ad60
    add r1, sp, #0x20
    ldr r2, [r0, #0x0]
    mov r0, #0x14
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea4]
    add r2, r2, #0x18
    bl TrackedResourceActor_SpawnFromKey
    mov r1, #0x8000
    str r1, [r0, #0x20c]
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x100
    str r1, [r0, #0x10]
    ldrsh r1, [r0, #0x62]
    sub r1, r1, #0x10
    strh r1, [r0, #0x62]
    ldrsh r1, [r0, #0x66]
    add r1, r1, #0x8
    strh r1, [r0, #0x66]
    b .L_0221ad34
.L_0221ac44:
    mov r1, #0x0
    add r0, sp, #0x0
    mov r3, r1
    mov r2, #0x20000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x10
    add r1, sp, #0x20
    add r2, sp, #0x0
    bl func_ov090_0221a460
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldrb r0, [r5, #0x1ee]
    mov r1, #0x5
    bl func_020befec
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_0221acd8
.L_0221ac88:
    b .L_0221acd8
    b .L_0221ac9c
    b .L_0221acac
    b .L_0221acbc
    b .L_0221accc
.L_0221ac9c:
    ldr r0, [sp, #0x14]
    add r0, r0, #0x8000
    str r0, [sp, #0x14]
    b .L_0221acd8
.L_0221acac:
    ldr r0, [sp, #0x14]
    sub r0, r0, #0x18000
    str r0, [sp, #0x14]
    b .L_0221acd8
.L_0221acbc:
    ldr r0, [sp, #0x14]
    sub r0, r0, #0x8000
    str r0, [sp, #0x14]
    b .L_0221acd8
.L_0221accc:
    ldr r0, [sp, #0x14]
    add r0, r0, #0x18000
    str r0, [sp, #0x14]
.L_0221acd8:
    add r1, sp, #0x20
    add r2, sp, #0x10
    mov r0, #0x13
    bl TrackedResourceActor_SpawnFromKey
    mov r1, #0x8000
    str r1, [r0, #0x20c]
    ldr r1, [r0, #0x10]
    mov r3, #0x1
    orr r1, r1, #0x100
    str r1, [r0, #0x10]
    ldr r1, [r0, #0x54]
    mov r2, #0x240
    strb r3, [r1, #0x3a]
    ldr r1, [r0, #0x54]
    strh r2, [r1, #0x28]
    ldrsh r1, [r0, #0x62]
    sub r1, r1, #0x10
    strh r1, [r0, #0x62]
    ldrsh r1, [r0, #0x66]
    add r1, r1, #0x8
    strh r1, [r0, #0x66]
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_0221ad34:
    ldrb r0, [r5, #0x1ee]
    add r1, r0, #0x1
    and r0, r1, #0xff
    cmp r0, r4
    strb r1, [r5, #0x1ee]
    movgt r0, #0x0
    strgtb r0, [r5, #0x1ee]
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
.L_0221ad58:
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_0221ad60: .word data_021052fc
.size func_ov090_0221ab4c, . - func_ov090_0221ab4c
