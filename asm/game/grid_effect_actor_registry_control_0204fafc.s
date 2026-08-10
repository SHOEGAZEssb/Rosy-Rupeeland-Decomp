; Matching retail form; see src/game/grid_effect_actor_registry_control.c.
.extern data_020f4e18
.extern data_021052fc
.extern data_02105790
.extern data_0210579c
.extern func_0202d494
.extern Actor_GetCollection
.extern func_0204f990
.extern func_02071980
.extern func_02071d4c
.text

    .global func_0204fafc
func_0204fafc: ; 0x0204fafc
    stmdb sp!, {r3, lr}
    ldr r0, .L_0204fb20
    ldr r1, .L_0204fb24
    ldr r0, [r0, #0x0]
    bl func_02071980
    ldr r1, .L_0204fb28
    str r0, [r1, #0x8]
    bl func_0204f990
    ldmia sp!, {r3, pc}
.L_0204fb20: .word data_020f4e18
.L_0204fb24: .word 0x7005
.L_0204fb28: .word data_02105790
.size func_0204fafc, . - func_0204fafc

    .global func_0204fb2c

func_0204fb2c: ; 0x0204fb2c
    stmdb sp!, {r3, lr}
    ldr r0, .L_0204fb5c
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, .L_0204fb60
    ldr r0, [r0, #0x0]
    bl func_02071d4c
    ldr r0, .L_0204fb5c
    mov r1, #0x0
    str r1, [r0, #0x8]
    ldmia sp!, {r3, pc}
.L_0204fb5c: .word data_02105790
.L_0204fb60: .word data_020f4e18
.size func_0204fb2c, . - func_0204fb2c

    .global func_0204fb64

func_0204fb64: ; 0x0204fb64
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, .L_0204fb98
    mov r5, #0x0
.L_0204fb70:
    ldr r0, [r4, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_0204fb88
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
.L_0204fb88:
    add r5, r5, #0x1
    cmp r5, #0xc
    blt .L_0204fb70
    ldmia sp!, {r3, r4, r5, pc}
.L_0204fb98: .word data_0210579c
.size func_0204fb64, . - func_0204fb64

    .global func_0204fb9c

func_0204fb9c: ; 0x0204fb9c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    ldr r5, .L_0204fbd8
    mov r4, r6
.L_0204fbac:
    ldr r0, [r5, r6, lsl #0x2]
    cmp r0, #0x0
    beq .L_0204fbc8
    ldr r2, [r0, #0x0]
    mov r1, r4
    ldr r2, [r2, #0x54]
    blx r2
.L_0204fbc8:
    add r6, r6, #0x1
    cmp r6, #0xc
    blt .L_0204fbac
    ldmia sp!, {r4, r5, r6, pc}
.L_0204fbd8: .word data_0210579c
.size func_0204fb9c, . - func_0204fb9c

    .global func_0204fbdc

func_0204fbdc: ; 0x0204fbdc
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, .L_0204fc64
    mov r5, #0x0
.L_0204fbe8:
    ldr r6, [r4, r5, lsl #0x2]
    cmp r6, #0x0
    beq .L_0204fc3c
    add r1, r6, #0x100
    ldrh r0, [r1, #0xf0]
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne .L_0204fc3c
    ldr r3, [r6, #0x54]
    mov r0, r6
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x14
    strh r2, [r3, #0x24]
    ldrh r2, [r1, #0xf0]
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r1, #0xf0]
    bl Actor_GetCollection
    mov r1, r6
    bl func_0202d494
.L_0204fc3c:
    add r5, r5, #0x1
    cmp r5, #0xc
    blt .L_0204fbe8
    ldr r0, .L_0204fc68
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r1, [r0, #0xb8]
    orr r1, r1, #0x10
    str r1, [r0, #0xb8]
    ldmia sp!, {r4, r5, r6, pc}
.L_0204fc64: .word data_0210579c
.L_0204fc68: .word data_021052fc
.size func_0204fbdc, . - func_0204fbdc

    .global func_0204fc6c

func_0204fc6c: ; 0x0204fc6c
    mov r0, #0x0
    ldr r2, .L_0204fcac
    mov r3, r0
.L_0204fc78:
    ldr r1, [r2, r3, lsl #0x2]
    cmp r1, #0x0
    beq .L_0204fc9c
    add r1, r1, #0x100
    ldrh r1, [r1, #0xf0]
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    addhs r0, r0, #0x1
.L_0204fc9c:
    add r3, r3, #0x1
    cmp r3, #0xc
    blt .L_0204fc78
    bx lr
.L_0204fcac: .word data_0210579c
.size func_0204fc6c, . - func_0204fc6c

