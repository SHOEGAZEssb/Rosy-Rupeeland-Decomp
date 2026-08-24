#ifndef TINGLE_GRAPHICS_AFFINE_MATRIX_CACHE_H
#define TINGLE_GRAPHICS_AFFINE_MATRIX_CACHE_H

#include "tingle/types.h"

enum { GRAPHICS_AFFINE_MATRIX_CACHE_CAPACITY = 32 };

typedef struct GraphicsAffineMatrixCacheEntry GraphicsAffineMatrixCacheEntry;

/* One indexed affine matrix descriptor bound into an external OAM buffer. */
struct GraphicsAffineMatrixCacheEntry {
    GraphicsAffineMatrixCacheEntry *field_00;
    GraphicsAffineMatrixCacheEntry *next;
    void *field_08;
    s16 *affineParameters;
    u32 oamAffineIndex;
};

/* Fixed affine cache; entries before nextFree contain this frame's matrices. */
typedef struct GraphicsAffineMatrixCache {
    GraphicsAffineMatrixCacheEntry entries[GRAPHICS_AFFINE_MATRIX_CACHE_CAPACITY];
    GraphicsAffineMatrixCacheEntry *field_280;
    GraphicsAffineMatrixCacheEntry *field_284;
    GraphicsAffineMatrixCacheEntry *searchBegin;
    GraphicsAffineMatrixCacheEntry *nextFree;
    GraphicsAffineMatrixCacheEntry *field_290;
} GraphicsAffineMatrixCache;

typedef char GraphicsAffineMatrixCacheEntrySizeCheck[
    sizeof(GraphicsAffineMatrixCacheEntry) == 0x14 ? 1 : -1];
typedef char GraphicsAffineMatrixCacheSizeCheck[
    sizeof(GraphicsAffineMatrixCache) == 0x294 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsAffineMatrixCacheEntry_Init(GraphicsAffineMatrixCacheEntry *entry);
void GraphicsAffineMatrixCacheEntry_Destroy(GraphicsAffineMatrixCacheEntry *entry);
GraphicsAffineMatrixCache *GraphicsAffineMatrixCache_Init(
    GraphicsAffineMatrixCache *cache);
void GraphicsAffineMatrixCache_BindOamBuffer(GraphicsAffineMatrixCache *cache,
                                             void *oamBuffer);
GraphicsAffineMatrixCacheEntry *GraphicsAffineMatrixCache_FindMatrix(
    GraphicsAffineMatrixCache *cache, const s16 matrix[4]);
GraphicsAffineMatrixCacheEntry *GraphicsAffineMatrixCache_Allocate(
    GraphicsAffineMatrixCache *cache);

#ifdef __cplusplus
}
#endif

#endif
