#include "tingle/types.h"

/*
 * Recovered spawn helper for the presentation-backed actor. It builds the
 * engine's temporary actor descriptor, allocates the actor through the global
 * manager, installs playback parameters, and configures its bounds and flags.
 */

extern void *data_021052fc;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02007f0c(void *context, s32 index);
extern void func_020050a4(void *destination, const void *source);
extern void *ActorCollection_SpawnActorFromDescriptor(void *manager, const void *descriptor);
extern void ActorSpawnDescriptor_Init(void *destination, ...);
extern void func_0204d82c(void *actor, u16 value_1f2, u16 value_1f4,
                          u8 selection, u8 value_1ef);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Inputs are actor type, two playback values, a fixed-point position source,
 * a vector copied to actor+0x38, four descriptor arguments, a final playback
 * byte, and a flag selecting descriptor bit 0x200 for types other than 18.
 * Build a 100-byte descriptor with position components converted from fx32,
 * allocate the actor, configure it through func_0204d82c, set flags 0x1F0100,
 * and install -16/+16 bounds at 0x60..0x66. Return the new actor. Allocation
 * and engine manager state change; no hardware registers are touched directly.
 */
void *func_0204e2ac(s32 type, u32 value_1f4, u32 value_1f2,
                    const void *position, const void *vector_38,
                    u32 descriptor_arg0, u32 descriptor_arg1,
                    u32 descriptor_arg2, u32 selection,
                    u32 value_1ef, s32 enable_flag_200)
{
    u8 descriptor[100];
    u32 flags = 0x8018;
    if (type != 18 && enable_flag_200 != 0)
        flags |= 0x200;

    ActorSpawnDescriptor_Init(descriptor, 4, type, descriptor_arg0, descriptor_arg1,
                  descriptor_arg2, 2, selection,
                  FIELD(s32, position, 4) >> 12,
                  FIELD(s32, position, 8) >> 12,
                  FIELD(s32, position, 12) >> 12,
                  20, 4, flags, 0, 0, 0, 0, 0xff, 0, 0, 0, 0);

    void *manager = func_02007f0c(data_021052fc, 1);
    void *actor = ActorCollection_SpawnActorFromDescriptor(manager, descriptor);
    func_0204d82c(actor, value_1f2, value_1f4,
                  (u8)selection, (u8)value_1ef);
    func_020050a4((u8 *)actor + 0x38, vector_38);
    FIELD(u32, actor, 0x10) |= 0x1f0100;
    FIELD(s16, actor, 0x60) = -16;
    FIELD(s16, actor, 0x62) = -16;
    FIELD(s16, actor, 0x64) = 16;
    FIELD(s16, actor, 0x66) = 16;
    return actor;
}

