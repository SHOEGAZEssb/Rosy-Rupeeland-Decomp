#ifndef TINGLE_PALETTE_BUFFER_H
#define TINGLE_PALETTE_BUFFER_H

#include "tingle/types.h"

typedef struct PaletteBuffer PaletteBuffer;
typedef struct ExtendedPaletteBuffer ExtendedPaletteBuffer;

typedef struct PaletteBufferVTable {
    void *destroy;
    void *destroyAndFree;
    void *reserved08;
    void *typeInfo;
} PaletteBufferVTable;

typedef struct ExtendedPaletteBufferVTable {
    void *destroy;
    void *destroyAndFree;
} ExtendedPaletteBufferVTable;

struct PaletteBuffer {
    PaletteBufferVTable *vtable;
    u16 colors[256];
    s32 dirty;
};

struct ExtendedPaletteBuffer {
    ExtendedPaletteBufferVTable *vtable;
    u8 data[0x8000];
    s32 dirty;
};

typedef struct PaletteBufferData {
    PaletteBufferVTable mainExtendedVTable;
    PaletteBufferVTable mainVTable;
    PaletteBufferVTable baseVTable;
    PaletteBufferVTable subVTable;
    ExtendedPaletteBufferVTable subExtendedVTable;
    char subExtendedTypeName[20];
    void *subExtendedBaseType;
    ExtendedPaletteBufferVTable baseExtendedVTable;
} PaletteBufferData;

typedef char PaletteBufferSizeCheck[sizeof(PaletteBuffer) == 0x208 ? 1 : -1];
typedef char ExtendedPaletteBufferSizeCheck[
    sizeof(ExtendedPaletteBuffer) == 0x8008 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern PaletteBufferData gPaletteBufferData;

PaletteBuffer *PaletteBuffer_Init(PaletteBuffer *buffer);
PaletteBuffer *PaletteBuffer_Destroy(PaletteBuffer *buffer);
PaletteBuffer *PaletteBuffer_DestroyAndFree(PaletteBuffer *buffer);
void PaletteBuffer_Write(PaletteBuffer *buffer, const void *source, u32 offset,
                         u32 size);

PaletteBuffer *MainBgPaletteBuffer_Init(PaletteBuffer *buffer);
PaletteBuffer *MainBgPaletteBuffer_Destroy(PaletteBuffer *buffer);
PaletteBuffer *MainBgPaletteBuffer_DestroyAndFree(PaletteBuffer *buffer);
void MainBgPaletteBuffer_Flush(PaletteBuffer *buffer);

PaletteBuffer *SubBgPaletteBuffer_Init(PaletteBuffer *buffer);
PaletteBuffer *SubBgPaletteBuffer_Destroy(PaletteBuffer *buffer);
PaletteBuffer *SubBgPaletteBuffer_DestroyAndFree(PaletteBuffer *buffer);
void SubBgPaletteBuffer_Flush(PaletteBuffer *buffer);

ExtendedPaletteBuffer *ExtendedPaletteBuffer_Destroy(
    ExtendedPaletteBuffer *buffer);
ExtendedPaletteBuffer *ExtendedPaletteBuffer_DestroyAndFree(
    ExtendedPaletteBuffer *buffer);
void ExtendedPaletteBuffer_Write(ExtendedPaletteBuffer *buffer,
                                 const void *source, u32 offset, u32 size);

ExtendedPaletteBuffer *MainBgExtendedPaletteBuffer_Init(
    ExtendedPaletteBuffer *buffer);
ExtendedPaletteBuffer *MainBgExtendedPaletteBuffer_Destroy(
    ExtendedPaletteBuffer *buffer);
ExtendedPaletteBuffer *MainBgExtendedPaletteBuffer_DestroyAndFree(
    ExtendedPaletteBuffer *buffer);
void MainBgExtendedPaletteBuffer_Flush(ExtendedPaletteBuffer *buffer);

ExtendedPaletteBuffer *SubBgExtendedPaletteBuffer_Init(
    ExtendedPaletteBuffer *buffer);
ExtendedPaletteBuffer *SubBgExtendedPaletteBuffer_Destroy(
    ExtendedPaletteBuffer *buffer);
ExtendedPaletteBuffer *SubBgExtendedPaletteBuffer_DestroyAndFree(
    ExtendedPaletteBuffer *buffer);
void SubBgExtendedPaletteBuffer_Flush(ExtendedPaletteBuffer *buffer);

#ifdef __cplusplus
}
#endif

#endif
