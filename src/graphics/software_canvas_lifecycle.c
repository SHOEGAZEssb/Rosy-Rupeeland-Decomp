#include "tingle/heap.h"
#include "tingle/software_canvas.h"

/*
 * Construction and destruction of a lightweight 16-bit software canvas. The
 * object retains a caller-owned pixel buffer and row stride; its destructor
 * does not free that buffer, while the deleting destructor frees only the
 * canvas object itself through the game's heap wrapper.
 */

#ifndef MATCHING
/*
 * Install the recovered vtable, clear all four payload fields, and return
 * self. No allocation, SDK call, or hardware access occurs.
 */
SoftwareCanvas *SoftwareCanvas_Init(SoftwareCanvas *self)
{
    self->vtable = &data_020d4190;
    self->field_04 = 0;
    self->pixels = 0;
    self->stride = 0;
    self->field_10 = 0;
    return self;
}

/*
 * Install the recovered vtable and retain field04, pixels, stride, and
 * field10 verbatim. The pixel buffer remains caller-owned; return self.
 */
SoftwareCanvas *SoftwareCanvas_InitWithBuffer(SoftwareCanvas *self, s32 field04,
                              u16 *pixels, s32 stride, s32 field10)
{
    self->vtable = &data_020d4190;
    self->field_04 = field04;
    self->pixels = pixels;
    self->stride = stride;
    self->field_10 = field10;
    return self;
}

/*
 * Non-deleting destructor. It intentionally leaves every field and the
 * caller-owned pixel buffer untouched, then returns self.
 */
SoftwareCanvas *SoftwareCanvas_Destroy(SoftwareCanvas *self)
{
    return self;
}

/*
 * Free the canvas object through Heap_Free and return its former address.
 * The pixel buffer is not released and the returned pointer is invalidated.
 */
SoftwareCanvas *SoftwareCanvas_DestroyAndFree(SoftwareCanvas *self)
{
    Heap_Free(self);
    return self;
}
#else
/* Matching forms implement the documented portable C above. */
asm SoftwareCanvas *SoftwareCanvas_Init(SoftwareCanvas *)
{
    ldr r2, =data_020d4190
    mov r1, #0
    str r2, [r0]
    str r1, [r0, #4]
    str r1, [r0, #8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    bx lr
}

asm SoftwareCanvas *SoftwareCanvas_InitWithBuffer(SoftwareCanvas *, s32, u16 *, s32, s32)
{
    stmdb sp!, {r3, lr}
    ldr lr, =data_020d4190
    ldr ip, [sp, #8]
    str lr, [r0]
    stmib r0, {r1, r2, r3, ip}
    ldmia sp!, {r3, pc}
}

asm SoftwareCanvas *SoftwareCanvas_Destroy(SoftwareCanvas *)
{
    bx lr
}

asm SoftwareCanvas *SoftwareCanvas_DestroyAndFree(SoftwareCanvas *)
{
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
}
#endif
