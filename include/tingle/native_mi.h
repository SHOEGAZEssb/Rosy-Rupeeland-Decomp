#ifndef TINGLE_NATIVE_MI_H
#define TINGLE_NATIVE_MI_H

#include "tingle/types.h"

#include <stddef.h>

/*
 * Expands one Nintendo LZ8/LZ10 stream with explicit host buffer bounds.
 * Returns zero for a malformed stream or insufficient destination storage.
 */
s32 TingleNativeMI_UncompressLZ8Checked(
    const void *source, size_t source_size, void *destination,
    size_t destination_size, size_t *written_size);

/* Native implementation of the NitroSDK entry point used by recovered code. */
void MI_UncompressLZ8(const void *source, void *destination);

#endif
