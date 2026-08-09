/*
 * Recovered overlay 69 scripted multi-object scene and effect subsystem.
 *
 * The overlay constructs presentation resources, selects randomized motion,
 * coordinates sound and visual effects, and advances a large scripted scene
 * controller.  Several records are shared with overlay 49 and overlay 39;
 * fields whose meanings are not confirmed remain described by their offsets.
 */

/* Returns the overlay-owned descriptor at data_ov069_0221279c; the input is
 * ignored, no state changes occur, and no SDK service is called. */
void func_ov069_0220fd20(void);

/* Empty callback: accepts the ABI callback arguments, changes no observable
 * state, returns no meaningful value, and performs no hardware or SDK work. */
void func_ov069_0220fd3c(void);

/* Initializes two embedded record arrays and their presentation resources,
 * seeds randomized parameters, installs callbacks, and returns the object. */
void func_ov069_0220fd40(void);

/* Returns the overlay-owned descriptor at data_ov069_0221278c; it has no
 * observable side effects or hardware interaction. */
void func_ov069_0220fe0c(void);

/* Empty callback: consumes its ABI arguments, changes no state, and returns no
 * meaningful result without invoking SDK services. */
void func_ov069_0220fe28(void);

/* Returns the shared callback func_020050a4 for the supplied interface query;
 * no object or hardware state is modified. */
void func_ov069_0220fe2c(void);

/* Builds and submits the object's presentation resource descriptors, changing
 * the resource manager state and returning the shared helper result. */
void func_ov069_0220fe3c(void);

/* Updates a small offset-based state field from the supplied value and returns
 * the resulting status without direct SDK or hardware effects. */
void func_ov069_0220ff20(void);

/* Initializes the main scene controller, randomized motion records, resources,
 * and effects; returns the initialized object after shared SDK setup calls. */
void func_ov069_0220ff38(void);

/* Advances the controller's active resources and transforms, mutating its
 * offset-based runtime records and returning the shared update status. */
void func_ov069_0221070c(void);

/* Computes an address within the first embedded offset-based record array;
 * inputs are the owner and index, with no state or SDK effects. */
void func_ov069_02210928(void);

/* Computes an address within the second embedded offset-based record array;
 * inputs are the owner and index, with no observable side effects. */
void func_ov069_0221094c(void);

/* Returns overlay 49's func_ov049_0220c2dc callback for an interface query;
 * no state changes or SDK effects occur. */
void func_ov069_02210970(void);

/* Returns overlay 49's func_ov049_0220c3d8 callback for an interface query;
 * no state changes or SDK effects occur. */
void func_ov069_02210988(void);

/* Returns the local func_ov069_022115c0 update callback; the query changes no
 * state and performs no direct hardware work. */
void func_ov069_0221099c(void);

/* Returns the local func_ov069_02211778 update callback; the query has no
 * observable side effects or SDK interaction. */
void func_ov069_022109b0(void);

/* Initializes embedded arrays and callback slots, then invokes the local
 * record initializer; returns the prepared owner object. */
void func_ov069_022109c4(void);

/* Clears and initializes one offset-based runtime record from its arguments;
 * the record is mutated and no direct SDK or hardware service is used. */
void func_ov069_02210a24(void);

/* Configures randomized presentation and effect state for the supplied scene,
 * mutating several embedded records and calling shared resource services. */
void func_ov069_02210a44(void);

/* Advances randomized effect motion for the supplied runtime record, updates
 * transforms and counters, and returns the resulting frame status. */
void func_ov069_02210dc0(void);

/* Updates resource and state records, including a local descriptor finalize;
 * returns the shared operation status after observable resource changes. */
void func_ov069_0221100c(void);

/* Finalizes the supplied offset-based descriptor through shared helpers,
 * mutating its resource state and returning the helper result. */
void func_ov069_0221123c(void);

/* Advances the secondary state machine and its presentation transforms,
 * mutating counters/resources and returning its current frame status. */
void func_ov069_02211274(void);

/* Updates a small controller field from the supplied state and returns the
 * resulting value without direct SDK or hardware effects. */
void func_ov069_02211594(void);

/* Runs one scripted update branch, changing controller and presentation state,
 * triggering sound when required, and returning its transition status. */
void func_ov069_022115c0(void);

/* Runs the paired scripted update branch, mutating transform/counter state and
 * returning its transition status after shared presentation operations. */
void func_ov069_02211778(void);

/* Frees the supplied heap allocation through Heap_Free; no value is returned
 * and the pointer becomes invalid. */
void func_ov069_0221182c(void);

/* Frees the supplied heap allocation through Heap_Free; no value is returned
 * and the pointer becomes invalid. */
void func_ov069_02211840(void);

/* Initializes a heap-backed resource object from data_020f3058, mutating the
 * object and returning the shared resource initialization result. */
void func_ov069_02211854(void);

/* Constructs and updates a presentation object, invokes its indirect callback,
 * mutates owned state, and returns the resulting object/status. */
void func_ov069_02211894(void);

/* Tears down the supplied presentation helper and its owned resources; the
 * object is mutated and no meaningful value is returned. */
void func_ov069_0221193c(void);

/* Initializes a small offset-based helper record from the supplied arguments,
 * changing its fields and returning the initialized record/status. */
void func_ov069_0221195c(void);

/* Returns an offset-based field from the supplied helper without mutating state
 * or calling hardware and SDK services. */
void func_ov069_022119bc(void);

/* Returns a second offset-based field from the supplied helper without state,
 * hardware, or SDK side effects. */
void func_ov069_022119dc(void);

/* Advances the overlay's main scripted scene state machine, coordinating
 * overlay 39 callbacks, resources, transforms, sound, and visual effects; it
 * mutates the scene extensively and returns the current frame result. */
void func_ov069_022119f8(void);

/* Applies func_0209a2ac to both embedded presentation records, mutating their
 * shared resource state and returning no meaningful value. */
void func_ov069_022124c4(void);

/* Configures and submits a visual effect from the supplied scene parameters,
 * mutating shared effect state and returning the helper result. */
void func_ov069_022124f0(void);
