/*
 * Recovered overlay 71 scripted presentation and transition subsystem.
 *
 * The overlay owns presentation arrays and coordinates scene phases with
 * overlays 23, 31, 36, and 42 plus shared graphics and effect services.
 * Unconfirmed object members retain offset-based descriptions.
 */

/* Initializes a small resource owner and embedded helper, clears runtime fields, and returns the owner after shared construction. */
void func_ov071_0220fd20(void);

/* Constructs the main scene object, presentation arrays, resources, and transforms; returns the initialized object. */
void func_ov071_0220fd60(void);

/* Initializes a three-word record with its overlay descriptor and zero payload; no SDK service is called. */
void func_ov071_02210184(void);

/* Empty array-element destructor: changes no state and returns no meaningful value. */
void func_ov071_022101a0(void);

/* Destroys arrays and embedded resources and invokes shared base teardown; returns the released object. */
void func_ov071_022101a4(void);

/* Configures a presentation record from coordinates, enables rendering, and submits it through a shared helper. */
void func_ov071_02210230(void);

/* Stores fixed-point coordinates and clears progress fields; no direct SDK or hardware call occurs. */
void func_ov071_02210284(void);

/* Updates presentation parameters and resources using shared graphics helpers; returns update status. */
void func_ov071_022102ac(void);

/* Applies transform data through shared graphics services; mutates the object and returns helper status. */
void func_ov071_02210354(void);

/* Copies or derives an offset-based transform field; mutates only the destination with no SDK call. */
void func_ov071_02210440(void);

/* Configures one presentation record and submits its resource; returns the shared operation status. */
void func_ov071_02210514(void);

/* Returns or stores a small offset-based controller value without SDK or hardware effects. */
void func_ov071_02210540(void);

/* Returns or stores a second offset-based controller value without SDK or hardware effects. */
void func_ov071_02210554(void);

/* Performs scene setup and resource updates through shared presentation/effect calls; returns setup status. */
void func_ov071_02210560(void);

/* Advances the main scripted controller with overlay 36, resources, transforms, sound, and effects; returns frame status. */
void func_ov071_0221083c(void);

/* Copies an offset-based runtime value between records; changes only destination state with no SDK call. */
void func_ov071_02211158(void);

/* Copies another offset-based runtime value between records; changes only destination state with no SDK call. */
void func_ov071_02211178(void);

/* Copies or initializes a compact presentation payload; mutates destination state without direct SDK interaction. */
void func_ov071_02211190(void);

/* Initializes the presentation collection and shared resource handles; mutates the scene and returns setup status. */
void func_ov071_022111b4(void);

/* Returns an offset-based field from the supplied record without changing state or invoking SDK services. */
void func_ov071_02211398(void);

/* Returns a second offset-based field from the supplied record without changing state or invoking SDK services. */
void func_ov071_022113cc(void);

/* Updates a presentation record's enabled state and coordinates through a graphics helper; returns its result. */
void func_ov071_022113fc(void);

/* Initializes an offset-based scene subrecord from supplied parameters; returns the initialized record or status. */
void func_ov071_02211514(void);

/* Advances a secondary scripted controller with effects, transforms, and resources; returns frame status. */
void func_ov071_022115bc(void);

/* Initializes or copies a runtime record through the local initializer; returns its result. */
void func_ov071_022119bc(void);

/* Copies an offset-based payload when source and destination differ; returns no meaningful value. */
void func_ov071_022119f4(void);

/* Coordinates overlay 23 and 42 callbacks for a scripted transition; mutates state and returns transition status. */
void func_ov071_02211a10(void);

/* Updates a scripted transition using overlays 31 and 42 and local record helpers; returns frame status. */
void func_ov071_02211ca4(void);

/* Configures a shared effect/resource sequence and dispatches local callbacks; returns operation status. */
void func_ov071_02211e98(void);

/* Returns a fixed controller result or field without state changes or direct SDK effects. */
void func_ov071_02212090(void);

/* Dispatches a resource operation through shared helpers and local callbacks; mutates state and returns its result. */
void func_ov071_022120a4(void);

/* Performs overlay static initialization and installs callback/data descriptors; returns no meaningful value. */
void func_ov071_02212210(void);

