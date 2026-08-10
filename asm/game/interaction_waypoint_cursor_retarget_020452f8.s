; Matching retail form; see src/game/interaction_waypoint_cursor.c.
.text
.extern InteractionWaypointCursor_CountRecords
.global InteractionWaypointCursor_SelectNearest
.type InteractionWaypointCursor_SelectNearest, @function
InteractionWaypointCursor_SelectNearest: ; 0x020452f8
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl InteractionWaypointCursor_CountRecords
    mov r1, #0x0
    mov r3, r1
    sub r2, r1, #0x80000001
    mov ip, #0xc
    b .L_02045354
.L_02045320:
    mul r7, r3, ip
    ldr r8, [r6, #0x0]
    add lr, r8, r7
    ldr lr, [lr, #0x4]
    ldr r8, [r8, r7]
    sub r7, r4, lr
    mul lr, r7, r7
    sub r7, r5, r8
    mla lr, r7, r7, lr
    cmp r2, lr
    movgt r1, r3
    movgt r2, lr
    add r3, r3, #0x1
.L_02045354:
    cmp r3, r0
    blt .L_02045320
    str r1, [r6, #0x4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size InteractionWaypointCursor_SelectNearest, . - InteractionWaypointCursor_SelectNearest
