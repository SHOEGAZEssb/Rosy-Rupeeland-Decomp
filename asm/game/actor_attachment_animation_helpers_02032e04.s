; Matching retail form; see src/game/actor_attachment_animation_helpers.c.
.text
.extern Position_AdjustForTerrainHeight

    .global Actor_AdjustPositionForTerrainHeight
    .type Actor_AdjustPositionForTerrainHeight, @function
Actor_AdjustPositionForTerrainHeight: ; 0x02032e04
    ldr ip, .L_02032e10
    add r0, r0, #0x18
    bx ip
.L_02032e10: .word Position_AdjustForTerrainHeight
    .size Actor_AdjustPositionForTerrainHeight, . - Actor_AdjustPositionForTerrainHeight
