.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_sprite_flags_clear.c.

.global func_ov090_0221bc5c
func_ov090_0221bc5c:
    ldr r2, [r0, #0x4]
    mvn r3, r1
    ldrh r1, [r2, #0x24]
    and r1, r1, r3
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x8]
    ldrh r0, [r1, #0x24]
    and r0, r0, r3
    strh r0, [r1, #0x24]
    bx lr
.size func_ov090_0221bc5c, . - func_ov090_0221bc5c
