#include "tingle/types.h"

/* Overlay 28 twelve-byte list-row storage, controller, and renderer lifecycle. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

typedef struct Overlay028Row {
    const void *descriptor;
    void *sprite;
    s16 x;
    s16 y;
} Overlay028Row;

extern void *data_020f4e18[];
extern const u8 data_ov028_021ff2c0[];
extern const u8 data_ov028_021ff2c8[];
extern void *gHeapContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void *func_02003e20(u32, const void *, s32, void *);
extern void func_02071ea4(void *);
extern void func_02071eb8(void *);
extern void func_02071ee0(void *, void *, s32, s32, s32);
extern void GraphicsSpriteGroup_ReleaseIndexedEntries(void *);
extern void GraphicsSpriteGroup_Destroy(void *);
extern void *GraphicsSpriteGroupOwner_CreateGroup(void *);
extern void func_02092798(void *);
extern void func_020927b8(void *);
extern void func_02092814(void *, s32);
extern void *func_02094154(void *, void *, s32, s32, s32, s32, s32);
extern void func_02094550(void *, s32);
extern void func_02094574(void *);
extern void *func_020c09cc(void *, s32, s32, s32, void (*)(void *), s32);
extern void func_020c0c24(void *, s32, s32, void (*)(void *));
extern void func_ov028_021fcff4(void *);
extern void func_ov028_021fd208(void *);
#ifdef __cplusplus
}
#endif

/*
 * Constructs a list for `capacity` descriptors using caller renderer owner
 * `font`. It initializes embedded resource state +8 and manager +0x14, creates
 * renderer +4 with offsets 0x2F/0x1C, and loads resource IDs 0x60..0x62. For a
 * nonempty list it allocates and initializes capacity twelve-byte rows at
 * +0x38. It also allocates the 0x80-byte controller +0x44 (mode 5 when rows
 * exist, otherwise mode 1), selects entry zero, updates it, loads manager ID
 * 0x7006, and returns `state`. Heap and graphics/UI SDK state change.
 */
extern "C" void *func_ov028_021fd00c(void *state, void *font, s32 capacity)
{
    func_02071ea4((u8 *)state + 8);
    func_02092798((u8 *)state + 0x14);
    FIELD(void *, state, 0) = font;
    FIELD(void *, state, 4) = GraphicsSpriteGroupOwner_CreateGroup(font);
    FIELD(s32, FIELD(void *, state, 4), 0x18) = 0x2f;
    FIELD(s32, FIELD(void *, state, 4), 0x1c) = 0x1c;
    func_02071ee0((u8 *)state + 8, data_020f4e18[0], 0x60, 0x61, 0x62);
    FIELD(s32, state, 0x3c) = capacity;
    FIELD(s32, state, 0x40) = 0;

    if (capacity != 0) {
        void *rows = func_02003e20(capacity * 12 + 8,
                                   data_ov028_021ff2c0, 4, gHeapContext);
        if (rows != 0)
            rows = func_020c09cc(rows, capacity, 12, 8,
                                 func_ov028_021fcff4, 0);
        FIELD(void *, state, 0x38) = rows;
    } else {
        FIELD(void *, state, 0x38) = 0;
    }

    void *controller = Heap_Alloc(0x80, data_ov028_021ff2c8,
                                  4, gHeapContext);
    if (controller != 0)
        controller = func_02094154(controller, font, capacity,
                                   capacity != 0 ? 5 : 1,
                                   0xda, 0x18, 0x0c);
    FIELD(void *, state, 0x44) = controller;
    func_02094550(controller, 0);
    func_02094574(controller);
    func_02092814((u8 *)state + 0x14, 0x7006);
    return state;
}

/*
 * Releases renderer +4, virtually destroys controller +0x44, destroys any
 * twelve-byte row array +0x38, and tears down manager +0x14 and resources +8.
 * Returns `state` without freeing it; owned SDK/heap resources are released.
 */
extern "C" void *func_ov028_021fd1a8(void *state)
{
    GraphicsSpriteGroup_Destroy(FIELD(void *, state, 4));
    void *controller = FIELD(void *, state, 0x44);
    if (controller != 0) {
        typedef void (*Destructor)(void *);
        FIELD(Destructor *, controller, 0)[1](controller);
    }
    if (FIELD(void *, state, 0x38) != 0)
        func_020c0c24(FIELD(void *, state, 0x38), 12, 8,
                      func_ov028_021fd208);
    func_020927b8((u8 *)state + 0x14);
    func_02071eb8((u8 *)state + 8);
    return state;
}

/* Twelve-byte row destructor; it has no observable effect and returns void. */
extern "C" void func_ov028_021fd208(void *row)
{
    (void)row;
}

/*
 * Appends `descriptor` to the next row when storage exists and count +0x40 is
 * below capacity +0x3C. It clears sprite/X, sets Y to index*24, increments the
 * count, and returns the row; failure returns null. Only list memory changes.
 */
extern "C" Overlay028Row *func_ov028_021fd20c(void *state,
                                               const void *descriptor)
{
    Overlay028Row *rows = FIELD(Overlay028Row *, state, 0x38);
    s32 index = FIELD(s32, state, 0x40);
    if (rows == 0 || index >= FIELD(s32, state, 0x3c))
        return 0;
    rows[index].descriptor = descriptor;
    rows[index].sprite = 0;
    rows[index].x = 0;
    rows[index].y = index * 0x18;
    FIELD(s32, state, 0x40) = index + 1;
    return &rows[index];
}

/*
 * Marks state +0x48 active. With rows present, it conditionally marks the
 * controller's object +0x50 active when the inferred current/end indices at
 * +4/+8 permit it; without rows it calls the SDK reset on that object. It then
 * marks renderer +4 active at +0x20. Returns void and changes UI SDK state.
 */
extern "C" void func_ov028_021fd274(void *state)
{
    FIELD(s32, state, 0x48) = 1;
    void *controller = FIELD(void *, state, 0x44);
    if (FIELD(s32, state, 0x40) != 0) {
        if (FIELD(s32, controller, 8) < FIELD(s32, controller, 4))
            FIELD(s32, FIELD(void *, controller, 0x50), 0x20) = 1;
    } else {
        GraphicsSpriteGroup_ReleaseIndexedEntries(FIELD(void *, controller, 0x50));
    }
    FIELD(s32, FIELD(void *, state, 4), 0x20) = 1;
}
