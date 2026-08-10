#ifndef TINGLE_NATIVE_DATA_H
#define TINGLE_NATIVE_DATA_H

#include "tingle/types.h"

#include <stddef.h>

typedef struct TingleNativeData TingleNativeData;

typedef struct TingleNativeOverlayImage {
    u32 id;
    u32 load_address;
    u32 code_size;
    u32 bss_size;
    u32 constructor_start;
    u32 constructor_end;
    void *bytes;
    size_t size;
} TingleNativeOverlayImage;

/* Opens an extracted NitroFS root; files remain owned by the caller's directory. */
TingleNativeData *TingleNativeData_OpenDirectory(const char *root);

/* Opens a user-supplied NDS image and validates its FNT/FAT bounds. */
TingleNativeData *TingleNativeData_OpenRom(const char *path);

/* Closes the backing ROM when present and releases provider metadata. */
void TingleNativeData_Close(TingleNativeData *data);

/*
 * Reads one relative NitroFS path into newly allocated storage. The caller
 * owns the returned bytes and must free them. Returns zero on any lookup,
 * validation, allocation, seek, or read failure.
 */
int TingleNativeData_ReadFile(TingleNativeData *data, const char *path,
                              void **bytes, size_t *size);

/*
 * Copies an exact range from the ARM9 load image by its DS memory address.
 * ROM providers derive the mapping from the NDS header. Extracted providers
 * require a root containing arm9/arm9.yaml and arm9/arm9.bin. The caller owns
 * the returned bytes.
 */
int TingleNativeData_ReadArm9(TingleNativeData *data, u32 address,
                              size_t size, void **bytes);

/*
 * Loads an uncompressed ARM9 overlay by ID, appends zeroed BSS, and returns its
 * validated DS load metadata. The caller releases bytes with CloseOverlay.
 */
int TingleNativeData_ReadOverlay(TingleNativeData *data, u32 overlay_id,
                                 TingleNativeOverlayImage *overlay);

/* Releases the owned image bytes and clears all returned overlay metadata. */
void TingleNativeData_CloseOverlay(TingleNativeOverlayImage *overlay);

#endif
