; Matching retail form; see src/game/actor_attachment_slot_resource.c.
.text
    .global func_02039714
    .type func_02039714, @function
func_02039714: ; 0x02039714
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
    .size func_02039714, . - func_02039714
