#ifndef TINGLE_NATIVE_DATA_H
#define TINGLE_NATIVE_DATA_H

#include <stddef.h>

typedef struct TingleNativeData TingleNativeData;

/* Opens either an extracted-ROM root or its files/ NitroFS directory. */
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

#endif
