; Matching retail form; see src/game/interaction_waypoint_cursor.c.
.text
.global InteractionWaypointCursor_Advance
.type InteractionWaypointCursor_Advance, @function
.global InteractionWaypointCursor_GetCurrentRecord
.type InteractionWaypointCursor_GetCurrentRecord, @function
.global InteractionWaypointCursor_GetCurrentYPointer
.type InteractionWaypointCursor_GetCurrentYPointer, @function
.global InteractionWaypointCursor_GetCurrentDurationFrames
.type InteractionWaypointCursor_GetCurrentDurationFrames, @function
.global InteractionWaypointCursor_CountRecords
.type InteractionWaypointCursor_CountRecords, @function
InteractionWaypointCursor_Advance: ; 0x02045364
    ldr r2, [r0, #0x4]
    mov r1, #0xc
    add r3, r2, #0x1
    str r3, [r0, #0x4]
    ldr r2, [r0, #0x0]
    mla r1, r3, r1, r2
    ldrh r1, [r1, #0x8]
    cmp r1, #0x0
    beq .L_02045390
    cmp r1, #0x1
    bx lr
.L_02045390:
    mov r1, #0x0
    str r1, [r0, #0x4]
    bx lr
.size InteractionWaypointCursor_Advance, . - InteractionWaypointCursor_Advance
InteractionWaypointCursor_GetCurrentRecord: ; 0x0204539c
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x4]
    mov r0, #0xc
    mla r0, r1, r0, r2
    bx lr
.size InteractionWaypointCursor_GetCurrentRecord, . - InteractionWaypointCursor_GetCurrentRecord
InteractionWaypointCursor_GetCurrentYPointer: ; 0x020453b0
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x4]
    mov r0, #0xc
    mla r0, r1, r0, r2
    add r0, r0, #0x4
    bx lr
.size InteractionWaypointCursor_GetCurrentYPointer, . - InteractionWaypointCursor_GetCurrentYPointer
InteractionWaypointCursor_GetCurrentDurationFrames: ; 0x020453c8
    ldr r2, [r0, #0x0]
    ldr r1, [r0, #0x4]
    mov r0, #0xc
    mla r0, r1, r0, r2
    ldrh r1, [r0, #0xa]
    mov r0, #0x3c
    mul r0, r1, r0
    bx lr
.size InteractionWaypointCursor_GetCurrentDurationFrames, . - InteractionWaypointCursor_GetCurrentDurationFrames
InteractionWaypointCursor_CountRecords: ; 0x020453e8
    ldr r3, [r0, #0x0]
    mov r0, #0x0
    mov r1, #0xc
    b .L_020453fc
.L_020453f8:
    add r0, r0, #0x1
.L_020453fc:
    mla r2, r0, r1, r3
    ldrh r2, [r2, #0x8]
    cmp r2, #0x0
    bne .L_020453f8
    bx lr
.size InteractionWaypointCursor_CountRecords, . - InteractionWaypointCursor_CountRecords
