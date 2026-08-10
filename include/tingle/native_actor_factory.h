#ifndef TINGLE_NATIVE_ACTOR_FACTORY_H
#define TINGLE_NATIVE_ACTOR_FACTORY_H

#include "tingle/native_data.h"
#include "tingle/native_game_phase.h"

enum {
    TINGLE_NATIVE_KIND2_RECORD_COUNT = 150,
    TINGLE_NATIVE_KIND9_RECORD_COUNT = 4,
    TINGLE_NATIVE_KIND3_TABLE_RECORD_COUNT = 12,
    TINGLE_NATIVE_KIND3_TABLE_RECORD_SIZE = 0x0E
};

typedef struct TingleNativeActorFactoryCatalog {
    s8 kind2_classes[TINGLE_NATIVE_KIND2_RECORD_COUNT];
    u8 kind9_classes[TINGLE_NATIVE_KIND9_RECORD_COUNT];
    u8 kind3_table_records[TINGLE_NATIVE_KIND3_TABLE_RECORD_COUNT]
                          [TINGLE_NATIVE_KIND3_TABLE_RECORD_SIZE];
    s32 loaded;
} TingleNativeActorFactoryCatalog;

typedef struct TingleNativeActorFactorySpec {
    u16 allocation_size;
    s16 factory_variant;
    u32 constructor_record_address;
    u8 constructor_record[TINGLE_NATIVE_KIND3_TABLE_RECORD_SIZE];
    s32 constructor_record_valid;
} TingleNativeActorFactorySpec;

/* Loads the two ARM9 selector tables used by the recovered actor factory. */
s32 TingleNativeActorFactoryCatalog_Init(
    TingleNativeActorFactoryCatalog *catalog, TingleNativeData *data);

/* Resolves the retail allocation size and type-local constructor route. */
s32 TingleNativeActorFactoryCatalog_Resolve(
    const TingleNativeActorFactoryCatalog *catalog,
    const TingleNativeActorDescriptor *descriptor,
    TingleNativeActorFactorySpec *spec);

#endif
