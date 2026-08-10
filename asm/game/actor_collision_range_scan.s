; Matching retail form; see src/game/actor_collision_range_scan.c for
; the documented portable implementation and recovered behavior.
.text
.extern ActorCollision_TestPoint
.extern func_0202baec
.global ActorCollision_ScanDirectionalRange
ActorCollision_ScanDirectionalRange: ; 0x0200a6ac
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x8
    ldr r6, [r2, #0x0]
    ldr r4, [r2, #0x8]
    ldr r5, [r2, #0x4]
    ldr r2, [r2, #0xc]
    mov r7, r5, asr #0xc
    ldr r11, [sp, #0x30]
    ldr r8, [sp, #0x34]
    mov r9, r0
    mov r10, r1
    cmp r3, #0x8
    mov r6, r6, asr #0xc
    mov r4, r4, asr #0xc
    mov r5, r2, asr #0xc
    addls pc, pc, r3, lsl #0x2
    b L_0200a938
L_0200a6f0: ; jump table
    b L_0200a938 ; case 0
    b L_0200a8b8 ; case 1
    b L_0200a834 ; case 2
    b L_0200a938 ; case 3
    b L_0200a714 ; case 4
    b L_0200a938 ; case 5
    b L_0200a938 ; case 6
    b L_0200a938 ; case 7
    b L_0200a798 ; case 8
L_0200a714:
    mvn r0, #0x80000000
    str r0, [r9, #0x0]
    mov r0, #0x0
    str r0, [r9, #0x8]
    mov r5, r7, asr #0x4
    b L_0200a778
L_0200a72c:
    mov r0, r10
    mov r2, r5
    mov r3, r11
    mov r1, r6, asr #0x4
    str r8, [sp, #0x0]
    bl ActorCollision_TestPoint
    cmp r0, #0x0
    beq L_0200a774
    ldr r0, [r9, #0x0]
    cmp r6, r0
    biclt r0, r6, #0x7
    strlt r0, [r9, #0x0]
    ldr r0, [r9, #0x8]
    cmp r6, r0
    movgt r0, r6, asr #0x3
    addgt r0, r0, #0x1
    movgt r0, r0, lsl #0x3
    strgt r0, [r9, #0x8]
L_0200a774:
    add r6, r6, #0x1
L_0200a778:
    cmp r6, r4
    ble L_0200a72c
    bic r1, r7, #0x7
    add r0, r7, #0x8
    str r1, [r9, #0x4]
    bic r0, r0, #0x7
    str r0, [r9, #0xc]
    b L_0200a938
L_0200a798:
    mvn r0, #0x80000000
    str r0, [r9, #0x0]
    mov r0, #0x0
    str r0, [r9, #0x8]
    mov r7, r5, asr #0x4
    b L_0200a814
L_0200a7b0:
    mov r0, r6, asr #0x4
    str r0, [sp, #0x4]
    ldr r1, [sp, #0x4]
    mov r0, r10
    mov r2, r7
    bl func_0202baec
    ldr r1, [sp, #0x4]
    mov r0, r10
    mov r2, r7
    mov r3, r11
    str r8, [sp, #0x0]
    bl ActorCollision_TestPoint
    cmp r0, #0x0
    beq L_0200a810
    ldr r0, [r9, #0x0]
    cmp r6, r0
    biclt r0, r6, #0x7
    strlt r0, [r9, #0x0]
    ldr r0, [r9, #0x8]
    cmp r6, r0
    movgt r0, r6, asr #0x3
    addgt r0, r0, #0x1
    movgt r0, r0, lsl #0x3
    strgt r0, [r9, #0x8]
L_0200a810:
    add r6, r6, #0x1
L_0200a814:
    cmp r6, r4
    ble L_0200a7b0
    bic r1, r5, #0x7
    add r0, r5, #0x8
    str r1, [r9, #0x4]
    bic r0, r0, #0x7
    str r0, [r9, #0xc]
    b L_0200a938
L_0200a834:
    mvn r0, #0x80000000
    str r0, [r9, #0x4]
    mov r0, #0x0
    str r0, [r9, #0xc]
    mov r6, r4, asr #0x4
    b L_0200a894
L_0200a84c:
    mov r0, r10
    mov r1, r6
    mov r3, r11
    mov r2, r7, asr #0x4
    str r8, [sp, #0x0]
    bl ActorCollision_TestPoint
    cmp r0, #0x0
    beq L_0200a890
    ldr r0, [r9, #0x4]
    cmp r7, r0
    biclt r0, r7, #0x7
    strlt r0, [r9, #0x4]
    ldr r0, [r9, #0xc]
    cmp r7, r0
    addgt r0, r7, #0x8
    bicgt r0, r0, #0x7
    strgt r0, [r9, #0xc]
L_0200a890:
    add r7, r7, #0x1
L_0200a894:
    cmp r7, r5
    ble L_0200a84c
    add r0, r4, #0x8
    bic r1, r4, #0x7
    mov r0, r0, asr #0x3
    str r1, [r9, #0x0]
    mov r0, r0, lsl #0x8
    str r0, [r9, #0x8]
    b L_0200a938
L_0200a8b8:
    mvn r0, #0x80000000
    str r0, [r9, #0x4]
    mov r0, #0x0
    str r0, [r9, #0xc]
    mov r4, r6, asr #0x4
    b L_0200a91c
L_0200a8d0:
    mov r0, r10
    mov r1, r4
    mov r3, r11
    mov r2, r7, asr #0x4
    str r8, [sp, #0x0]
    bl ActorCollision_TestPoint
    cmp r0, #0x0
    beq L_0200a918
    ldr r0, [r9, #0x4]
    cmp r7, r0
    biclt r0, r7, #0x7
    strlt r0, [r9, #0x4]
    ldr r0, [r9, #0xc]
    cmp r7, r0
    movgt r0, r7, asr #0x3
    addgt r0, r0, #0x1
    movgt r0, r0, lsl #0x3
    strgt r0, [r9, #0xc]
L_0200a918:
    add r7, r7, #0x1
L_0200a91c:
    cmp r7, r5
    ble L_0200a8d0
    bic r1, r6, #0x7
    add r0, r6, #0x8
    str r1, [r9, #0x0]
    bic r0, r0, #0x7
    str r0, [r9, #0x8]
L_0200a938:
    ldr r0, [r9, #0x0]
    mov r0, r0, lsl #0xc
    str r0, [r9, #0x0]
    ldr r0, [r9, #0x8]
    mov r0, r0, lsl #0xc
    str r0, [r9, #0x8]
    ldr r0, [r9, #0x4]
    mov r0, r0, lsl #0xc
    str r0, [r9, #0x4]
    ldr r0, [r9, #0xc]
    mov r0, r0, lsl #0xc
    str r0, [r9, #0xc]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size ActorCollision_ScanDirectionalRange, .-ActorCollision_ScanDirectionalRange

