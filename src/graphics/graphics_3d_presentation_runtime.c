
/*
 * Portable reconstructions of the assembly-selected retail 3D presentation
 * manager used by GamePhaseRuntime.  This is recovered game-owned control
 * flow: only the NitroSDK transfer/register calls remain native boundaries.
 */
#include "tingle/heap.h"
#include "tingle/graphics_3d_presentation.h"
#include "tingle/paired_entry_manager.h"
#include "tingle/point_2d_s16.h"
#include "tingle/sprite_effect.h"
#include "tingle/system.h"
#include "tingle/types.h"
#include "tingle/util_animation_resource.h"

extern const RupeeMeshDescriptor gRupeeMeshDescriptor;
extern const s16 gFx32CosSinTable[];
extern u8 data_020f3064[];
extern u8 data_021f63b0[];
extern const char data_020f32e8[];
extern void *data_020f4e18;
extern void *gGamePhaseRuntime;

extern void func_0200500c(void *vector, s32 x, s32 y, s32 z);
extern void VecFx32_TerminateNoOp(void *vector);
extern void func_020050a4(void *destination, const void *source);
extern void VecFx32_Subtract(VecFx32Object *result,
                             const VecFx32Object *left,
                             const VecFx32Object *right);
extern void __construct_array(void *array, u32 count, u32 element_size,
                              void (*constructor)(void *),
                              void (*destructor)(void *));
extern void __destroy_arr(void *array, u32 count, u32 element_size,
                          void (*destructor)(void *));
extern u32 genrand_int32(void);

extern void *func_0207164c(void *manager, u32 archive_id);
extern void *func_02071798(void *manager, u32 archive_id);
extern u32 func_0207043c(const void *resource);
extern u32 func_02070474(const void *resource);
extern u32 func_020704c8(const void *resource);
extern u32 func_02070580(const void *resource);
extern void *GraphicsBgResourceData_GetDecoded(const void *resource);
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
extern void func_0209b414(u32 format, u32 generation, u32 size_s, u32 size_t,
                          u32 repeat_s, u32 repeat_t, u32 flip, u32 address);
extern void G3Command_SetTexturePaletteBase(u32 address, u32 format);
extern void func_0209b560(u32 light, u32 polygon_mode, u32 cull_mode,
                          u32 polygon_id, u32 alpha, u32 misc);
extern void G3Command_SubmitTexCoord(s32 s, s32 t);
extern void G3Command_SubmitVertex16(s32 x, s32 y, s32 z);
extern void func_020b0844(s32 sine, s32 cosine);
extern void func_020b0880(s32 sine, s32 cosine);
extern void func_020b0a54(s32 left, s32 right, s32 bottom, s32 top,
                          s32 near_plane, s32 far_plane, s32 scale,
                          s32 load, void *matrix);
