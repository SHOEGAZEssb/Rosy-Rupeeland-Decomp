#include "tingle/types.h"

/* Overlay 36 ramp-controller resources, timers, lists, and handle-backed children. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02206028[];
extern const u8 data_ov036_02206160[];
extern void *data_020f4e18;
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov036_021fce00(void *controller, void *argument);
extern void func_020720c0(void *resourceSet);
extern void func_ov036_021fe218(void *list);
extern void func_02091b6c(void *timer);
extern void func_020720e8(void *resourceSet, void *archive,
                          s32 firstId, s32 secondId, s32 thirdId);
extern void Graphics3DResourceOwner_PrepareResources(void *owner, void *resourceSet);
extern void *Graphics3DResourceOwner_CreateManager(void *owner);
extern void *func_02077308(void *manager, void *resourceSet);
extern void func_ov036_021ff050(void *handle, s32 mode,
                                s32 x, s32 y, s32 z,
                                s32 byte5A, s32 flags);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_020955d8(void *object, void *handle);
extern void func_02095274(void *list, void *object);
extern void func_02094bbc(void *object, s32 x, s32 y, s32 z);
extern void func_020948d4(void *field, s32 value);
extern void func_ov036_02201710(void *controller);
extern void func_ov036_021fe9fc(void *record, s32 x, s32 y, s32 z);
extern void func_ov036_021fea04(void *record, s32 x, s32 y, s32 z);
extern void func_020b0300(s32, s32, s32, s32, s32);
extern void func_02092850(s32 value);
extern void func_02091bac(void *timer, s32 mode, s32 first,
                          s32 second, s32 duration);
extern void func_02091b98(void *timer, s32 duration);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a ramp controller. argument becomes common key +4 and owner gets
 * resource triples 0x6003..05 (+0xDC), 0x605D..5F (+0xE8), 0x6060..62 (+0xF4),
 * 0x6063..65 (+0x100), 0x60BD..BF (+0x10C), and 0x60C6..C8 (inherited +0xCC).
 * Lists +0x148/+0x158 and timers +0x168/+0x184 are initialized. Manager +0x118
 * creates child +0x11C from +0xE8 (handle byte 9, flags 0x42) and child +0xD8
 * from +0xCC (byte 1, flags 0x46); both enter +0x148, while +0xD8 is positioned
 * at zero with scale 0x29. Later helper func_ov036_02201710 performs additional
 * confirmed setup. Vector +0xC is (0,0,0x2800)/(0,0,0), common hardware is
 * initialized, timer +0x168 ramps 0..0x1000 over 0xF0, timer +0x184 starts at
 * 0x78, and +0x1A0 is enabled. Returns controller; resources, manager, heap,
 * handles, lists, timers, transforms, and hardware state change.
 */
extern "C" void *func_ov036_0220102c(void *controller, void *owner,
                                      void *argument)
{
    func_ov036_021fce00(controller, argument);
    FIELD(const void *, controller, 0) = data_ov036_02206028;
    func_020720c0((u8 *)controller + 0xdc);
    func_020720c0((u8 *)controller + 0xe8);
    func_020720c0((u8 *)controller + 0xf4);
    func_020720c0((u8 *)controller + 0x100);
    func_020720c0((u8 *)controller + 0x10c);
    func_ov036_021fe218((u8 *)controller + 0x148);
    func_ov036_021fe218((u8 *)controller + 0x158);
    func_02091b6c((u8 *)controller + 0x168);
    func_02091b6c((u8 *)controller + 0x184);

    const s32 ids[][2] = {
        {0xdc, 0x6005}, {0xe8, 0x605f}, {0xf4, 0x6062},
        {0x100, 0x6065}, {0x10c, 0x60bf}, {0xcc, 0x60c8}
    };
    for (s32 i = 0; i < 6; ++i) {
        s32 offset = ids[i][0];
        s32 id = ids[i][1];
        func_020720e8((u8 *)controller + offset, data_020f4e18,
                      id - 2, id - 1, id);
        Graphics3DResourceOwner_PrepareResources(owner, (u8 *)controller + offset);
    }

    void *manager = Graphics3DResourceOwner_CreateManager(owner);
    FIELD(void *, controller, 0x118) = manager;
    void *handle = func_02077308(manager, (u8 *)controller + 0xe8);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 9, 0x42);
    void *child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0x11c) = child;
    func_02095274((u8 *)controller + 0x148, child);

    handle = func_02077308(manager, (u8 *)controller + 0xcc);
    func_ov036_021ff050(handle, 0, 0, 0, 0, 1, 0x46);
    child = Heap_Alloc(0xa0, data_ov036_02206160, 4, gHeapContext);
    if (child != 0)
        child = func_020955d8(child, handle);
    FIELD(void *, controller, 0xd8) = child;
    func_02095274((u8 *)controller + 0x148, child);
    func_02094bbc(child, 0, 0, 0);
    func_020948d4((u8 *)child + 0x6c, 0x29);

    func_ov036_02201710(controller);
    func_ov036_021fe9fc((u8 *)controller + 0xc, 0, 0, 0x2800);
    func_ov036_021fea04((u8 *)controller + 0xc, 0, 0, 0);
    func_020b0300(0, 0x1f, 0x7fff, 0x3f, 0);
    func_02092850(0);
    func_02091bac((u8 *)controller + 0x168,
                  1, 0, 0x1000, 0xf0);
    func_02091b98((u8 *)controller + 0x184, 0x78);
    FIELD(s32, controller, 0x1a0) = 1;
    return controller;
}
