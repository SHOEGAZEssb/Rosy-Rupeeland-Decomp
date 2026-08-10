/*
 * Native replacements for recovered NitroSDK memory-interface dependencies.
 *
 * LZ8/LZ10 is part of the game's resource and save-data contracts. The
 * checked entry point is used at host-controlled I/O boundaries; the SDK-name
 * wrapper retains the retail caller contract, which supplies no buffer sizes.
 */
#include "tingle/native_mi.h"

/* Reads the expanded length stored in the three-byte LZ10 header field. */
static size_t ReadExpandedSize(const u8 *source)
{
    return (size_t)source[1] | ((size_t)source[2] << 8) |
           ((size_t)source[3] << 16);
}

/* Expands literals and backward copies while optionally enforcing bounds. */
static s32 UncompressLZ8(const u8 *source, size_t source_size,
                        u8 *destination, size_t destination_size,
                        size_t *written_size, s32 checked)
{
    size_t source_at = 4;
    size_t destination_at = 0;
    size_t expanded_size;

    if (source == NULL || destination == NULL || source[0] != 0x10) return 0;
    expanded_size = ReadExpandedSize(source);
    if (expanded_size == 0 ||
        (checked && (source_size < 4 || expanded_size > destination_size)))
        return 0;

    while (destination_at < expanded_size) {
        u8 flags;
        u32 bit;

        if (checked && source_at >= source_size) return 0;
        flags = source[source_at++];
        for (bit = 0; bit < 8 && destination_at < expanded_size; ++bit) {
            if ((flags & (0x80u >> bit)) == 0) {
                if (checked && source_at >= source_size) return 0;
                destination[destination_at++] = source[source_at++];
            } else {
                size_t length;
                size_t distance;
                size_t copy;

                if (checked && (source_at > source_size ||
                                source_size - source_at < 2)) return 0;
                length = (size_t)(source[source_at] >> 4) + 3;
                distance = (size_t)((source[source_at] & 0x0f) << 8) |
                           source[source_at + 1];
                distance += 1;
                source_at += 2;
                if (distance > destination_at ||
                    length > expanded_size - destination_at) return 0;
                for (copy = 0; copy < length; ++copy) {
                    destination[destination_at] =
                        destination[destination_at - distance];
                    ++destination_at;
                }
            }
        }
    }
    if (written_size != NULL) *written_size = expanded_size;
    return 1;
}

/* Expands one stream only when all source and destination accesses are valid. */
s32 TingleNativeMI_UncompressLZ8Checked(
    const void *source, size_t source_size, void *destination,
    size_t destination_size, size_t *written_size)
{
    if (written_size != NULL) *written_size = 0;
    if (source == NULL || source_size < 4) return 0;
    return UncompressLZ8((const u8 *)source, source_size, (u8 *)destination,
                         destination_size, written_size, 1);
}

/* Preserves NitroSDK's unbounded signature for already-validated game callers. */
void MI_UncompressLZ8(const void *source, void *destination)
{
    (void)UncompressLZ8((const u8 *)source, 0, (u8 *)destination, 0, NULL, 0);
}
