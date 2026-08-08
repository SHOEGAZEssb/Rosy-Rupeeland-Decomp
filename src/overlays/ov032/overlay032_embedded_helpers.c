#include "tingle/types.h"

/* Overlay 32 embedded state and 0x6C-byte child lifecycle helpers. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov032_022022f8[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_ov032_0220142c(void *);
#ifdef __cplusplus
}
#endif

/*
 * Installs vtable 0x022022F8 in `state` and clears words +4/+8. Returns void;
 * only embedded object memory changes and its semantic class is not yet known.
 */
extern "C" void func_ov032_021fd7a4(void *state)
{
    FIELD(const void *, state, 0) = data_ov032_022022f8;
    FIELD(s32, state, 4) = 0;
    FIELD(s32, state, 8) = 0;
}

/*
 * Constructs a 0x6C-byte child by initializing resource set +0x0C and controller
 * +0x18. Returns `child`; only embedded resource/controller memory and SDK state
 * change.
 */
extern "C" void *func_ov032_021fd7c0(void *child)
{
    func_02071ea4((u8 *)child + 0xc);
    func_ov032_0220142c((u8 *)child + 0x18);
    return child;
}

/*
 * Releases resource set +0x0C and returns `child` without freeing its storage.
 * Resource SDK state changes; the controller has no recovered teardown call.
 */
extern "C" void *func_ov032_021fd7e0(void *child)
{
    func_02071eb8((u8 *)child + 0xc);
    return child;
}
