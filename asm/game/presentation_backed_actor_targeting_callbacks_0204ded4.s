; Matching retail form; see src/game/presentation_backed_actor_targeting.c.
.extern data_021052fc
.extern data_02105310
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern func_02031758
.extern func_02032a94
.text
    .global func_0204ded4

func_0204ded4: ; 0x0204ded4
    ldr ip, .L_0204dedc
    bx ip
.L_0204dedc: .word func_02032a94
.size func_0204ded4, . - func_0204ded4

    .global func_0204dee0

func_0204dee0: ; 0x0204dee0
    ldr ip, .L_0204dee8
    bx ip
.L_0204dee8: .word func_02031758
.size func_0204dee0, . - func_0204dee0

    .global func_0204deec

func_0204deec: ; 0x0204deec
    stmdb sp!, {r3, lr}
    add r0, r0, #0x100
    ldrh r0, [r0, #0xec]
    cmp r0, #0x1
    bne .L_0204df30
    ldr r0, .L_0204df38
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0204df30
    ldr r0, .L_0204df3c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0xd0]
    tst r0, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_0204df30:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_0204df38: .word data_02105310
.L_0204df3c: .word data_021052fc
.size func_0204deec, . - func_0204deec

