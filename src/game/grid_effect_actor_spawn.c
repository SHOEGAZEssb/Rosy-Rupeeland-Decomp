#include "tingle/types.h"

/*
 * Recovered singleton-slot spawn path for the grid/effect actor. It extracts
 * four resource values from an input object, builds a type-20 descriptor, and
 * stores the resulting actor through a slot returned by func_0204f9c0.
 */

extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02007f0c(void *context, s32 index);
extern void *func_02028388(s32 index);
extern void *func_0202ecd0(void *manager, const void *descriptor);
extern void func_0203ae14(void *destination, ...);
extern void **func_0204f9c0(void);
extern void func_02062728(void *subobject, void *source);
extern void func_02062918(void *source, s32 index);
extern u32 func_02063064(void);
extern u32 func_02063074(void);
extern u32 func_02063084(void);
extern u32 func_02063190(void);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are a fixed-point position, a resource/query source, and a signed
 * timer value. Obtain an available global actor slot; return null if none.
 * Extract four descriptor values by selecting source entry zero before each
 * getter, build a type-20 descriptor with flags 0x8218, and set descriptor bit
 * 0 when bits 18..19 of the latest global record's word 0x40 equal three.
 * Allocate the actor, store it through the slot, copy the timer to 0x218,
 * initialize subobject 0x1F4 from the source, set actor flags 0x1F0100 and
 * -16/+16 bounds, then return the actor. Global slot, manager, and subobject
 * state change; no hardware registers are accessed directly.
 */
void *func_0204f62c(const void *position, void *source, s16 timer)
{
    void **slot = func_0204f9c0();
    u8 descriptor[100];
    u32 resource0;
    u32 resource1;
    u32 resource2;
    u32 resource3;

    if (slot == 0)
        return 0;

    func_02062918(source, 0);
    resource0 = func_02063064();
    func_02062918(source, 0);
    resource1 = func_02063074();
    func_02062918(source, 0);
    resource2 = func_02063084();
    func_02062918(source, 0);
    resource3 = func_02063190();

    func_0203ae14(descriptor, 4, 20,
                  resource0, resource1, resource2, 2, resource3,
                  FIELD(s32, position, 4) >> 12,
                  FIELD(s32, position, 8) >> 12,
                  FIELD(s32, position, 12) >> 12,
                  20, 4, 0x8218, 0, 0, 0, 0, 0xff, 0, 0, 0, 0);

    void *records = FIELD(void *, data_021052fc, 0x24);
    s32 last_index = FIELD(s32, records, 0) - 1;
    void *record = func_02028388(last_index);
    if ((FIELD(u32, record, 0x40) >> 18 & 3) == 3)
        FIELD(u32, descriptor, 0x28) |= 1;

    void *manager = func_02007f0c(data_021052fc, 1);
    void *actor = func_0202ecd0(manager, descriptor);
    *slot = actor;
    FIELD(s16, actor, 0x218) = timer;
    func_02062728((u8 *)actor + 0x1f4, source);
    FIELD(u32, actor, 0x10) |= 0x1f0100;
    FIELD(s16, actor, 0x60) = -16;
    FIELD(s16, actor, 0x62) = -16;
    FIELD(s16, actor, 0x64) = 16;
    FIELD(s16, actor, 0x66) = 16;
    return actor;
}

