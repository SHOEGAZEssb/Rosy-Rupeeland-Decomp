; Matching retail form; see src/game/timed_sprite_record_presentation.c.
.text

.global TimedSpriteRecordPresentation_Update
    .type TimedSpriteRecordPresentation_Update, @function
TimedSpriteRecordPresentation_Update: ; 0x02020048
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0xc]
    mov r0, #0x0
    bx lr
    .size TimedSpriteRecordPresentation_Update, .-TimedSpriteRecordPresentation_Update
