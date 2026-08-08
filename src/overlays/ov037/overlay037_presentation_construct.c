#include "tingle/types.h"

/* Overlay 37 top-level presentation construction and graphics/resource bootstrap. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fee94[];
extern const u8 data_ov037_021feec8[];
extern const u8 data_ov037_021feed0[];
extern const u32 data_ov037_021fec98[2];
extern void *data_020f4e14[];
extern void *gDebugFont[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02091e28(void *presentation, void *argument);
extern void func_02092364(void *camera);
extern void func_ov043_0220b740(void *state);
extern void G3X_Init(void);
extern void func_020923a4(void *camera);
extern void func_02075238(void *resource);
extern void func_02074568(void *resource);
extern void func_020ae7b0(void);
extern void func_020ae6dc(void);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020774ac(void *owner, s32 capacity, s32 mode);
extern void func_ov048_0220b7b8(void *state);
extern void func_02092850(s32 mode);
extern void func_020b0300(s32 a, s32 b, s32 c, s32 d, s32 e);
extern void *func_ov037_021fd7e4(void *scene, void *owner);
extern void func_ov037_021fe4d4(void *node, void *value24, void *value28);
#ifdef __cplusplus
}
#endif

/*
 * Constructs the top-level overlay presentation. It initializes the common
 * presentation and embedded camera/+0x94 subsystem, resets the geometry engine,
 * activates shared graphics and debug-font resources, allocates a 0x624-byte
 * resource owner at +0x58 and the 0x1E0-byte main scene at +0x5C, enables flag
 * 0x400 at +0x20, and initializes retained node values from the two-word table
 * at data_ov037_021fec98. Returns presentation; heap, graphics hardware, shared
 * resources, and debug-font state change. The ov043/ov048-addressed calls are
 * shared implementations reused by several overlays, as confirmed by symbols.
 */
extern "C" void *func_ov037_021fe4fc(void *presentation, void *argument)
{
    func_02091e28(presentation, argument);
    FIELD(const void *, presentation, 0) = data_ov037_021fee94;
    func_02092364((u8 *)presentation + 0x60);
    func_ov043_0220b740((u8 *)presentation + 0x94);
    FIELD(void *, presentation, 0x54) = argument;
    G3X_Init();
    FIELD(s32, presentation, 0x50) = 0;
    func_020923a4((u8 *)presentation + 0x60);

    func_02075238(data_020f4e14[0]);
    func_02074568(data_020f4e14[0]);
    func_020ae7b0();
    func_02075238(gDebugFont[0]);
    func_02074568(gDebugFont[0]);
    func_020ae6dc();

    void *owner = Heap_Alloc(0x624, data_ov037_021feec8, 4, gHeapContext);
    if (owner != 0)
        owner = func_020774ac(owner, 4, 2);
    FIELD(void *, presentation, 0x58) = owner;
    func_ov048_0220b7b8((u8 *)presentation + 0x94);
    FIELD(s32, presentation, 0x48) = 0x11;
    func_02092850(0);
    func_020b0300(0, 31, 0x7fff, 0x3f, 0);

    FIELD(void *, presentation, 0x5c) = 0;
    void *scene = Heap_Alloc(0x1e0, data_ov037_021feed0, 4, gHeapContext);
    if (scene != 0)
        scene = func_ov037_021fd7e4(scene, owner);
    FIELD(void *, presentation, 0x5c) = scene;
    FIELD(u32, presentation, 0x20) |= 0x400;
    func_ov037_021fe4d4(presentation,
                        (void *)data_ov037_021fec98[0],
                        (void *)data_ov037_021fec98[1]);
    return presentation;
}
