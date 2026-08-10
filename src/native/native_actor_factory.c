/*
 * Host-side catalog of the recovered actor factory's allocation decisions.
 * It resolves descriptor routes as data but does not call NDS constructors.
 */
#include "tingle/native_actor_factory.h"

#include <stdlib.h>
#include <string.h>

enum {
    KIND2_TABLE_ADDRESS = 0x020E8380,
    KIND9_TABLE_ADDRESS = 0x020ED470,
    KIND3_TABLE_ADDRESS = 0x020ED638,
    FACTORY_TABLE_RECORD_SIZE = 0x30
};

static u16 ReadU16(const u8 *bytes)
{
    return (u16)bytes[0] | (u16)((u16)bytes[1] << 8);
}

/* Load only the selector bytes needed by the reconstructed factory matrix. */
s32 TingleNativeActorFactoryCatalog_Init(
    TingleNativeActorFactoryCatalog *catalog, TingleNativeData *data)
{
    void *kind2_records = NULL;
    void *kind9_records = NULL;
    void *kind3_table_records = NULL;
    u32 index;

    if (catalog == NULL) return 0;
    memset(catalog, 0, sizeof(*catalog));
    if (!TingleNativeData_ReadArm9(
            data, KIND2_TABLE_ADDRESS,
            TINGLE_NATIVE_KIND2_RECORD_COUNT * FACTORY_TABLE_RECORD_SIZE,
            &kind2_records) ||
        !TingleNativeData_ReadArm9(
            data, KIND9_TABLE_ADDRESS,
            TINGLE_NATIVE_KIND9_RECORD_COUNT * FACTORY_TABLE_RECORD_SIZE,
            &kind9_records) ||
        !TingleNativeData_ReadArm9(
            data, KIND3_TABLE_ADDRESS,
            TINGLE_NATIVE_KIND3_TABLE_RECORD_COUNT *
                TINGLE_NATIVE_KIND3_TABLE_RECORD_SIZE,
            &kind3_table_records)) {
        free(kind3_table_records);
        free(kind9_records);
        free(kind2_records);
        return 0;
    }
    for (index = 0; index < TINGLE_NATIVE_KIND2_RECORD_COUNT; ++index)
        catalog->kind2_classes[index] =
            ((const s8 *)kind2_records)[index * FACTORY_TABLE_RECORD_SIZE + 0x24];
    for (index = 0; index < TINGLE_NATIVE_KIND9_RECORD_COUNT; ++index)
        catalog->kind9_classes[index] =
            ((const u8 *)kind9_records)[index * FACTORY_TABLE_RECORD_SIZE + 1];
    memcpy(catalog->kind3_table_records, kind3_table_records,
           sizeof(catalog->kind3_table_records));
    free(kind3_table_records);
    free(kind9_records);
    free(kind2_records);
    catalog->loaded = 1;
    return 1;
}

static u16 ResolveKind4Size(u16 subtype)
{
    switch (subtype) {
    case 10: case 11: case 12: case 13: case 19: return 0x1FC;
    case 14: case 15: case 16: case 17: return 0x1F0;
    case 18: return 0x200;
    case 20: return 0x21C;
    case 21: case 22: case 24: case 25: case 27: case 28: case 29:
    case 31: case 32: case 35: return 0x200;
    case 26: case 34: case 36: case 37: case 104: case 107: case 108:
    case 112: return 0x204;
    case 30: case 33: return 0x218;
    case 38: case 100: case 101: case 102: case 103: case 110: return 0x208;
    case 113: return 0x20C;
    default: return 0;
    }
}

/* Reproduce the recovered kind/subtype allocation-size selection without dispatch. */
s32 TingleNativeActorFactoryCatalog_Resolve(
    const TingleNativeActorFactoryCatalog *catalog,
    const TingleNativeActorDescriptor *descriptor,
    TingleNativeActorFactorySpec *spec)
{
    static const u16 kind2_sizes[36] = {
        0x298, 0x2C8, 0x2C0, 0x2C0, 0x298, 0x29C,
        0x2B4, 0x2A8, 0x2AC, 0x29C, 0x29C, 0x29C,
        0x2A8, 0x2AC, 0x2A0, 0x2C0, 0x2A4, 0x2C4,
        0x30C, 0x29C, 0x2A0, 0x29C, 0x2D4, 0x2AC,
        0x29C, 0x2AC, 0x2B0, 0x2A4, 0x2C8, 0x2E8,
        0x2BC, 0x2B8, 0x324, 0x2AC, 0x2A0, 0x2AC
    };
    static const u16 kind3_sizes[25] = {
        0x208, 0x258, 0x208, 0x218, 0x208, 0x20C, 0x244,
        0x244, 0x244, 0x230, 0x248, 0x258, 0x20C, 0x20C,
        0x20C, 0x20C, 0x20C, 0x218, 0x21C, 0x20C, 0x22C,
        0x258, 0x208, 0x208, 0x208
    };
    s32 variant;
    u16 size = 0;

    if (catalog == NULL || !catalog->loaded || descriptor == NULL || spec == NULL)
        return 0;
    memset(spec, 0, sizeof(*spec));
    variant = descriptor->subtype;
    switch (descriptor->kind) {
    case 1:
        variant = 0;
        size = 0x2B8;
        break;
    case 2:
        if (descriptor->subtype >= TINGLE_NATIVE_KIND2_RECORD_COUNT) return 0;
        variant = catalog->kind2_classes[descriptor->subtype];
        if (variant < 0 || variant >= 36) return 0;
        size = kind2_sizes[variant];
        break;
    case 3:
        if (descriptor->subtype >= 25) return 0;
        size = kind3_sizes[descriptor->subtype];
        if (descriptor->subtype == 17 || descriptor->subtype == 18) {
            s16 key = (s16)ReadU16(descriptor->raw + 0x4E);
            u32 index;
            for (index = 0; index < TINGLE_NATIVE_KIND3_TABLE_RECORD_COUNT;
                 ++index) {
                const u8 *record = catalog->kind3_table_records[index];
                if ((s16)ReadU16(record) == key) {
                    spec->constructor_record_address =
                        KIND3_TABLE_ADDRESS +
                        index * TINGLE_NATIVE_KIND3_TABLE_RECORD_SIZE;
                    memcpy(spec->constructor_record, record,
                           sizeof(spec->constructor_record));
                    spec->constructor_record_valid = 1;
                }
            }
            if (!spec->constructor_record_valid) return 0;
        }
        break;
    case 4:
        size = ResolveKind4Size(descriptor->subtype);
        break;
    case 5:
        variant = 0;
        size = 0x2A8;
        break;
    case 6:
        if (descriptor->subtype == 1 || descriptor->subtype == 4)
            size = 0x250;
        else if (descriptor->subtype == 2)
            size = 0x23C;
        else if (descriptor->subtype == 3)
            size = 0x2A4;
        else {
            variant = 0;
            size = 0x1EC;
        }
        break;
    case 7:
        variant = 0;
        size = 0x2B8;
        break;
    case 8:
        variant = 0;
        size = 0x3E0;
        break;
    case 9:
        if (descriptor->subtype >= TINGLE_NATIVE_KIND9_RECORD_COUNT) return 0;
        variant = catalog->kind9_classes[descriptor->subtype];
        if (variant > 2) return 0;
        size = 0x274;
        break;
    default:
        return 0;
    }
    if (size == 0) return 0;
    spec->allocation_size = size;
    spec->factory_variant = (s16)variant;
    return 1;
}
