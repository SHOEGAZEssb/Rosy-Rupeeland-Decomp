/*
 * Recovered overlay 72 dual-screen scripted presentation subsystem.
 *
 * The overlay prepares main/sub display resources, constructs presentation
 * records, and advances a graphics-and-sound scene controller.  Unconfirmed
 * members retain offset-based descriptions.
 */

/* Loads and configures the overlay's graphics/resource tables from the supplied
 * context, changing display-owned state and returning the shared setup result. */
void func_ov072_0220fd20(void);

/* Initializes one display-side scene variant, allocating presentation resources
 * and configuring hardware layers; returns the resulting setup status. */
void func_ov072_0220ff04(void);

/* Applies the overlay's display control value to shared graphics state; mutates
 * hardware-facing state and returns no meaningful value. */
void func_ov072_0221004c(void);

/* Initializes the paired display-side scene variant and its presentation
 * resources, changing hardware layers and returning setup status. */
void func_ov072_02210070(void);

/* Creates the scene controller, delegates full initialization, and registers it
 * with the shared scene service; returns the constructed scene/result. */
void func_ov072_022101c0(void);

/* Constructs and advances the main scripted scene state, coordinating sprites,
 * transforms, sound, and display helpers; returns the current frame status. */
void func_ov072_02210214(void);

/* Stores an offset-based coordinate pair in the supplied presentation record;
 * mutates only that record and performs no direct SDK or hardware operation. */
void func_ov072_022107d4(void);

/* Copies an offset-based coordinate pair between presentation records; changes
 * the destination and returns no meaningful value without SDK calls. */
void func_ov072_022107f8(void);

/* Updates one presentation record's transform and enabled state from supplied
 * parameters; mutates graphics state and returns its status. */
void func_ov072_02210818(void);

/* Updates the paired presentation record's transform and enabled state from
 * supplied parameters; mutates graphics state and returns its status. */
void func_ov072_022108e8(void);
