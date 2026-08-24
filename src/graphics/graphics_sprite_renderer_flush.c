
/*
 * Portable reconstruction of the assembly-selected VBlank sprite upload at
 * 0x020748A8. It consumes the recovered renderer's own transfer FIFO, keeps
 * the retail main/sub dispatch and ordering, resets shadow OAM, and performs
 * the optional 0x6000-byte character upload through SDK hardware boundaries.
 */
#include "tingle/graphics_transfer_queue.h"
#include "tingle/graphics_lookup_cache.h"
#include "tingle/graphics_sprite_group.h"
#include "tingle/types.h"

extern void func_020b4554(void *address, u32 size);
extern void func_020b1d9c(const void *source, u32 destination, u32 size);
extern void func_020b1dfc(const void *source, u32 destination, u32 size);
extern void func_020b1e5c(const void *source, u32 destination, u32 size);
extern void func_020b1ec4(const void *source, u32 destination, u32 size);
extern void func_020b1f20(const void *source, u32 destination, u32 size);
extern void func_020b1f88(const void *source, u32 destination, u32 size);
extern void func_020b127c(const void *source, u32 destination, u32 size);
extern void func_020b1450(const void *source, u32 destination, u32 size);
extern void func_020b1230(void);
extern void func_020b12f0(void);
extern void func_020b13f8(void);
extern void func_020b14c4(void);
extern void GraphicsRenderEntryPool_Reset(void *pool);
extern void GraphicsRenderEntryPool_AppendRoot(void *pool, void *entry);
extern void *GraphicsRenderEntryPool_AllocateChain(void *pool,
                                                    s32 requested_count);
extern void GraphicsRenderEntryPool_SortRoots(void *pool);
extern void GraphicsSpriteStatePool_Release(void *pool, void *state);
extern void *func_02074b9c(void *renderer, void *resource);
extern void *GraphicsVramAllocator_Allocate(void *allocator, u16 size,
                                            void *owner, u32 alignment);
extern void GraphicsVramAllocator_Release(void *allocator, void *allocation);
extern void GraphicsSpriteState_BuildUnscaledOamChain(void *state, void *entry, void *queue);
extern void GraphicsSpriteState_BuildAffineOamChain(void *state, void *entry, void *queue,
                          GraphicsAffineMatrixCache *affineMatrixCache);
extern void GraphicsSpriteRenderer_ReleaseIndexedEntry(void *renderer,
                                                        void *entry);

/* Portable reconstruction of the assembly-selected frame builder at 0x020745C4.
 * A submission that cannot fit the remaining 128-entry OAM staging pool, or
 * whose graphics range cannot fit VRAM, is omitted for this frame. This keeps
 * malformed or over-budget presentation data from handing a partial/null
 * chain to the retail builders; valid submissions retain retail ordering and
 * effects. */
void func_020745c4(void *renderer_pointer, s32 sort_roots)
{
    u8 *renderer = (u8 *)renderer_pointer;
    GraphicsAffineMatrixCache *affineMatrixCache =
        (GraphicsAffineMatrixCache *)(renderer + 0x1a80);
    GraphicsSpriteGroup *group;
    s32 oam_index = 0;

    GraphicsRenderEntryPool_Reset(renderer + 0xe70);
    affineMatrixCache->nextFree = affineMatrixCache->searchBegin;
    if (*(u32 *)(renderer + 0x30) == 0)
        return;
    if (*(u32 *)(renderer + 0x38) != 0)
        GraphicsRenderEntryPool_AppendRoot(renderer + 0xe70,
                                            *(void **)(renderer + 0x0c));

    for (group = *(GraphicsSpriteGroup **)(renderer + 0x43c); group != 0;
         group = group->next) {
        u8 *state = (u8 *)group->head;

        if (group->renderEnabled != 0) {
            while (state != 0) {
                u8 *next = *(u8 **)(state + 0x08);
                u16 flags = *(u16 *)(state + 0x24);

                if ((flags & 0x100) != 0 && (flags & 1) != 0) {
                    void *pool = *(void **)state;
                    GraphicsSpriteGroup_RemoveState(
                        (GraphicsSpriteGroup *)pool,
                        (GraphicsSpriteState *)state);
                    GraphicsSpriteStatePool_Release(*(void **)pool, state);
                } else if ((flags & 0x1c) == 0) {
                    u16 cell_count =
                        GraphicsSpriteState_GetCurrentCellCount(
                            (GraphicsSpriteState *)state);
                    u32 allocated_count = *(u32 *)(renderer + 0x1a7c);
                    if (cell_count != 0 && allocated_count <= 128U &&
                        cell_count <= 128U - allocated_count) {
                        void *entry;

                        if (*(void **)(state + 0x10) == 0) {
                            *(void **)(state + 0x10) = func_02074b9c(
                                renderer, *(void **)(state + 0x18));
                        }
                        if (*(void **)(state + 0x0c) == 0) {
                            const u8 *animation = *(const u8 **)(state + 0x1c);
                            const u8 *metadata = *(const u8 **)(animation + 0x20);
                            *(void **)(state + 0x0c) =
                                GraphicsVramAllocator_Allocate(
                                    renderer + 0x448,
                                    *(const u16 *)(metadata + 0x24),
                                    *(void **)(state + 0x14), 2);
                        }
                        entry = *(void **)(state + 0x0c) != 0
                                    ? GraphicsRenderEntryPool_AllocateChain(
                                          renderer + 0xe70, cell_count)
                                    : 0;
                        if (entry != 0) {
                            if (*(s16 *)(state + 0x30) == 0 &&
                                *(s16 *)(state + 0x32) == 0x100 &&
                                *(s16 *)(state + 0x34) == 0x100) {
                                GraphicsSpriteState_BuildUnscaledOamChain(state, entry,
                                              renderer + 0x1d14);
                            } else {
                                GraphicsSpriteState_BuildAffineOamChain(state, entry,
                                              renderer + 0x1d14,
                                              affineMatrixCache);
                            }
                        }
                    }
                } else {
                    if (*(void **)(state + 0x10) != 0) {
                        GraphicsSpriteRenderer_ReleaseIndexedEntry(
                            renderer, *(void **)(state + 0x10));
                        *(void **)(state + 0x10) = 0;
                    }
                    if (*(void **)(state + 0x0c) != 0 &&
                        (*(u8 *)(state + 0x3b) & 1) == 0) {
                        GraphicsVramAllocator_Release(
                            renderer + 0x448, *(void **)(state + 0x0c));
                        *(void **)(state + 0x0c) = 0;
                    }
                }
                state = next;
            }
        } else {
            while (state != 0) {
                u8 *next = *(u8 **)(state + 0x08);
                if (*(void **)(state + 0x10) != 0) {
                    GraphicsSpriteRenderer_ReleaseIndexedEntry(
                        renderer, *(void **)(state + 0x10));
                    *(void **)(state + 0x10) = 0;
                }
                if (*(void **)(state + 0x0c) != 0 &&
                    (*(u8 *)(state + 0x3b) & 1) == 0) {
                    GraphicsVramAllocator_Release(
                        renderer + 0x448, *(void **)(state + 0x0c));
                    *(void **)(state + 0x0c) = 0;
                }
                state = next;
            }
        }
    }

    if (sort_roots != 0)
        GraphicsRenderEntryPool_SortRoots(renderer + 0xe70);
    {
        u8 *root = *(u8 **)(renderer + 0x1a70);
        while (root != 0 && oam_index < 128) {
            u8 *entry = root;
            do {
                *(u32 *)(renderer + 0x3c + oam_index * 8) =
                    *(u32 *)(entry + 0x10);
                *(u16 *)(renderer + 0x40 + oam_index * 8) =
                    *(u16 *)(entry + 0x14);
                ++oam_index;
                entry = *(u8 **)(entry + 0x08);
            } while (entry != 0 && oam_index < 128);
            root = *(u8 **)(root + 0x04);
        }
    }
    while (oam_index < 128) {
        u32 *attributes =
            (u32 *)(renderer + 0x3c + oam_index * 8);
        *attributes = (*attributes & ~0x300U) | 0x200U;
        ++oam_index;
    }
    func_020b4554(renderer + 0x3c, 0x400);
}

