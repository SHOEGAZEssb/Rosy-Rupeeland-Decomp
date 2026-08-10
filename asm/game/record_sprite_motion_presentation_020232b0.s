; Matching retail form; see src/game/record_sprite_motion_presentation.c.
.text
.extern Heap_Free
.extern OS_Halt
.extern data_020d6630
.extern data_020f4e18
.extern data_021e9ac0
.extern func_02004fe0
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
.extern func_020066a4
.extern func_0201e250
.extern func_0201e28c
.extern func_02022fbc
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_02056f00
.extern func_020627a0
.extern func_020627d0
.extern func_02062918
.extern func_02063014
.extern func_02063190
.extern func_02063658
.extern func_02071ea4
.extern func_02071eb8
.extern func_02072b68
.extern func_02073ffc
.extern func_02074038

.global func_020232b0
    .type func_020232b0, @function
func_020232b0: ; 0x020232b0
    stmdb sp!, {r4, lr}
    ldr r1, .L_02023304
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x44]
    ldr r1, [r4, #0x3c]
    bl func_02074038
    add r0, r4, #0x48
    bl func_02071eb8
    add r0, r4, #0x2c
    bl func_02005058
    add r0, r4, #0x1c
    bl func_02005058
    add r0, r4, #0xc
    bl func_02005058
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02023304: .word data_020d6630
    .size func_020232b0, .-func_020232b0

