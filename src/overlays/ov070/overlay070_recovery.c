/*
 * Recovered overlay 70 multi-sprite scripted scene subsystem.
 *
 * The overlay owns several presentation records, copies and initializes their
 * transforms, and coordinates a large scripted sequence with overlay 41,
 * graphics, sound, and palette services.  Unconfirmed members remain described
 * by their original offsets.
 */

/* Initializes the supplied small resource owner, constructs its two embedded
 * helpers, clears runtime fields, and returns the owner without display I/O. */
void func_ov070_0220fd20(void);

/* Constructs the overlay's main scene object and its arrays of presentation
 * records, initializes resources/transforms, and returns the prepared object. */
void func_ov070_0220fd60(void);

/* Initializes a three-word offset-based record with its overlay vtable and
 * zero state; no SDK call is made and no meaningful value is returned. */
void func_ov070_02210218(void);

/* Empty element destructor: accepts an array element, changes no observable
 * state, returns no meaningful value, and performs no SDK or hardware work. */
void func_ov070_02210234(void);

/* Destroys the object's record arrays and embedded resources, then invokes the
 * shared base teardown; returns the object after its owned state is released. */
void func_ov070_02210238(void);

/* Configures one presentation record from the supplied owner and coordinates,
 * enables a render flag, and submits its resource through shared helpers. */
void func_ov070_0221028c(void);

/* Stores fixed-point origin and target coordinates in the supplied object and
 * clears its progress fields; no direct SDK or hardware operation occurs. */
void func_ov070_022102e0(void);

/* Allocates and initializes an offset-based resource group for the supplied
 * scene, changing ownership fields and returning the constructed result. */
void func_ov070_02210320(void);

/* Performs scene setup, creates presentation resources, initializes overlay 41
 * integration, and returns the resulting setup status after SDK operations. */
void func_ov070_022103d8(void);

/* Advances the main scripted scene state machine, coordinating overlay 41,
 * transforms, palettes, graphics, sound, and transitions; returns frame status. */
void func_ov070_02210860(void);

/* Forwards a copy operation to func_ov070_0221187c using the source record at
 * offset 0x1b8; the destination changes and the helper result is returned. */
void func_ov070_0221186c(void);

/* Copies the source record's two payload words into a destination initialized
 * with the overlay vtable; no SDK or hardware calls are made. */
void func_ov070_0221187c(void);

/* Copies two payload words when source and destination differ; it mutates only
 * the destination and returns no meaningful value. */
void func_ov070_0221189c(void);

/* Advances a secondary scripted controller with overlay 41 resources and
 * presentation operations, mutating runtime state and returning frame status. */
void func_ov070_022118b4(void);

/* Initializes and configures the overlay's complete presentation collection,
 * resource handles, animation parameters, and transform records; returns status. */
void func_ov070_02211dcc(void);

/* Updates a selected presentation record from scene-relative coordinates,
 * changing its enabled state and transform through shared graphics helpers. */
void func_ov070_022126b8(void);

/* Applies position and presentation parameters to an offset-based record,
 * mutating its transform and returning the shared graphics operation status. */
void func_ov070_02212764(void);

/* Updates a presentation record and submits an associated effect through shared
 * helpers, mutating resource state and returning the effect operation result. */
void func_ov070_0221282c(void);

/* Finds an eligible one of two presentation records, enables it, and stores
 * scene-relative coordinates; returns after updating at most one record. */
void func_ov070_02212908(void);

/* Overlay static initializer: installs constructor/destructor descriptors and
 * callback/data tables; mutates static state and returns no meaningful value. */
void func_ov070_02212998(void);
