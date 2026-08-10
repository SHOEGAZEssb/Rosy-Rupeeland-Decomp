#include "tingle/types.h"

/*
 * Recovered global control surface for the 12-slot grid/effect actor registry.
 * It owns a shared resource, broadcasts virtual callbacks, forces active exit
 * states to finish, and reports how many actors are departing or finished.
 */

extern void *data_020f4e18;
extern void *data_021052fc;
extern u8 data_02105790[];
extern void *data_0210579c[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0202d494(void *value, void *actor);
extern void *Actor_GetCollection(void *actor);
extern void func_0204f990(void);
extern void func_02071d4c(void *archive, void *resource);
extern void *func_02071980(void *archive, u32 resource_id);
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef void (*ActorCallback)(void *actor);
typedef void (*ActorStateCallback)(void *actor, s32 value);

/*
 * Ignore all register inputs. Acquire shared resource 0x7005 from
 * data_020f4e18, store it at data_02105790+8, then initialize the registry
 * through func_0204f990. Returns nothing; resource and registry state change
 * without direct hardware access.
 */
void func_0204fafc(void)
{
    FIELD(void *, data_02105790, 8) = func_02071980(data_020f4e18, 0x7005);
    func_0204f990();
}

/*
 * Ignore all register inputs. If the shared resource at data_02105790+8 exists,
 * release it through func_02071d4c using data_020f4e18 and clear the pointer.
 * Returns nothing; resource state changes and hardware is not touched directly.
 */
void func_0204fb2c(void)
{
    void *resource = FIELD(void *, data_02105790, 8);
    if (resource != 0) {
        func_02071d4c(data_020f4e18, resource);
        FIELD(void *, data_02105790, 8) = 0;
    }
}

/*
 * Ignore all register inputs. For every occupied registry slot, invoke virtual
 * slot 0x1C on its actor. Returns nothing; registered actors may change through
 * their callbacks, and no hardware is accessed directly.
 */
void func_0204fb64(void)
{
    s32 i;
    for (i = 0; i < 12; i++) {
        void *actor = data_0210579c[i];
        if (actor != 0) {
            ActorCallback callback =
                *(ActorCallback *)((u8 *)FIELD(void *, actor, 0) + 0x1c);
            callback(actor);
        }
    }
}

/*
 * Ignore all register inputs. For every occupied registry slot, invoke virtual
 * slot 0x54 with value zero. Returns nothing; registered actor state may change
 * and hardware is not accessed directly.
 */
void func_0204fb9c(void)
{
    s32 i;
    for (i = 0; i < 12; i++) {
        void *actor = data_0210579c[i];
        if (actor != 0) {
            ActorStateCallback callback =
                *(ActorStateCallback *)((u8 *)FIELD(void *, actor, 0) + 0x54);
            callback(actor, 0);
        }
    }
}

/*
 * Ignore all register inputs. For each occupied actor whose low state bits at
 * 0x1F0 equal two, set presentation flags 0x14, change the state to three, and
 * finish it through Actor_GetCollection/func_0202d494. Finally set global flag 0x10
 * at data_021052fc+0x30B8. Returns nothing; actor/global state changes without
 * direct hardware effects.
 */
void func_0204fbdc(void)
{
    s32 i;
    for (i = 0; i < 12; i++) {
        void *actor = data_0210579c[i];
        if (actor != 0 && (FIELD(u16, actor, 0x1f0) & 3) == 2) {
            FIELD(u16, FIELD(void *, actor, 0x54), 0x24) |= 0x14;
            FIELD(u16, actor, 0x1f0) =
                (FIELD(u16, actor, 0x1f0) & (u16)~3) | 3;
            func_0202d494(Actor_GetCollection(actor), actor);
        }
    }
    FIELD(u32, data_021052fc, 0x30b8) |= 0x10;
}

/*
 * Ignore all register inputs. Count occupied slots whose low state bits at
 * actor+0x1F0 are two or three and return that count. No state, SDK, or hardware
 * effects occur.
 */
s32 func_0204fc6c(void)
{
    s32 i;
    s32 count = 0;
    for (i = 0; i < 12; i++) {
        void *actor = data_0210579c[i];
        if (actor != 0 && (FIELD(u16, actor, 0x1f0) & 3) >= 2)
            count++;
    }
    return count;
}

