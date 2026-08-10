; Matching retail form; see src/game/game_phase_area_scene_runtime.c.
.text
.extern Heap_Free
.extern data_020d5680
.extern data_021052fc
.extern func_02005058
.extern func_02006280
.extern func_0201e1b0
.extern ActorCollection_Destructor
.extern ActorCollection_UnregisterAndDestroyAllActors

    .global func_02011f98
func_02011f98: ; 0x02011f98
    stmdb sp!, {r4, lr}
    ldr r1, L_0201200c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, L_02012010
    mov r1, #0x37
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e1b0
    add r0, r4, #0x8
    bl ActorCollection_UnregisterAndDestroyAllActors
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02011fe0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02011fe0:
    add r0, r4, #0x2ec0
    bl func_02005058
    add r0, r4, #0xeb0
    add r0, r0, #0x2000
    bl func_02006280
    add r0, r4, #0x8
    bl ActorCollection_Destructor
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201200c: .word data_020d5680
L_02012010: .word data_021052fc
    .size func_02011f98, . - func_02011f98

