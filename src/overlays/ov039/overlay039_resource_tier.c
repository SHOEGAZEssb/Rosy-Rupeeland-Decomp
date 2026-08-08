#include "tingle/types.h"

/*
 * Overlay 39 count-tier calculation and tier-specific object resource reload.
 * These recovered helpers map the remaining signed count to one of three tiers
 * and replace resources on the central and three attached objects.
 */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0209a07c(void *object);
extern void func_0209a0d8(void *object, s32 firstId, s32 secondId,
                           s32 thirdId, void *ownerArgument, s32 mode);
extern void func_ov039_021fd84c(void *scene, void *object,
                                u8 orientation, u8 enabled);
#ifdef __cplusplus
}
#endif

/*
 * Compute 2 - ((signed count +0x1CA8 - 1) / 10), clamp the result to 0..2,
 * and return it. The division truncates toward zero through the SDK helper in
 * the exact implementation. No state changes occur.
 */
extern "C" s32 func_ov039_021feff0(void *scene)
{
    s32 result = 2 - ((FIELD(s16, scene, 0x1ca8) - 1) / 10);
    if (result < 0) result = 0;
    if (result > 2) result = 2;
    return result;
}

static void reloadObject(void *scene, void *object, s32 first, s32 second,
                         s32 third, s32 mode)
{
    func_0209a0d8(object, first, second, third,
                   FIELD(void *, FIELD(void *, scene, 0x48), 0), mode);
}

/*
 * If signed count +0x1CA8 is positive, derive bucket count/10. Bucket one
 * resets and reloads +0x98 with IDs 0x1271/0x1285/0x1273 (mode 2), then resets
 * +0x74/+0x78/+0x7C and reloads all three from base 0x127D with third 0x127F;
 * middle is 0x127E for variant +0x1CB2 zero or 0x1288 otherwise. Bucket two
 * similarly reloads +0x98 with 0x1271/0x1284/0x1273 and the attached objects
 * from base 0x127A with third 0x127C and middle 0x127B (variant zero) or 0x1287.
 * Other buckets do not reload resources.
 *
 * In all cases configure +0x98/+0x74/+0x78 with orientation one and +0x7C
 * with orientation zero, all enabled, through func_ov039_021fd84c. Input is
 * scene; returns no value. Object resource/archive and renderer state change.
 */
extern "C" void func_ov039_021ff01c(void *scene)
{
    s32 count = FIELD(s16, scene, 0x1ca8);
    if (count > 0) {
        s32 bucket = count / 10;
        if (bucket == 1 || bucket == 2) {
            void *object98 = FIELD(void *, scene, 0x98);
            func_0209a07c(object98);
            reloadObject(scene, object98, 0x1271,
                         bucket == 1 ? 0x1285 : 0x1284, 0x1273, 2);
            for (s32 i = 0; i < 3; i++)
                func_0209a07c(FIELD(void *, scene, 0x74 + i * 4));

            s32 first = bucket == 1 ? 0x127d : 0x127a;
            s32 third = first + 2;
            s32 second;
            if (FIELD(u16, scene, 0x1cb2) == 0)
                second = first + 1;
            else
                second = first + (bucket == 1 ? 0x0b : 0x0d);
            for (s32 i = 0; i < 3; i++)
                reloadObject(scene, FIELD(void *, scene, 0x74 + i * 4),
                             first, second, third, 1);
        }
    }
    func_ov039_021fd84c(scene, FIELD(void *, scene, 0x98), 1, 1);
    func_ov039_021fd84c(scene, FIELD(void *, scene, 0x74), 1, 1);
    func_ov039_021fd84c(scene, FIELD(void *, scene, 0x78), 1, 1);
    func_ov039_021fd84c(scene, FIELD(void *, scene, 0x7c), 0, 1);
}
