#include "tingle/types.h"

/* Overlay 31 main scene child/resource teardown and deleting variant. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov031_021fe774[];

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteGroup_Destroy(void *);
extern void func_020927b8(void *);
extern void func_02071eb8(void *);
extern void Heap_Free(void *);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay031Destructor)(void *);

/* Invokes the requested virtual teardown slot on a non-null child. */
static void invoke_child_slot(void *child, s32 slot)
{
    if (child != 0) {
        void **vtable = FIELD(void **, child, 0);
        ((Overlay031Destructor)vtable[slot])(child);
    }
}

/* Shared cleanup for the recovered preserving and deleting destructors. */
static void teardown_scene(void *scene)
{
    FIELD(const void *, scene, 0) = data_ov031_021fe774;
    FIELD(u32, scene, 0x20) &= ~0x400;
    invoke_child_slot(FIELD(void *, scene, 0x548), 2);
    invoke_child_slot(FIELD(void *, scene, 0x98), 1);
    GraphicsSpriteGroup_Destroy(FIELD(void *, scene, 0x58));
    func_020927b8((u8 *)scene + 0x70);
    func_02071eb8((u8 *)scene + 0x5c);
}

/*
 * Clears scene flag 0x400, invokes virtual slot 2 on effect +0x548 and virtual
 * slot 1 on dialog +0x98 when present, releases renderer +0x58, graphics config
 * +0x70, and resource set +0x5C, and returns `scene` without freeing its storage.
 * Child heap ownership and graphics/resource SDK state are released.
 */
extern "C" void *func_ov031_021fdb60(void *scene)
{
    teardown_scene(scene);
    return scene;
}

/*
 * Performs the same teardown as 0x021FDB60 and then frees `scene`. Returns the
 * original pointer after freeing it, matching the recovered ABI; it is dangling.
 */
extern "C" void *func_ov031_021fdbd0(void *scene)
{
    teardown_scene(scene);
    Heap_Free(scene);
    return scene;
}
