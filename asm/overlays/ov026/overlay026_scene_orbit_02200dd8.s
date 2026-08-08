.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_orbit.c. */
.extern func_ov026_02200d38


    .global func_ov026_02200dd8
func_ov026_02200dd8:
    ldr r2, [r0, #0x364]
    add r2, r2, r1
    cmp r2, #0x100
    str r2, [r0, #0x364]
    movgt r1, #0x100
    strgt r1, [r0, #0x364]
    bgt L_02200e00
    mvn r1, #0xff
    cmp r2, r1
    strlt r1, [r0, #0x364]
L_02200e00:
    ldr ip, L_02200e08
    bx ip
L_02200e08: .word func_ov026_02200d38
.size func_ov026_02200dd8, .-func_ov026_02200dd8

