.text
.global UtilAnimationResource_ApplyHandlePosition
.type UtilAnimationResource_ApplyHandlePosition, @function

UtilAnimationResource_ApplyHandlePosition:
    ldr r3, [r2, #4]
    mvn r0, #0x3f
    cmp r3, r0
    ble hidden
    cmp r3, #0x140
    bge hidden
    ldr r3, [r2, #8]
    add r0, r0, #0xe
    cmp r3, r0
    ble hidden
    cmp r3, #0xf2
    bge hidden
    ldrh r0, [r1, #0x24]
    bic r0, r0, #8
    strh r0, [r1, #0x24]
    ldmib r2, {r0, r3}
    strh r0, [r1, #0x2c]
    strh r3, [r1, #0x2e]
    bx lr
hidden:
    ldrh r0, [r1, #0x24]
    orr r0, r0, #8
    strh r0, [r1, #0x24]
    bx lr
    .size UtilAnimationResource_ApplyHandlePosition, .-UtilAnimationResource_ApplyHandlePosition
