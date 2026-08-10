; Matching retail form; see src/game/actor_collection_terrain_context.c.
.text
.extern data_021052fc
.extern func_02007f0c

    .global func_020337d4
    .type func_020337d4, @function
func_020337d4: ; 0x020337d4
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x14]
    tst r0, #0x4000000
    beq .L_020337f8
    ldr r0, .L_0203380c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    ldmia sp!, {r3, pc}
.L_020337f8:
    ldr r0, .L_0203380c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    ldmia sp!, {r3, pc}
.L_0203380c: .word data_021052fc
    .size func_020337d4, . - func_020337d4

    .global Actor_GetCollectionBySlot