/*
 * Drain all queued character, palette, and extended-palette transfers to the
 * renderer-selected NDS engine, upload the shadow OAM, and optionally upload
 * the text character buffer. The queue is empty on return. This routine
 * performs cache maintenance and ordered SDK graphics transfers.
 */
void func_020748a8(void *renderer_pointer)
{
    u8 *renderer = (u8 *)renderer_pointer;
    GraphicsTransferQueue *queue =
        (GraphicsTransferQueue *)(renderer + 0x1d14);
    GraphicsTransferEntry *entry;
    u32 sub_engine;

    if (*(u32 *)(renderer + 0x30) == 0) {
        GraphicsTransferQueue_Reset(queue);
        return;
    }

    sub_engine = *(u32 *)(renderer + 0x24);
    entry = queue->head;
    while (entry != 0) {
        GraphicsTransferEntry *next = entry->nextOrFreeNext;

        switch (entry->transferKind) {
        case GRAPHICS_TRANSFER_KIND_OBJECT_CHARACTER:
            if (sub_engine)
                func_020b1d9c(entry->source, entry->destinationOffsetBytes,
                              entry->sizeBytes);
            else
                func_020b1dfc(entry->source, entry->destinationOffsetBytes,
                              entry->sizeBytes);
            break;
        case GRAPHICS_TRANSFER_KIND_OBJECT_PALETTE:
            if (sub_engine)
                func_020b1f20(entry->source, entry->destinationOffsetBytes,
                              entry->sizeBytes);
            else
                func_020b1f88(entry->source, entry->destinationOffsetBytes,
                              entry->sizeBytes);
            break;
        case GRAPHICS_TRANSFER_KIND_OBJECT_EXTENDED_PALETTE:
            if (*(u32 *)(renderer + 0x34) != 0) {
                if (sub_engine) {
                    func_020b12f0();
                    func_020b127c(entry->source,
                                  entry->destinationOffsetBytes,
                                  entry->sizeBytes);
                    func_020b1230();
                } else {
                    func_020b14c4();
                    func_020b1450(entry->source,
                                  entry->destinationOffsetBytes,
                                  entry->sizeBytes);
                    func_020b13f8();
                }
            }
            break;
        default:
            break;
        }
        GraphicsTransferQueue_Remove(queue, entry);
        entry = next;
    }

    if (sub_engine)
        func_020b1e5c(renderer + 0x3c, 0, 0x400);
    else
        func_020b1ec4(renderer + 0x3c, 0, 0x400);

    if (*(u32 *)(renderer + 0x0c) != 0 &&
        *(u32 *)(renderer + 0x38) != 0) {
        const void *source = *(const void **)(renderer + 0x00);
        u32 destination =
            (u32)*(const u16 *)(*(const u8 **)(renderer + 0x04) + 0x0e)
            << 7;

        func_020b4554((void *)source, 0x6000);
        if (sub_engine)
            func_020b1d9c(source, destination, 0x6000);
        else
            func_020b1dfc(source, destination, 0x6000);
    }
}