extern s32 func_020adc40(s32 value);
extern s32 func_020adc90(s32 numerator, s32 denominator);
extern void GX_SetGraphicsMode(u32 display_mode, u32 bg_mode, u32 bg0_as_3d);
extern u16 func_020ae740(void);
extern u16 func_020ae72c(void);
extern void func_020aef3c(u32 banks);
extern void func_020aee48(u32 banks);
#ifndef MATCHING
extern void TingleNativeG3_SetMatrixMode(u32 mode);
extern void TingleNativeG3_Identity(void);
extern void TingleNativeG3_Push(void);
extern void TingleNativeG3_Pop(u32 count);
extern void TingleNativeG3_Translate(s32 x, s32 y, s32 z);
extern void TingleNativeG3_Scale(s32 x, s32 y, s32 z);
extern void TingleNativeG3_SetTextureParam(u32 value);
extern void TingleNativeG3_SetPolygonAttr(u32 value);
extern void TingleNativeG3_SetLightVector(u32 value);
extern void TingleNativeG3_SetLightColor(u32 value);
extern void TingleNativeG3_SetMaterial(u32 value);
extern void TingleNativeG3_Begin(u32 primitive);
extern void TingleNativeG3_End(void);
extern void TingleNativeG3_Color(u32 color);
extern void TingleNativeG3_Normal(u32 normal);
extern void TingleNativeG3_Vertex10(u32 xyz);
extern void TingleNativeG3_VertexXY(u32 xy);
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
u32 GraphicsResource_GetFormat(const void *resource)
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
    func_020b210c(GraphicsBgResourceData_GetDecoded(palette), palette_offset,
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

    actor = *(void **)((u8 *)gGamePhaseRuntime + 0x2ea8);
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

/* Initialize a caller-owned rupee instance with inactive state, render variant
 * one, and two zero vectors. No allocation or SDK effect occurs. */
RupeeMeshInstance *RupeeMeshInstance_Init(RupeeMeshInstance *self)
{
    VecFx32Object_Init(&self->translation);
    VecFx32Object_Init(&self->scale);
    self->meshDescriptor = 0;
    self->inactive = 1;
    self->renderVariant = 1;
    return self;
}

/* Borrow the immutable retail rupee descriptor for subsequent submissions. */
void RupeeMeshInstance_BindDefaultMesh(RupeeMeshInstance *self)
{
    self->meshDescriptor = &gRupeeMeshDescriptor;
}

/* Mark the instance inactive. The caller retains ownership and transform. */
void RupeeMeshInstance_Deactivate(RupeeMeshInstance *self)
{
    self->inactive = 1;
}

/* Mark the instance active without changing its borrowed mesh or transform. */
void RupeeMeshInstance_Activate(RupeeMeshInstance *self)
{
    self->inactive = 0;
}

/* Return the instance's inactive flag without changing state. */
u32 RupeeMeshInstance_IsInactive(const RupeeMeshInstance *self)
{
    return self->inactive;
}

/* Construct a generic retail CPoint2D<short> from explicit components. The
 * caller owns the eight-byte value and no allocation or hardware effect
 * occurs. */
CPoint2DS16 *CPoint2DS16_InitComponents(CPoint2DS16 *self, s16 x, s16 y)
{
    self->vtable = gCPoint2DS16VTable;
    self->x = x;
    self->y = y;
    return self;
}

/* Submit one descriptor-selected normal and packed VTX_10 vertex to the NDS
 * geometry ports. Both command tables are borrowed immutable data and the
 * host boundary consumes the values synchronously. */
void Graphics3d_SubmitIndexedNormalVertex(
    const u32 *vertexCommands, u32 vertexIndex,
    const u32 *normalCommands, u32 normalIndex)
{
    u32 normal = normalCommands[normalIndex];
    u32 vertex = vertexCommands[vertexIndex];

    *(volatile u32 *)0x04000484 = normal;
    *(volatile u32 *)0x04000490 = vertex;
#ifndef MATCHING
    TingleNativeG3_Normal(normal);
    TingleNativeG3_Vertex10(vertex);
#endif
}

/* Submit the three indexed normal/vertex pairs of one packed rupee triangle.
 * Index streams and command tables are borrowed for this synchronous draw. */
void Graphics3d_SubmitIndexedTriangle(
    const u32 *vertexCommands, const u8 *vertexIndices,
    const u32 *normalCommands, const u16 *normalIndices)
{
    Graphics3d_SubmitIndexedNormalVertex(
        vertexCommands, vertexIndices[0], normalCommands, normalIndices[0]);
    Graphics3d_SubmitIndexedNormalVertex(
        vertexCommands, vertexIndices[1], normalCommands, normalIndices[1]);
    Graphics3d_SubmitIndexedNormalVertex(
        vertexCommands, vertexIndices[2], normalCommands, normalIndices[2]);
}

static s32 SquareFx32Rounded(s32 value)
{
    return (s32)(((s64)value * value + 0x800) >> 12);
}

/* Normalize one Q12 direction, pack it as a signed GX light vector, and set
 * that light's borrowed RGB15 color. The two hardware commands are submitted
 * synchronously; magnitude-plus-one preserves retail's zero-vector behavior. */
void Graphics3d_SetNormalizedLight(u32 lightId, s32 x, s32 y, s32 z,
                                   u16 color)
{
    s32 squared = (s32)((u32)SquareFx32Rounded(x) +
                        (u32)SquareFx32Rounded(y) +
                        (u32)SquareFx32Rounded(z));
    s32 magnitude = func_020adc40(squared);
    s32 normalizedX = func_020adc90(x, magnitude + 1);
    s32 normalizedY = func_020adc90(y, magnitude + 1);
    s32 normalizedZ = func_020adc90(z, magnitude + 1);
    u32 vector = ((u32)(normalizedX >> 3) & 0x3ffu) |
                 (((u32)(normalizedY >> 3) & 0x3ffu) << 10) |
                 (((u32)(normalizedZ >> 3) & 0x3ffu) << 20) |
                 (lightId << 30);
    u32 packedColor = (u32)color | (lightId << 30);

    *(volatile u32 *)0x040004c8 = vector;
    *(volatile u32 *)0x040004cc = packedColor;
#ifndef MATCHING
    TingleNativeG3_SetLightVector(vector);
    TingleNativeG3_SetLightColor(packedColor);
#endif
}

static u32 RupeeWobbleAngle(u16 phase)
{
    s16 sample = gFx32CosSinTable[(phase >> 4) * 2];
    return ((u32)(s32)sample >> 7) & 0xfffu;
}

/* Submit the overlay encounter's explicitly transformed rupee. Translation,
 * scale, and immutable mesh data are borrowed for the call. The low flag byte
 * selects an eight-texel atlas column; bit 0x100 accelerates wobble and emits
 * a white six-triangle damage flash. Retail render variant two requests
 * normal-derived texture coordinates; that visual mode remains an explicit
 * native-rasterizer dependency, while the default variant-one path is fully
 * mirrored. All geometry and lighting effects are synchronous. */
void Graphics3dPresentation_SubmitRupeeMeshWithEffects(
    Graphics3dPresentation *self, const RupeeMeshInstance *instance,
    u32 appearanceFlags)
{
    static const s16 flashOutline[7][2] = {
        {-0x90a,  0x77e}, {-0x90a, -0x77e}, {0, -0x10cd},
        { 0x90a, -0x77e}, { 0x90a,  0x77e}, {0,  0x10cd},
        {-0x90a,  0x77e}
    };
    const RupeeMeshDescriptor *mesh = instance->meshDescriptor;
    const u32 *vertexCommands = mesh->packedData;
    const u32 *normalCommands = vertexCommands + mesh->vertexCount;
    const u8 *vertexIndices =
        (const u8 *)(normalCommands + mesh->normalCount);
    u32 cornerCount = mesh->triangleCount * 3;
    const u16 *normalIndices =
        (const u16 *)(vertexIndices + cornerCount);
    VecFx32Object lightDirection;
    u8 *bytes = (u8 *)self;
    u16 *firstPhase = (u16 *)data_021f63b0;
    u16 *secondPhase = (u16 *)(data_020f3064 + 4);
    s32 intensity;
    u32 angle;
    u32 corner;
    s32 outline;

    VecFx32_Subtract(&lightDirection, &instance->translation,
                     &self->lightingReference);
    intensity = (s32)((u32)self->lightStrength * 0x18u) >> 12;
    Graphics3d_SetNormalizedLight(
        0, lightDirection.value.x, lightDirection.value.y,
        lightDirection.value.z,
        (u16)((u32)intensity | ((u32)intensity << 5) |
              ((u32)intensity << 10)));
    intensity = (s32)((u32)self->lightStrength << 2) >> 12;
    Graphics3d_SetNormalizedLight(
        1, -0xb50, -0xb50, 0, (u16)((u32)intensity << 10));

    *(volatile u32 *)0x04000444 = 0;
    *(volatile s32 *)0x04000470 = instance->translation.value.x;
    *(volatile s32 *)0x04000470 = instance->translation.value.y;
    *(volatile s32 *)0x04000470 = instance->translation.value.z;
    *(volatile s32 *)0x0400046c = instance->scale.value.x;
    *(volatile s32 *)0x0400046c = instance->scale.value.y;
    *(volatile s32 *)0x0400046c = instance->scale.value.z;
#ifndef MATCHING
    TingleNativeG3_Push();
    TingleNativeG3_Translate(instance->translation.value.x,
                             instance->translation.value.y,
                             instance->translation.value.z);
    TingleNativeG3_Scale(instance->scale.value.x,
                         instance->scale.value.y,
                         instance->scale.value.z);
#endif

    *firstPhase = (u16)(*firstPhase + 0x13e);
    *secondPhase = (u16)(*secondPhase + 0x1f4);
    if ((appearanceFlags & 0x100u) != 0) {
        *firstPhase = (u16)(*firstPhase + 0x6aa);
        *secondPhase = (u16)(*secondPhase + 0x4c5);
    }
    angle = RupeeWobbleAngle(*secondPhase);
    func_020b0844(gFx32CosSinTable[angle * 2],
                  gFx32CosSinTable[angle * 2 + 1]);
    angle = RupeeWobbleAngle(*firstPhase);
    func_020b0880(gFx32CosSinTable[angle * 2],
                  gFx32CosSinTable[angle * 2 + 1]);

    G3Command_SubmitTexCoord((s32)((appearanceFlags & 0xffu) << 15), 0);
    func_0209b414(*(u32 *)(bytes + 0x130),
                  instance->renderVariant == 2 ? 2 : 1,
                  *(u32 *)(bytes + 0x208), *(u32 *)(bytes + 0x2e0),
                  0, 0, 0, *(u32 *)(bytes + 0x3b8));
    G3Command_SetTexturePaletteBase(*(u32 *)(bytes + 0x490), *(u32 *)(bytes + 0x130));
    *(volatile u32 *)0x040004c0 = 0x6318;
    *(volatile u32 *)0x040004c4 = 0x4e73;
#ifndef MATCHING
    /* SPE_EMI/specular lighting is not yet represented by native G3; retain
     * the retail register write while mirroring its diffuse/ambient word. */
    TingleNativeG3_SetMaterial(0x6318);
#endif
    func_0209b560(3, 2, 2, 1, 0x1f, 0);
    *(volatile u32 *)0x04000500 = 0;
#ifndef MATCHING
    TingleNativeG3_Begin(0);
#endif
    for (corner = 0; corner < cornerCount; corner += 3) {
        Graphics3d_SubmitIndexedTriangle(
            vertexCommands, vertexIndices + corner,
            normalCommands, normalIndices + corner);
    }
    *(volatile u32 *)0x04000504 = 0;
#ifndef MATCHING
    TingleNativeG3_End();
#endif

    if ((appearanceFlags & 0x100u) != 0) {
        func_0209b414(0, 0, 0, 0, 0, 0, 0, 0);
        func_0209b560(0, 0, 3, 0, 0x1f, 0);
        *(volatile u32 *)0x04000480 = 0x7fff;
#ifndef MATCHING
        TingleNativeG3_Color(0x7fff);
#endif
        for (outline = 5; outline >= 0; --outline) {
            u32 xy = (u16)flashOutline[outline + 1][0] |
                     ((u32)(u16)flashOutline[outline + 1][1] << 16);

            *(volatile u32 *)0x04000500 = 2;
#ifndef MATCHING
            TingleNativeG3_Begin(2);
#endif
            G3Command_SubmitVertex16(flashOutline[outline][0],
                          flashOutline[outline][1], 0);
            *(volatile u32 *)0x04000494 = xy;
            *(volatile u32 *)0x04000494 = 0;
#ifndef MATCHING
            TingleNativeG3_VertexXY(xy);
            TingleNativeG3_VertexXY(0);
#endif
            *(volatile u32 *)0x04000504 = 0;
#ifndef MATCHING
            TingleNativeG3_End();
#endif
        }
    }

    *(volatile u32 *)0x04000448 = 1;
#ifndef MATCHING
    TingleNativeG3_Pop(1);
#endif
    VecFx32Object_Destroy(&lightDirection);
}

/* Copy an explicit transform into the owned rupee instance, then consume it
 * synchronously through the effect submission path. Neither argument vector
 * is retained after its values have been copied. */
void Graphics3dPresentation_DrawRupeeWithEffects(
    Graphics3dPresentation *self, const VecFx32Object *translation,
    const VecFx32Object *scale, u32 appearanceFlags)
{
    VecFx32Object_Assign(&self->rupeeMeshInstance->translation, translation);
    VecFx32Object_Assign(&self->rupeeMeshInstance->scale, scale);
    Graphics3dPresentation_SubmitRupeeMeshWithEffects(
        self, self->rupeeMeshInstance, appearanceFlags);
}

/* Adapt the typed zero-point constructor to the retail array-helper ABI. */
static void PairedEntryPoint_Init(void *point)
{
    TouchPoint_InitZero((TouchPoint *)point);
}

/* Adapt the typed point destructor to the retail array-helper ABI. */
static void PairedEntryPoint_Destroy(void *point)
{
    TouchPoint_Destroy((TouchPoint *)point);
}

/* Initialize the value-only origin and fifteen entry points, record the
 * borrowed render context, clear active entry state, and return self. */
PairedEntryManager *PairedEntryManager_Init(
    PairedEntryManager *self, Graphics3dPresentation *renderContext)
{
    s32 index;

    VecFx32Object_Init(&self->origin);
    __construct_array(self->entryPoints, PAIRED_ENTRY_CAPACITY,
                      sizeof(TouchPoint), PairedEntryPoint_Init,
                      PairedEntryPoint_Destroy);
    self->renderContext = renderContext;
    self->mode = 0;
    self->emissionCountdown = 1;
    self->mode2IntervalIndex = 0;
    self->renderParity = 0;
    self->spawnGateCounter = 0;
    for (index = PAIRED_ENTRY_CAPACITY - 1; index >= 0; --index) {
        self->entryWavePhases[index] = 0;
        self->entryHorizontalVelocityOrGrowthState[index] = 0;
    }
    return self;
}

/* Change presentation mode and update the integer-pixel origin. Repeating the
 * current mode is a no-op, including for the supplied origin. Mode one resets
 * its scheduler, while mode zero clears active entries. The stored signed mode
 * is returned. */
s32 PairedEntryManager_SetModeAndOrigin(PairedEntryManager *self, s32 mode,
                                        s32 originX, s32 originY)
{
    if ((s32)self->mode == mode)
        return self->mode;

    self->mode = (s8)mode;
    if (self->mode == 1) {
        self->emissionCountdown = 1;
        self->mode2IntervalIndex = 0;
        self->renderParity = 0;
        self->spawnGateCounter = 0;
    }
    self->origin.value.x = (s32)((u32)originX << 12);
    self->origin.value.y = (s32)((u32)originY << 12);
    self->origin.value.z = 0;
    if (self->mode == 0)
        PairedEntryManager_Clear(self);
    return self->mode;
}

/* Multiply signed Q20.12 values with retail's positive-half-unit rounding. */
static fx32 PairedEntryManager_MultiplyFx32Rounded(s32 lhs, s32 rhs)
{
    return (fx32)(((s64)lhs * rhs + 0x800) >> 12);
}

/* Consume one PRNG value and map its masked bits to [-40, 38.75] pixels. */
static fx32 PairedEntryManager_RandomHorizontalPosition(void)
{
    return PairedEntryManager_MultiplyFx32Rounded(
               (s32)(genrand_int32() & 0xfc0), 0x50000) -
           0x28000;
}

/* Initialize the highest-numbered inactive entry for one of the three known
 * motion patterns. A free slot always consumes two random horizontal anchors;
 * patterns zero and one consume a third value for width amplitude. Return one
 * on activation or zero when all fifteen entries are active. */
s32 PairedEntryManager_SpawnEntry(PairedEntryManager *self, s32 pattern,
                                  s32 excludedRenderPage)
{
    s32 index;

    for (index = PAIRED_ENTRY_CAPACITY - 1; index >= 0; --index) {
        fx32 firstPosition;
        fx32 secondPosition;
        fx32 initialPosition;

        if (self->entryHorizontalVelocityOrGrowthState[index] != 0)
            continue;

        firstPosition = PairedEntryManager_RandomHorizontalPosition();
        secondPosition = PairedEntryManager_RandomHorizontalPosition();
        initialPosition = firstPosition;
        if (pattern == 2) {
            self->entryHorizontalVelocityOrGrowthState[index] = 1;
            self->entryHalfWidthAmplitudes[index] = 0x28000;
            initialPosition = 0;
        } else if (pattern == 1) {
            self->entryHorizontalVelocityOrGrowthState[index] =
                PairedEntryManager_MultiplyFx32Rounded(
                    secondPosition - firstPosition, 0x25);
            self->entryHalfWidthAmplitudes[index] =
                PairedEntryManager_MultiplyFx32Rounded(
                    (s32)(genrand_int32() & 0xfff), 0x5000) +
                0x3000;
        } else {
            self->entryHorizontalVelocityOrGrowthState[index] = -1;
            self->entryHalfWidthAmplitudes[index] =
                PairedEntryManager_MultiplyFx32Rounded(
                    (s32)(genrand_int32() & 0xfff), 0x2000) +
                0x1000;
        }

        self->entryWavePhases[index] = 0;
        self->entryExcludedRenderPages[index] = excludedRenderPage;
        self->entryPoints[index].x = (u32)initialPosition;
        self->entryPoints[index].y = 0x28000;
        return 1;
    }
    return 0;
}

/* Initializes the 30-slot presentation manager, records owner, and returns
 * the caller-provided storage. */
SpriteEffectManager *SpriteEffectManager_Init(SpriteEffectManager *manager,
                                              void *renderContext)
{
    s32 index;

    manager->renderContext = renderContext;
    for (index = SPRITE_EFFECT_SLOT_COUNT - 1; index >= 0; --index)
        manager->effects[index] = 0;
    manager->renderSuppressed7c = 0;
    return manager;
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
void Graphics3dPresentation_BeginFrame(
    Graphics3dPresentation *self, const VecFx32Object *worldPosition)
{
    u8 *bytes = (u8 *)self;

    if (self->frameOpen != 0)
        return;
    func_020050a4(bytes + 0x84, worldPosition);
    func_020b0558();
    self->frameOpen = 1;
}

/* End a presentation frame. A nonzero argument requests a geometry-buffer
 * swap through the DS command register; all calls clear the per-frame guard so
 * the next update can install a new position. */
void Graphics3dPresentation_EndFrame(Graphics3dPresentation *self,
                                     s32 swapBuffers)
{
    if (swapBuffers != 0)
        *(volatile u32 *)0x04000540 = 1;
    self->frameOpen = 0;
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
 * the presentation's resource profile. Allocations remain owned by the
 * object.
 */
void Graphics3dPresentation_ReloadResources(Graphics3dPresentation *self)
{
    func_0209a4f0(self);
    func_0209a748(self, self->resourceProfile != 0 ? 3 : 8);
}

/* Skip presentation drawing without disabling manager updates, frame setup,
 * display routing, or resident resources. */
void Graphics3dPresentation_SuppressDrawing(Graphics3dPresentation *self)
{
    self->drawSuppressed = 1;
}

/* Resume presentation drawing without changing lifecycle or resource state. */
void Graphics3dPresentation_ResumeDrawing(Graphics3dPresentation *self)
{
    self->drawSuppressed = 0;
}

/* Return whether presentation drawing is suppressed; no state is changed. */
u32 Graphics3dPresentation_IsDrawingSuppressed(
    const Graphics3dPresentation *self)
{
    return self->drawSuppressed;
}

/* Forward sprite-effect controls through the presentation-owned 30-slot
 * manager. Retail narrows every caller-provided handle to eight bits before
 * indexing; the manager and its live effects remain owned by self. */
void Graphics3dPresentation_RemoveSpriteEffect(
    Graphics3dPresentation *self, u32 effectHandle)
{
    SpriteEffectManager_RemoveEffectAt(self->spriteEffectManager,
                                       (u8)effectHandle);
}

void Graphics3dPresentation_SetSpriteEffectAngularVelocityRange(
    Graphics3dPresentation *self, u32 effectHandle,
    u16 angularVelocityRange)
{
    SpriteEffectManager_SetAngularVelocityRange(
        self->spriteEffectManager, (u8)effectHandle, angularVelocityRange);
}

void Graphics3dPresentation_SetSpriteEffectParticleLifetime(
    Graphics3dPresentation *self, u32 effectHandle, s16 particleLifetime)
{
    SpriteEffectManager_SetParticleLifetime(
        self->spriteEffectManager, (u8)effectHandle, particleLifetime);
}

void Graphics3dPresentation_SetSpriteEffectMinimumEmissionInterval(
    Graphics3dPresentation *self, u32 effectHandle, s16 minimumInterval)
{
    SpriteEffectManager_SetMinimumEmissionInterval(
        self->spriteEffectManager, (u8)effectHandle, minimumInterval);
}

void Graphics3dPresentation_SetSpriteEffectVertexDepth(
    Graphics3dPresentation *self, u32 effectHandle, s16 vertexDepth)
{
    SpriteEffectManager_SetVertexDepth(self->spriteEffectManager,
                                       (u8)effectHandle, vertexDepth);
}

/* Select a paired-entry mode at an integer-pixel origin. Retail accepts only
 * modes zero through three and maps every other value to the clear mode. */
s32 Graphics3dPresentation_SetPairedEntryModeAt(
    Graphics3dPresentation *self, s32 mode, s32 originX, s32 originY)
{
    if (mode < 0 || mode > 3)
        mode = 0;
    return PairedEntryManager_SetModeAndOrigin(
        self->pairedEntryManager, mode, originX, originY);
}

/* Request the retained rupee's animated visibility state. Only retail value
 * one shows it: the supplied integer coordinates become its compensated Q12
 * position, scale restarts at one, and the instance activates immediately.
 * Every other value requests the existing shrink-to-hide transition. */
void Graphics3dPresentation_SetRupeeVisibleAt(
    Graphics3dPresentation *self, s32 visible, s32 x, s32 y)
{
    if (visible < 0 || visible > 1)
        visible = 0;
    if (visible != 1) {
        self->rupeeHideRequested = 1;
        return;
    }

    self->rupeePosition.value.x = (s32)((u32)x << 7);
    self->rupeePosition.value.y = -(s32)((u32)y << 7);
    self->rupeePosition.value.z = -0x5800;
    self->rupeeScale = 1;
    self->rupeeHideRequested = 0;
    RupeeMeshInstance_Activate(self->rupeeMeshInstance);
}

/*
 * Retail 0x020A2348: select the 2D BG0 path. A nonzero release_resources
 * releases owned 3D VRAM first; a nonzero configure_display selects main
 * engine mode 1/BG mode 0 and removes BG0 from the visible plane mask. The
 * presentation's enabled state becomes false.
 */
void Graphics3dPresentation_Disable(Graphics3dPresentation *self,
                                    s32 releaseResources,
                                    s32 configureDisplay)
{
    volatile u32 *display_control = (volatile u32 *)0x04000000;

    if (releaseResources != 0)
        func_0209b478(self);
    if (configureDisplay != 0) {
        GX_SetGraphicsMode(1, 0, 0);
        *display_control = (*display_control & ~0x1f00u) |
                           (((*display_control >> 8) & 0x1eu) << 8);
    }
    self->enabled = 0;
}

/*
 * Retail 0x020A23A8: select the 3D BG0 path. Display configuration preserves
 * all visible planes while enabling BG0; optional resource setup reloads the
 * profile-selected texture set. The presentation's enabled state becomes
 * true.
 */
void Graphics3dPresentation_Enable(Graphics3dPresentation *self,
                                   s32 loadResources,
                                   s32 configureDisplay)
{
    volatile u32 *display_control = (volatile u32 *)0x04000000;

    if (configureDisplay != 0) {
        GX_SetGraphicsMode(1, 0, 1);
        *display_control = (*display_control & ~0x1f00u) |
                           ((((*display_control >> 8) & 0x1fu) | 1u) << 8);
    }
    if (loadResources != 0)
        Graphics3dPresentation_ReloadResources(self);
    self->enabled = 1;
}

/*
 * Initialize the caller-owned presentation for one resource profile, create
 * its three child managers, seed the retained transform, and return self.
 * This portable body covers the profile-one path used by
 * RuntimePresentationManager; retail profile zero also configures display
 * routing and performs a second resource reset/reload that remains unrecovered
 * here.
 */
Graphics3dPresentation *Graphics3dPresentation_Init(
    Graphics3dPresentation *self, s32 resourceProfile)
{
    VecFx32Object vector;
    void *allocation;

    VecFx32Object_Init(&self->lightingReference);
    VecFx32Object_Init(&self->framePosition);
    VecFx32Object_Init(&self->rupeePosition);
    self->resourceProfile = resourceProfile;
    func_0209a4f0(self);
    if (resourceProfile == 0)
        func_0209a748(self, 8);

    allocation = Heap_Alloc(0x2c, data_020f32e8, 4, &gHeapContext);
    self->rupeeMeshInstance =
        RupeeMeshInstance_Init((RupeeMeshInstance *)allocation);
    RupeeMeshInstance_BindDefaultMesh(self->rupeeMeshInstance);
    allocation = Heap_Alloc(sizeof(PairedEntryManager),
                            gPairedEntryManagerAllocationTag, 4,
                            &gHeapContext);
    self->pairedEntryManager = PairedEntryManager_Init(
        (PairedEntryManager *)allocation, self);
    allocation = Heap_Alloc(0x80, gSpriteEffectManagerAllocationTag, 4, &gHeapContext);
    self->spriteEffectManager = SpriteEffectManager_Init(
        (SpriteEffectManager *)allocation, self);
    self->drawSuppressed = 0;
    self->enabled = 1;
    func_0200500c(&vector, 0, 0x1800, -0x5800);
    VecFx32Object_Assign(&self->rupeePosition, &vector);
    VecFx32_TerminateNoOp(&vector);
    self->rupeeScale = 0;
    self->rupeeHideRequested = 0;
    return self;
}

/* Release the two value-only vectors, clear the borrowed descriptor, and
 * return the still caller-owned instance. */
RupeeMeshInstance *RupeeMeshInstance_Destroy(RupeeMeshInstance *self)
{
    self->meshDescriptor = 0;
    VecFx32Object_Destroy(&self->scale);
    VecFx32Object_Destroy(&self->translation);
    return self;
}

/* Confirmed no-op destructor hook for the 30-slot manager. */
SpriteEffectManager *SpriteEffectManager_Destroy(SpriteEffectManager *manager)
{
    return manager;
}

/* Destroy the fifteen value-only entry points and origin, then return the
 * caller-owned manager without freeing its enclosing allocation. */
PairedEntryManager *PairedEntryManager_Destroy(PairedEntryManager *self)
{
    __destroy_arr(self->entryPoints, PAIRED_ENTRY_CAPACITY,
                  sizeof(TouchPoint), PairedEntryPoint_Destroy);
    VecFx32Object_Destroy(&self->origin);
    return self;
}

/* Release the base 3D VRAM ownership and destroy its two retained vectors. */
void *func_0209a5cc(void *object)
{
    Graphics3dPresentation *self = (Graphics3dPresentation *)object;
    u8 *bytes = (u8 *)self;

    func_020ae740();
    func_020ae72c();
    *(u32 *)(bytes + 0x4d0) = 0;
    VecFx32_TerminateNoOp(bytes + 0x84);
    VecFx32_TerminateNoOp(bytes + 0x70);
    return self;
}

/*
 * Destroy and free the three owned child managers, then release the retained
 * transform and base graphics state. The caller still owns self.
 */
Graphics3dPresentation *Graphics3dPresentation_Destroy(
    Graphics3dPresentation *self)
{
    void *child;

    child = self->rupeeMeshInstance;
    if (child != 0) {
        RupeeMeshInstance_Destroy((RupeeMeshInstance *)child);
        Heap_Free(child);
    }
    child = self->spriteEffectManager;
    if (child != 0) {
        SpriteEffectManager_Destroy((SpriteEffectManager *)child);
        Heap_Free(child);
    }
    child = self->pairedEntryManager;
    if (child != 0) {
        PairedEntryManager_Destroy((PairedEntryManager *)child);
        Heap_Free(child);
    }
    VecFx32Object_Destroy(&self->rupeePosition);
    func_0209a5cc(self);
    return self;
}
