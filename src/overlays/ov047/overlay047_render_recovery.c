#include "tingle/types.h"

/*
 * Overlay 47 capture-transition rendering. The recovered routine configures
 * display capture, clipping, texture state, and geometry FIFO commands for the
 * controller's animated quadrilateral. Exact assembly is retained because it
 * contains long sequences of volatile Nintendo DS MMIO writes.
 */

/*
 * Render one frame for `controller`. The routine resets shared 3D state,
 * installs an orthographic camera, configures capture through
 * func_ov047_0220c2c8, programs texture/polygon state from resource fields
 * +0x30/+0x34/+0x38..+0x40, submits rectangle edges +0x10..+0x1C to the
 * geometry FIFO, and conditionally draws the loaded model/animation according
 * to transition kind +0x20. It advances transition interpolation and returns
 * no value. This function directly affects capture, display, and geometry MMIO
 * plus SDK 3D state; its repeated command words are hardware packet encodings.
 */
extern "C" void func_ov047_0220bda8(void *controller);
