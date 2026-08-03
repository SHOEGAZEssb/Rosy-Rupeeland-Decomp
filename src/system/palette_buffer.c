#include "tingle/palette_buffer.h"

/*
 * CPU-side mirrors for main/sub BG palettes and their 32 KiB extended BG
 * palettes. Writes mark a mirror dirty; explicit flush methods perform the
 * corresponding NitroSDK transfer and clear the dirty flag.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void Heap_Free(void *allocation);
extern void MIi_CpuCopy16(const void *source, void *destination, u32 size);

extern void func_020b2058(const void *, u32, u32); /* GX_LoadBGPltt */
extern void func_020b1ff0(const void *, u32, u32); /* GXS_LoadBGPltt */
extern void func_020b1618(void); /* GX_BeginLoadBGExtPltt */
extern void func_020b1598(const void *, u32, u32); /* GX_LoadBGExtPltt */
extern void func_020b1534(void); /* GX_EndLoadBGExtPltt */
extern void func_020b13d4(void); /* GXS_BeginLoadBGExtPltt */
extern void func_020b1360(const void *, u32, u32); /* GXS_LoadBGExtPltt */
extern void func_020b1314(void); /* GXS_EndLoadBGExtPltt */

#ifdef __cplusplus
}
#endif

/* Install the base vtable and clear all 256 colors and the dirty flag. */
#ifndef MATCHING
PaletteBuffer *PaletteBuffer_Init(PaletteBuffer *buffer)
{
    int i;
    buffer->vtable = &gPaletteBufferData.baseVTable;
    buffer->dirty = 0;
    for (i = 0; i < 256; i++) {
        buffer->colors[i] = 0;
    }
    return buffer;
}
#else
/* MWCC otherwise replaces or reshapes the explicit halfword-clear loop. */
asm PaletteBuffer *PaletteBuffer_Init(PaletteBuffer *buffer)
{
    ldr r1, =gPaletteBufferData+0x20
    mov r3, #0
    str r1, [r0]
    str r3, [r0, #0x204]
    mov r2, r3
    b palette_init_test
palette_init_loop:
    add r1, r0, r3, lsl #1
    strh r2, [r1, #4]
    add r3, r3, #1
palette_init_test:
    cmp r3, #0x100
    blt palette_init_loop
    bx lr
}
#endif

/* The base 512-byte palette mirror owns no subordinate resources. */
PaletteBuffer *PaletteBuffer_Destroy(PaletteBuffer *buffer)
{
    return buffer;
}

/* Release a heap-owned base palette mirror and return its former address. */
PaletteBuffer *PaletteBuffer_DestroyAndFree(PaletteBuffer *buffer)
{
    Heap_Free(buffer);
    return buffer;
}

/* Copy size bytes to an even-aligned byte offset and mark the mirror dirty. */
void PaletteBuffer_Write(PaletteBuffer *buffer, const void *source, u32 offset,
                         u32 size)
{
    MIi_CpuCopy16(source, (u8 *)buffer->colors + (offset & ~1), size);
    buffer->dirty = 1;
}

/* Initialize a 512-byte main-engine BG palette mirror. */
PaletteBuffer *MainBgPaletteBuffer_Init(PaletteBuffer *buffer)
{
    PaletteBuffer_Init(buffer);
    buffer->vtable = &gPaletteBufferData.mainVTable;
    return buffer;
}

/* The main BG specialization adds no destructor-side state changes. */
PaletteBuffer *MainBgPaletteBuffer_Destroy(PaletteBuffer *buffer)
{
    return buffer;
}

/* Release a heap-owned main BG palette mirror. */
PaletteBuffer *MainBgPaletteBuffer_DestroyAndFree(PaletteBuffer *buffer)
{
    Heap_Free(buffer);
    return buffer;
}

/* Upload all 0x200 bytes to main BG palette RAM when dirty. */
void MainBgPaletteBuffer_Flush(PaletteBuffer *buffer)
{
    if (buffer->dirty == 0) return;
    buffer->dirty = 0;
    func_020b2058(buffer->colors, 0, 0x200);
}

/* Initialize a 512-byte sub-engine BG palette mirror. */
PaletteBuffer *SubBgPaletteBuffer_Init(PaletteBuffer *buffer)
{
    PaletteBuffer_Init(buffer);
    buffer->vtable = &gPaletteBufferData.subVTable;
    return buffer;
}

/* The sub BG specialization adds no destructor-side state changes. */
PaletteBuffer *SubBgPaletteBuffer_Destroy(PaletteBuffer *buffer)
{
    return buffer;
}

/* Release a heap-owned sub BG palette mirror. */
PaletteBuffer *SubBgPaletteBuffer_DestroyAndFree(PaletteBuffer *buffer)
{
    Heap_Free(buffer);
    return buffer;
}

/* Upload all 0x200 bytes to sub BG palette RAM when dirty. */
void SubBgPaletteBuffer_Flush(PaletteBuffer *buffer)
{
    if (buffer->dirty == 0) return;
    buffer->dirty = 0;
    func_020b1ff0(buffer->colors, 0, 0x200);
}

/* The extended-palette base destructor has no observable effect. */
ExtendedPaletteBuffer *ExtendedPaletteBuffer_Destroy(
    ExtendedPaletteBuffer *buffer)
{
    return buffer;
}

/* Release a heap-owned extended-palette mirror. */
ExtendedPaletteBuffer *ExtendedPaletteBuffer_DestroyAndFree(
    ExtendedPaletteBuffer *buffer)
{
    Heap_Free(buffer);
    return buffer;
}

/* Copy size bytes to an even-aligned offset and mark the 32 KiB mirror dirty. */
void ExtendedPaletteBuffer_Write(ExtendedPaletteBuffer *buffer,
                                 const void *source, u32 offset, u32 size)
{
    MIi_CpuCopy16(source, buffer->data + (offset & ~1), size);
    buffer->dirty = 1;
}

/* Install the main extended-BG vtable and clear its dirty flag. */
ExtendedPaletteBuffer *MainBgExtendedPaletteBuffer_Init(
    ExtendedPaletteBuffer *buffer)
{
    buffer->vtable = &gPaletteBufferData.baseExtendedVTable;
    buffer->dirty = 0;
    buffer->vtable = (ExtendedPaletteBufferVTable *)&gPaletteBufferData.mainExtendedVTable;
    return buffer;
}

/* The main extended-BG specialization adds no destructor-side state. */
ExtendedPaletteBuffer *MainBgExtendedPaletteBuffer_Destroy(
    ExtendedPaletteBuffer *buffer)
{
    return buffer;
}

/* Release a heap-owned main extended-BG palette mirror. */
ExtendedPaletteBuffer *MainBgExtendedPaletteBuffer_DestroyAndFree(
    ExtendedPaletteBuffer *buffer)
{
    Heap_Free(buffer);
    return buffer;
}

/* Remap, upload, and restore the complete main extended BG palette when dirty. */
void MainBgExtendedPaletteBuffer_Flush(ExtendedPaletteBuffer *buffer)
{
    if (buffer->dirty == 0) return;
    buffer->dirty = 0;
    func_020b1618();
    func_020b1598(buffer->data, 0, 0x8000);
    func_020b1534();
}

/* Install the sub extended-BG vtable and clear its dirty flag. */
ExtendedPaletteBuffer *SubBgExtendedPaletteBuffer_Init(
    ExtendedPaletteBuffer *buffer)
{
    buffer->vtable = &gPaletteBufferData.baseExtendedVTable;
    buffer->dirty = 0;
    buffer->vtable = &gPaletteBufferData.subExtendedVTable;
    return buffer;
}

/* The sub extended-BG specialization adds no destructor-side state. */
ExtendedPaletteBuffer *SubBgExtendedPaletteBuffer_Destroy(
    ExtendedPaletteBuffer *buffer)
{
    return buffer;
}

/* Release a heap-owned sub extended-BG palette mirror. */
ExtendedPaletteBuffer *SubBgExtendedPaletteBuffer_DestroyAndFree(
    ExtendedPaletteBuffer *buffer)
{
    Heap_Free(buffer);
    return buffer;
}

/* Remap, upload, and restore the complete sub extended BG palette when dirty. */
void SubBgExtendedPaletteBuffer_Flush(ExtendedPaletteBuffer *buffer)
{
    if (buffer->dirty == 0) return;
    buffer->dirty = 0;
    func_020b13d4();
    func_020b1360(buffer->data, 0, 0x8000);
    func_020b1314();
}
