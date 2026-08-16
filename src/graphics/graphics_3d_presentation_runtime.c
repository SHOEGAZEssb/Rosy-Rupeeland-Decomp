
/*
 * Portable reconstructions of the assembly-selected retail 3D presentation
 * manager used by GamePhaseRuntime.  This is recovered game-owned control
 * flow: only the NitroSDK transfer/register calls remain native boundaries.
 */
#include "tingle/heap.h"
#include "tingle/system.h"
#include "tingle/types.h"

extern u8 data_020d23fc[];
extern const char data_020f32e8[];
extern const char data_020f32f0[];
extern const char data_020f32f8[];
extern void *data_020f4e18;
extern void *data_021052fc;

extern void func_02004fe0(void *vector);
extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void func_02005058(void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void __construct_array(void *array, u32 count, u32 element_size,
                              void (*constructor)(void *),
                              void (*destructor)(void *));
extern void func_020c0bc8(void *array, u32 count, u32 element_size,
                          void (*destructor)(void *));
extern void TouchPoint_Destroy(void *point);
extern void TouchPoint_InitZero(void *point);

extern void *func_0207164c(void *manager, u32 archive_id);
extern void *func_02071798(void *manager, u32 archive_id);
extern u32 func_0207043c(const void *resource);
extern u32 func_02070474(const void *resource);
extern u32 func_020704c8(const void *resource);
extern u32 func_02070580(const void *resource);
extern void *func_02070874(const void *resource);
extern u32 func_02070888(const void *resource);
extern void func_020b44e8(void);
extern void func_020b239c(void);
extern void func_020b2238(const void *source, u32 destination, u32 size);
extern void func_020b21c8(void);
extern void func_020b2180(void);
extern void func_020b210c(const void *source, u32 destination, u32 size);
extern void func_020b20b4(void);
extern u32 GX_VBlankIntr(u32 enable);
extern u32 GX_HBlankIntr(u32 enable);
extern void G3X_Init(void);
extern void G3X_InitMtxStack(void);
extern void func_020b0558(void);
extern void func_020b0a54(s32 left, s32 right, s32 bottom, s32 top,
                          s32 near_plane, s32 far_plane, s32 scale,
                          s32 load, void *matrix);
extern void GX_SetGraphicsMode(u32 display_mode, u32 bg_mode, u32 bg0_as_3d);
extern u16 func_020ae740(void);
extern u16 func_020ae72c(void);
extern void func_020aef3c(u32 banks);
extern void func_020aee48(u32 banks);
#ifndef MATCHING
extern void TingleNativeG3_SetMatrixMode(u32 mode);
extern void TingleNativeG3_Identity(void);
extern void TingleNativeG3_Translate(s32 x, s32 y, s32 z);
extern void TingleNativeG3_SetTextureParam(u32 value);
extern void TingleNativeG3_SetPolygonAttr(u32 value);
#endif

typedef void (*RetailDestructor)(void *);

static void ReleaseResource(void *resource)
{
    u32 vtable;

    if (resource == 0)
        return;
    vtable = *(u32 *)resource;
    ((RetailDestructor)*(u32 *)(vtable + 4))(resource);
}

/* Exact scalar queries at 0x0207042C, 0x0207043C, 0x02070474, 0x020704C8,
 * 0x02070580, 0x02070874 and 0x02070888. */
u32 func_0207042c(const void *resource)
{
    return *(const u32 *)((const u8 *)resource + 0x28) & 0xf;
}

u32 func_0207043c(const void *resource)
{
    const u8 *bytes = (const u8 *)resource;
    return *(const u32 *)(bytes + 0x14) == 0
               ? 0
               : *(const u32 *)(*(const u32 *)(bytes + 0x20) + 8);
}

u32 func_02070474(const void *resource)
{
    static const u8 formats[5] = {3, 4, 4, 1, 6};
    u32 format = *(const u32 *)((const u8 *)resource + 0x28) & 0xf;
    return format < 5 ? formats[format] : 0;
}

static u32 TextureDimension(u32 dimension)
{
    switch (dimension) {
    case 8: return 0;
    case 16: return 1;
    case 32: return 2;
    case 64: return 3;
    case 128: return 4;
    case 256: return 5;
    case 512: return 6;
    case 1024: return 7;
    default: return 0;
    }
}

u32 func_020704c8(const void *resource)
{
    return TextureDimension((*(const u32 *)((const u8 *)resource + 0x28) >> 4) &
                            0x7ff);
}

u32 func_02070580(const void *resource)
{
    return TextureDimension((*(const u32 *)((const u8 *)resource + 0x28) >> 14) &
                            0x7ff);
}

u32 func_02070888(const void *resource)
{
    const u8 *bytes = (const u8 *)resource;
    const u8 *descriptor;
    u16 mode;
    u32 count;

    if (*(const u32 *)(bytes + 0x14) == 0)
        return 0;
    descriptor = (const u8 *)*(const u32 *)(bytes + 0x20);
    mode = *(const u16 *)(descriptor + 4);
    count = *(const u16 *)(descriptor + 6);
    return mode == 0 ? count : mode == 0x10 ? count << 5 : count << 9;
}

/* Retail 0x0209A5FC: bind one texture/palette archive pair into slot. */
void func_0209a5fc(void *object, u32 slot, u32 texture_id, u32 palette_id)
{
    u8 *bytes = (u8 *)object;
    void *manager = data_020f4e18;
    void *texture = func_0207164c(manager, texture_id);
    void *palette = func_02071798(manager, palette_id);
    u32 texture_offset = *(u32 *)(bytes + 0x4d4);
    u32 palette_offset = *(u32 *)(bytes + 0x4d8);

    func_020b44e8();
    func_020b239c();
    func_020b2238(*(void **)((u8 *)texture + 0x24), texture_offset,
                  func_0207043c(texture));
    func_020b21c8();
    func_020b2180();
    func_020b210c(func_02070874(palette), palette_offset,
                  func_02070888(palette));
    func_020b20b4();

    *(u32 *)(bytes + 0x31c + slot * 4) = texture_offset;
    *(u32 *)(bytes + 0x094 + slot * 4) = func_02070474(texture);
    *(u32 *)(bytes + 0x16c + slot * 4) = func_020704c8(texture);
    *(u32 *)(bytes + 0x244 + slot * 4) = func_02070580(texture);
    *(u32 *)(bytes + 0x4d4) = texture_offset + func_0207043c(texture);
    ReleaseResource(texture);
    *(u32 *)(bytes + 0x3f4 + slot * 4) = palette_offset;
    *(u32 *)(bytes + 0x4d8) = palette_offset + func_02070888(palette);
    ReleaseResource(palette);
    *(u32 *)(bytes + 0x4d0) = 1;
}

/* Return the actor-specific texture used in slot 16 by gameplay resource mode
 * 3. The sparse cases are the exact actor-specification dispatch recovered
 * from retail 0x0209A748; unknown actors use the common fallback pair. */
static u16 GameplayActorTextureId(void)
{
    void *actor;
    s16 specification;

    actor = *(void **)((u8 *)data_021052fc + 0x2ea8);
    if (actor == 0)
        return 0xe086;
    specification = **(s16 **)((u8 *)actor + 0x29c);
    switch (specification) {
    case 100: return 0xe0ba;
    case 101: return 0xe0a8;
    case 102: return 0xe096;
    case 103: return 0xe0bc;
    case 104: return 0xe0aa;
    case 105: return 0xe098;
    case 106: return 0xe0be;
    case 107: return 0xe0ac;
    case 108: return 0xe09a;
    case 200: return 0xe0ae;
    case 201: return 0xe0b0;
    case 202: return 0xe08a;
    case 203: return 0xe09c;
    case 204: return 0xe09e;
    case 205: return 0xe08c;
    case 206: return 0xe0b2;
    case 207: return 0xe0a0;
    case 208: return 0xe08e;
    case 300: return 0xe0b4;
    case 303: return 0xe0b6;
    case 304: return 0xe0a4;
    case 305: return 0xe0b8;
    case 306: return 0xe0a2;
    case 307: return 0xe0a6;
    case 308: return 0xe090;
    case 309: return 0xe092;
    case 310: return 0xe094;
    case 600: return 0xe0c6;
    case 601: return 0xe0c4;
    case 602: return 0xe0c2;
    default: return 0xe0c0;
    }
}

/* Load the texture/palette set used by the phase runtime. Modes 1, 3 and 8
 * are its confirmed call sites: mode 1 supplies the title/world base pair,
 * mode 3 adds the current actor's slot-16 pair, and mode 8 deliberately omits
 * slot 16. All three then install the common slots in retail order. */
void func_0209a748(void *object, s32 mode)
{
    static const u16 common_ids[] = {
        0xe016, 0xe018, 0xe01a, 0xe01c, 0xe01e, 0xe020, 0xe024,
        0xe026, 0xe028, 0xe02a, 0xe02e, 0xe030, 0xe032, 0xe034
    };
    static const u16 tail_ids[] = {
        0xe038, 0xe03a, 0xe03c, 0xe03e, 0xe042,
        0xe062, 0xe064, 0xe066, 0xe068, 0xe022
    };
    u8 *bytes = (u8 *)object;
    u32 old_vblank;
    u32 old_hblank;
    u32 index;

    *(u32 *)(bytes + 0x4d4) = 0;
    *(u32 *)(bytes + 0x4d8) = 0;
    *(u32 *)(bytes + 0x4dc) = 0;
    old_vblank = GX_VBlankIntr(0);
    old_hblank = GX_HBlankIntr(0);

    if (mode != 1 && mode != 3 && mode != 8) {
        GX_VBlankIntr(old_vblank);
        GX_HBlankIntr(old_hblank);
        return;
    }
    if (mode == 1)
        func_0209a5fc(object, 0, 0xe000, 0xe001);
    else
        func_0209a5fc(object, 0, 0xe016, 0xe017);
    for (index = 0; index < sizeof(common_ids) / sizeof(common_ids[0]); ++index)
        func_0209a5fc(object, index + 1, common_ids[index], common_ids[index] + 1);
    if (mode == 1)
        func_0209a5fc(object, 0x10, 0xe086, 0xe087);
    else if (mode == 3) {
        u16 texture_id = GameplayActorTextureId();
        func_0209a5fc(object, 0x10, texture_id, texture_id + 1);
    }
    for (index = 0; index < sizeof(tail_ids) / sizeof(tail_ids[0]); ++index)
        func_0209a5fc(object, index + 0x11, tail_ids[index], tail_ids[index] + 1);

    GX_VBlankIntr(old_vblank);
    GX_HBlankIntr(old_hblank);
}

/* Initializes the small 3D manager's two vectors and default state, returning
 * the caller-provided object without allocation or SDK effects. */
void *func_0209a450(void *object)
{
    u8 *bytes = (u8 *)object;
    func_02004fe0(bytes + 0x0c);
    func_02004fe0(bytes + 0x1c);
    *(u32 *)(bytes + 0) = 0;
    *(u32 *)(bytes + 4) = 1;
    *(u32 *)(bytes + 8) = 1;
    return object;
}

/* Installs the confirmed retail vtable pointer into the small 3D manager. */
void func_0209a4b4(void *object)
{
    *(u32 *)object = (u32)data_020d23fc;
}

/* Mark the small 3D manager inactive. The caller retains ownership; no SDK or
 * allocation effects occur. */
void func_0209a4c4(void *object)
{
    *(u32 *)((u8 *)object + 4) = 1;
}

/* Return the small 3D manager's inactive flag without changing state. */
u32 func_0209a4dc(void *object)
{
    return *(u32 *)((u8 *)object + 4);
}

/* Initializes the paired presentation table and its fifteen touch points,
 * records owner, and returns the caller-provided object. */
void *func_020a2aa8(void *object, void *owner)
{
    u8 *bytes = (u8 *)object;
    s32 index;
    func_02004fe0(bytes + 0x0c);
    __construct_array(bytes + 0x1c, 15, 0x0c, TouchPoint_InitZero,
                      TouchPoint_Destroy);
    *(u32 *)(bytes + 0) = (u32)owner;
    bytes[4] = 0; bytes[5] = 1; bytes[6] = 0; bytes[7] = 0;
    *(u32 *)(bytes + 8) = 0;
    for (index = 14; index >= 0; --index) {
        *(u32 *)(bytes + 0xd0 + index * 4) = 0;
        *(u32 *)(bytes + 0x184 + index * 4) = 0;
    }
    return object;
}

/* Initializes the 30-slot presentation manager, records owner, and returns
 * the caller-provided storage. */
void *func_020a3360(void *object, void *owner)
{
    u32 *words = (u32 *)object;
    u32 index;
    words[0] = (u32)owner;
    for (index = 1; index <= 30; ++index)
        words[index] = 0;
    words[31] = 0;
    return object;
}

/* Reset Nitro 3D and matrix-stack state, select retail texture bank B and
 * texture-palette bank G, and clear the object's transfer offsets/active flag
 * through the SDK graphics boundary. */
void func_0209a4f0(void *object)
{
    u8 *bytes = (u8 *)object;
    G3X_Init();
    G3X_InitMtxStack();
    func_020aef3c(2);
    func_020aee48(0x40);
    *(u32 *)(bytes + 0x4cc) = 0;
    *(u32 *)(bytes + 0x4d0) = 0;
}

/*
 * Retail 0x0209B478: release the two 3D texture/palette VRAM assignments and
 * mark the presentation object's resource transfer inactive. The object owns
 * the flag at +0x4D0; SDK bank ownership is released synchronously.
 */
void func_0209b478(void *object)
{
    func_020ae740();
    func_020ae72c();
    *(u32 *)((u8 *)object + 0x4d0) = 0;
}

/* Begin a presentation frame once: copy the borrowed world position into the
 * object's retained position, reset the Nitro geometry engine for submission,
 * and set the per-frame guard at +0x4CC. Repeated calls have no effect. */
void func_0209b7a0(void *object, const void *position)
{
    u8 *bytes = (u8 *)object;

    if (*(u32 *)(bytes + 0x4cc) != 0)
        return;
    func_020050a4(bytes + 0x84, position);
    func_020b0558();
    *(u32 *)(bytes + 0x4cc) = 1;
}

/* Finish a presentation frame. A nonzero argument requests a geometry-buffer
 * swap through the DS command register; all calls clear the per-frame guard so
 * the next update can install a new position. */
void func_0209b7cc(void *object, s32 swap_buffers)
{
    if (swap_buffers != 0)
        *(volatile u32 *)0x04000540 = 1;
    *(u32 *)((u8 *)object + 0x4cc) = 0;
}

/* Pack the retail texture-parameter fields into the geometry command port.
 * Inputs are immediate bit fields; no memory is retained and the write is
 * synchronously visible to the Nitro geometry boundary. */
void func_0209b414(u32 format, u32 generation, u32 size_s, u32 size_t,
                   u32 repeat_s, u32 repeat_t, u32 flip, u32 address)
{
    u32 value =
        (format << 26) | (address >> 3) | (generation << 30) |
        (size_s << 20) | (size_t << 23) | (repeat_s << 16) |
        (repeat_t << 18) | (flip << 29);
    *(volatile u32 *)0x040004a8 = value;
#ifndef MATCHING
    TingleNativeG3_SetTextureParam(value);
#endif
}

/* Pack the retail polygon-attribute fields into the geometry command port.
 * Inputs are immediate bit fields; the command is submitted synchronously. */
void func_0209b560(u32 light, u32 polygon_mode, u32 cull_mode, u32 polygon_id,
                   u32 alpha, u32 misc)
{
    u32 value =
        light | (polygon_mode << 4) | (cull_mode << 6) | misc |
        (polygon_id << 24) | (alpha << 16);
    *(volatile u32 *)0x040004a4 = value;
#ifndef MATCHING
    TingleNativeG3_SetPolygonAttr(value);
#endif
}

/* Establish the orthographic and material state shared by paired 3D
 * presentation entries. The object is borrowed only for API compatibility;
 * retail does not inspect it and retains no state through this argument. */
void func_0209c9d4(void *object)
{
    (void)object;
    func_020b0a54(-0x60000, 0x60000, -0x80000, 0x80000,
                  0, 0x2000, 0x1000, 1, 0);
    *(volatile u32 *)0x04000440 = 2;
    *(volatile u32 *)0x04000454 = 0;
    *(volatile u32 *)0x04000470 = 0x01000000;
    *(volatile u32 *)0x04000470 = 0x01000000;
    *(volatile u32 *)0x04000470 = 0x00001000;
#ifndef MATCHING
    TingleNativeG3_SetMatrixMode(2);
    TingleNativeG3_Identity();
    TingleNativeG3_Translate(0x01000000, 0x01000000, 0x00001000);
#endif
    func_0209b414(0, 0, 0, 0, 0, 0, 0, 0);
    func_0209b560(0, 0, 3, 2, 0x1f, 0);
}

/*
 * Retail 0x020A22BC: reset 3D state and reload the resource set selected by
 * the presentation mode at +0x504. Allocations remain owned by the object.
 */
void func_020a22bc(void *object)
{
    func_0209a4f0(object);
    func_0209a748(object,
                  *(s32 *)((u8 *)object + 0x504) != 0 ? 3 : 8);
}

/*
 * Retail 0x020A2348: select the 2D BG0 path. A nonzero release_resources
 * releases owned 3D VRAM first; a nonzero configure_display selects main
 * engine mode 1/BG mode 0 and removes BG0 from the visible plane mask.
 */
void func_020a2348(void *object, s32 release_resources,
                   s32 configure_display)
{
    volatile u32 *display_control = (volatile u32 *)0x04000000;

    if (release_resources != 0)
        func_0209b478(object);
    if (configure_display != 0) {
        GX_SetGraphicsMode(1, 0, 0);
        *display_control = (*display_control & ~0x1f00u) |
                           (((*display_control >> 8) & 0x1eu) << 8);
    }
    ((u8 *)object)[0x50a] = 0;
}

/*
 * Retail 0x020A23A8: select the 3D BG0 path. Display configuration preserves
 * all visible planes while enabling BG0; optional resource setup reloads the
 * mode-selected texture set. The mode byte at +0x50A becomes enabled.
 */
void func_020a23a8(void *object, s32 load_resources, s32 configure_display)
{
    volatile u32 *display_control = (volatile u32 *)0x04000000;

    if (configure_display != 0) {
        GX_SetGraphicsMode(1, 0, 1);
        *display_control = (*display_control & ~0x1f00u) |
                           ((((*display_control >> 8) & 0x1fu) | 1u) << 8);
    }
    if (load_resources != 0)
        func_020a22bc(object);
    ((u8 *)object)[0x50a] = 1;
}

void *func_020a1f80(void *object, s32 mode)
{
    u8 *bytes = (u8 *)object;
    u8 vector[16];
    void *allocation;

    func_02004fe0(bytes + 0x70);
    func_02004fe0(bytes + 0x84);
    func_02004fe0(bytes + 0x4ec);
    *(s32 *)(bytes + 0x504) = mode;
    func_0209a4f0(object);
    if (mode == 0)
        func_0209a748(object, 8);

    allocation = Heap_Alloc(0x2c, data_020f32e8, 4, &gHeapContext);
    *(u32 *)(bytes + 0x4e0) = (u32)func_0209a450(allocation);
    func_0209a4b4(allocation);
    allocation = Heap_Alloc(0x1fc, data_020f32f0, 4, &gHeapContext);
    *(u32 *)(bytes + 0x4e4) = (u32)func_020a2aa8(allocation, object);
    allocation = Heap_Alloc(0x80, data_020f32f8, 4, &gHeapContext);
    *(u32 *)(bytes + 0x4e8) = (u32)func_020a3360(allocation, object);
    bytes[0x509] = 0;
    bytes[0x50a] = 1;
    func_0200500c(vector, 0, 0x1800, -0x5800);
    func_020050a4(bytes + 0x4ec, vector);
    func_02005058(vector);
    *(u32 *)(bytes + 0x4fc) = 0;
    *(u32 *)(bytes + 0x500) = 0;
    return object;
}

/* Destroys the small manager's two vectors, clears its first word, and returns
 * the caller-owned object. */
void *func_0209a484(void *object)
{
    u8 *bytes = (u8 *)object;
    *(u32 *)bytes = 0;
    func_02005058(bytes + 0x1c);
    func_02005058(bytes + 0x0c);
    return object;
}

/* Confirmed no-op destructor hook for the 30-slot manager. */
void func_020a3388(void *object)
{
    (void)object;
}

/* Destroys the fifteen touch points and the manager vector, returning the
 * caller-owned object without freeing its enclosing allocation. */
void *func_020a2b28(void *object)
{
    u8 *bytes = (u8 *)object;
    func_020c0bc8(bytes + 0x1c, 15, 0x0c, TouchPoint_Destroy);
    func_02005058(bytes + 0x0c);
    return object;
}
