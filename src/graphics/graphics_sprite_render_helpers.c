#include "tingle/graphics_sprite_render_helpers.h"
#include "tingle/graphics_transfer_queue.h"

/*
 * Small helpers shared by the sprite render builders: extension of the most
 * recently queued transfer and a halfword-safe copy of an OAM template.
 */

/*
 * Add additionalBytes to the tail transfer's byte count. An empty queue is
 * ignored. Queue links are unchanged, no value is returned, and there is no
 * SDK or graphics-hardware access.
 */
void GraphicsTransferQueue_ExtendTailSize(GraphicsTransferQueue *queue,
                                          u32 additionalBytes)
{
    GraphicsTransferEntry *tail = queue->tail;

    if (tail != 0) {
        tail->sizeBytes += additionalBytes;
    }
}

/*
 * Copy all four halfwords from source to destination in ascending offset order.
 * The explicit 16-bit accesses preserve the retail alignment contract. Returns
 * no value and has no SDK or graphics-hardware effects.
 */
void GraphicsSpriteOamRecord_Copy(GraphicsSpriteOamRecord *destination,
                                  const GraphicsSpriteOamRecord *source)
{
    destination->attribute0 = source->attribute0;
    destination->attribute1 = source->attribute1;
    destination->attribute2 = source->attribute2;
    destination->cellMetadata = source->cellMetadata;
}
