; Matching retail form; see src/game/game_phase_area_scene_lifecycle.c.
.text
.extern func_020062a0
.extern func_0202d014
.extern ActorCollection_FindActorByTypeAndId
.extern func_02030b18

    .global func_02011ebc
func_02011ebc: ; 0x02011ebc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x8
    mov r1, #0x2
    bl func_0202d014
    add r0, r4, #0x8
    mov r1, #0x1000
    bl func_02030b18
    add r0, r4, #0x2000
    ldr r1, [r0, #0xeac]
    add r0, r4, #0xeb0
    ldr r1, [r1, #0x20]
    add r0, r0, #0x2000
    bl func_020062a0
    add r0, r4, #0x2000
    ldr r1, [r0, #0xeac]
    mov r0, #0x0
    ldr r1, [r1, #0x28]
    blx r1
    add r0, r4, #0x8
    mov r1, #0x3
    mov r2, r1
    bl ActorCollection_FindActorByTypeAndId
    add r1, r4, #0x2000
    str r0, [r1, #0xebc]
    ldmia sp!, {r4, pc}
    .size func_02011ebc, . - func_02011ebc

