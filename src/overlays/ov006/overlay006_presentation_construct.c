#include "tingle/types.h"

/*
 * Overlay 6 presentation construction. This recovered constructor initializes
 * an indexed UI controller, overlay-46 helper, auxiliary font object, animation,
 * and transition state.
 */

typedef struct Overlay006Presentation {
    u8 bytes[0xb8];
} Overlay006Presentation;

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

#ifdef __cplusplus
extern "C" {
#endif
extern void *gGameWork;
extern void *gHeapContext;
extern void *gDebugFont;
extern const u8 data_ov006_021fbc88[];
extern const u8 data_ov006_021fbc9c[];
extern const u8 data_ov006_021fbca4[];
extern const s32 data_ov006_021fbc58[2];
extern void func_02091e28(void *state);
extern void func_02093a88(void *controller);
extern void func_02091b6c(void *animation);
extern void func_02093adc(void *controller, s32 first, s32 index, s32 third);
extern void *Heap_Alloc(s32 size, const void *tag, s32 alignment,
                        void *heapContext);
extern void *func_ov046_0220b7bc(void *memory, void *owner, s32 mode);
extern void *func_ov046_0220c4a0(void);
extern void func_02093af8(void *controller, void *value);
extern void func_ov046_0220bffc(void *helper, void *controllerMember,
                               s32 first, s32 second);
extern void func_ov046_0220c478(void *helper, void *controllerMember);
extern void *func_02027fe8(void *memory, void *owner);
extern void func_02091b98(void *animation, s32 value);
extern void func_ov006_021fb6e0(void *state, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/*
 * Initialize the inherited base and install data_ov006_021fbc88. Construct
 * controller +0x58 and animation +0x98. Read signed gGameWork halfword +0x12E
 * into +0x54, replacing values >=11 with 10, and configure the controller as
 * func_02093adc(+0x58,0,index,0). Set +0x84 to 12. Allocate 0x118 bytes tagged
 * by data_ov006_021fbc9c and, on success, construct overlay-46 helper
 * func_ov046_0220b7bc with gDebugFont/mode 0; store +0x90. Obtain the shared
 * overlay-46 value, bind it to controller +0x58, then call the two overlay-46
 * setup helpers with +0x90 and controller member +0x64. Allocate a 0x3C-byte
 * auxiliary tagged by data_ov006_021fbca4, construct func_02027fe8 with
 * gDebugFont, and store +0x94. Submit 0x78 to animation +0x98, set +0xB4 to
 * one, set +0x20 bit 10, initialize the transition from data_ov006_021fbc58,
 * and return state. Allocator and helper ownership are delegated; offsets and
 * constants are confirmed while UI semantics remain partly unidentified.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay006Presentation *func_ov006_021fb708(Overlay006Presentation *state)
{
    void *helper;
    void *auxiliary;
    s32 index;

    func_02091e28(state);
    FIELD(const void *, state, 0x000) = data_ov006_021fbc88;
    func_02093a88((u8 *)state + 0x58);
    func_02091b6c((u8 *)state + 0x98);
    index = FIELD(s16, gGameWork, 0x12e);
    if (index >= 11) {
        index = 10;
    }
    FIELD(s32, state, 0x054) = index;
    func_02093adc((u8 *)state + 0x58, 0, index, 0);
    FIELD(s32, state, 0x084) = 12;

    helper = Heap_Alloc(0x118, data_ov006_021fbc9c, 4, gHeapContext);
    if (helper != 0) {
        helper = func_ov046_0220b7bc(helper, gDebugFont, 0);
    }
    FIELD(void *, state, 0x090) = helper;
    func_02093af8((u8 *)state + 0x58, func_ov046_0220c4a0());
    func_ov046_0220bffc(helper, FIELD(void *, state, 0x064), 0, 0);
    func_ov046_0220c478(helper, FIELD(void *, state, 0x064));

    auxiliary = Heap_Alloc(0x3c, data_ov006_021fbca4, 4, gHeapContext);
    if (auxiliary != 0) {
        auxiliary = func_02027fe8(auxiliary, gDebugFont);
    }
    FIELD(void *, state, 0x094) = auxiliary;
    func_02091b98((u8 *)state + 0x98, 0x78);
    FIELD(s32, state, 0x0b4) = 1;
    FIELD(u32, state, 0x020) |= 0x400;
    func_ov006_021fb6e0(state, data_ov006_021fbc58[0],
                        data_ov006_021fbc58[1]);
    return state;
}

#undef FIELD
