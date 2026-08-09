/*
 * Recovered overlay 73 presentation collection and display-scene subsystem.
 *
 * The overlay constructs heap-backed presentation objects, manages collections
 * of child resources, and owns paired display-side scene variants.  Unconfirmed
 * members retain address-derived and offset-based descriptions.
 */

/* Constructs and configures a presentation object from resource inputs, mutating owned graphics state and returning the initialized object. */
void func_ov073_0220fd20(void);

/* Destroys the object's embedded resource and shared base state; returns the allocation without freeing it. */
void func_ov073_0220fdb8(void);

/* Deleting destructor: performs ordinary teardown, frees the allocation, and returns the invalidated pointer value used by the ABI. */
void func_ov073_0220fdd8(void);

/* Returns zero for the supplied interface query; it changes no state and performs no SDK or hardware work. */
void func_ov073_0220fe00(void);

/* Updates an offset-based presentation object from supplied parameters, changing resource state and returning the shared helper result. */
void func_ov073_0220fe08(void);

/* Submits the object's presentation resource and adjusts its animation frame from the supplied selector; enables rendering and returns no meaningful value. */
void func_ov073_0220feb8(void);

/* Stores current/target signed values in the supplied record; mutates only offset-based fields and performs no SDK call. */
void func_ov073_0220ff28(void);

/* Constructs and initializes a heap-backed presentation helper, its transform state, and shared effects; returns the prepared helper or status. */
void func_ov073_0220ff3c(void);

/* Initializes a transform helper and copies optional source payloads through the shared transform service; returns its result. */
void func_ov073_0221007c(void);

/* Builds the main scene/controller, resources, callbacks, and presentations; mutates display state and returns the constructed scene. */
void func_ov073_022100b4(void);

/* Constructs two embedded resource helpers in the supplied record and returns the initialized record. */
void func_ov073_022102bc(void);

/* Destroys every owned child through its virtual callback, releases the child array and embedded resources, and returns the owner. */
void func_ov073_022102dc(void);

/* Creates and configures the controller's child presentation collection and associated resources; returns the initialized controller/status. */
void func_ov073_02210338(void);

/* Applies a presentation update to every child in the controller using the supplied parameters; returns no meaningful value. */
void func_ov073_022106d0(void);

/* Initializes display-side scene resources and controllers, changing hardware-facing state and returning setup status. */
void func_ov073_02210710(void);

/* Destroys one display-side scene variant and its resources, then restores shared display state; returns no meaningful value. */
void func_ov073_02210900(void);

/* Destroys the paired display-side scene variant and its resources, then restores shared display state; returns no meaningful value. */
void func_ov073_02210980(void);

/* Creates both scene variants, configures their child collections, and registers shared callbacks; returns the resulting setup status. */
void func_ov073_02210a08(void);

/* Empty callback: accepts ABI arguments, changes no state, returns no meaningful value, and performs no SDK work. */
void func_ov073_02210b38(void);

/* Empty callback: accepts ABI arguments, changes no state, returns no meaningful value, and performs no SDK work. */
void func_ov073_02210b3c(void);

/* Empty callback: accepts ABI arguments, changes no state, returns no meaningful value, and performs no SDK work. */
void func_ov073_02210b40(void);

/* Empty callback: accepts ABI arguments, changes no state, returns no meaningful value, and performs no SDK work. */
void func_ov073_02210b44(void);

/* Empty callback: accepts ABI arguments, changes no state, returns no meaningful value, and performs no SDK work. */
void func_ov073_02210b48(void);

