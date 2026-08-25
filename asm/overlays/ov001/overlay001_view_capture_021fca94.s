    .text
    .global Overlay001_CaptureViewState
Overlay001_CaptureViewState: ; 0x021fca94
    ldr ip, [r1, #0x1bc]
    ldr r2, [r1, #0x1cc]
    ldr r3, [ip, #0x14]
    ldr r1, [ip, #0xc]
    stmia r0, {r1, r2, r3}
    bx lr
    .size Overlay001_CaptureViewState, .-Overlay001_CaptureViewState
