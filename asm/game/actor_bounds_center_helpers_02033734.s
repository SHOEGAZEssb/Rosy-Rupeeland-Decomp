; Matching retail form; see src/game/actor_bounds_center_helpers.c.
.text

    .global S8BoundsCenter_NoOpHook
    .type S8BoundsCenter_NoOpHook, @function
S8BoundsCenter_NoOpHook: ; 0x02033734
    bx lr
    .size S8BoundsCenter_NoOpHook, . - S8BoundsCenter_NoOpHook

    .global S8BoundsCenter_Init
