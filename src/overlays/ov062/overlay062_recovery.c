/*
 * Recovered overlay 62 multi-variant scripted scene subsystem.
 *
 * The overlay provides shared graphics-resource helpers plus three related
 * Scene implementations.  They allocate presentation objects, drive actors
 * and sound, and route transitions through shared scene callbacks.  Unknown
 * object members retain offset-based descriptions.
 */

/* Copies or resets the small graphics descriptor supplied through ABI
 * registers; it changes only caller-owned fields and returns no value. */
void func_ov062_0220fd20(void);

/* Initializes a compact shared descriptor from its inputs and returns the
 * ABI-prescribed pointer/result without direct SDK effects. */
void func_ov062_0220fd30(void);

/* Configures one graphics resource record through the shared resource API;
 * it mutates the record and returns no meaningful value. */
void func_ov062_0220fd50(void);

/* Finalizes a graphics resource record and submits its derived SDK data;
 * it changes resource state and returns no meaningful value. */
void func_ov062_0220fdbc(void);

/* Initializes three offset-selected resource records and associated graphics
 * state; it returns the initialized owner/result. */
void func_ov062_0220fdf4(void);

/* Applies the recovered presentation parameters to a shared graphics object;
 * it changes SDK render state and returns no meaningful value. */
void func_ov062_0220fe38(void);

/* Stores an inferred presentation state in its offset-based owner and returns
 * the ABI-prescribed value without direct SDK calls. */
void func_ov062_0220fe58(void);

/* Constructs the first scene variant, allocating graphics/actor state,
 * consulting GameWork flags, starting sound, and returning the scene. */
void func_ov062_0220fe78(void);

/* Destroys the first scene variant's actor, graphics, heap, and base Scene
 * resources while retaining the scene allocation; returns no value. */
void func_ov062_02210180(void);

/* Deleting destructor for the first scene variant; performs ordinary teardown
 * and conditionally frees the scene according to the deletion flag. */
void func_ov062_02210324(void);

/* Advances the first scene state machine, updates actors/resources, dispatches
 * indirect transitions, and returns the frame status. */
void func_ov062_022104d0(void);

/* Invokes the first variant's indirect transition callback selected from
 * shared routing data and returns its result. */
void func_ov062_02210650(void);

/* Constructs the second scene variant and its graphics/actor allocations,
 * sets scene flags, and returns the initialized scene pointer. */
void func_ov062_02210674(void);

/* Destroys second-variant resources but retains the scene allocation; it
 * changes graphics/actor/base-scene state and returns no value. */
void func_ov062_0221085c(void);

/* Deleting destructor for the second variant; tears down resources and
 * conditionally frees the scene allocation. */
void func_ov062_02210914(void);

/* Advances the second scene state machine and routed actor/resource updates,
 * returning the observable frame status. */
void func_ov062_022109d4(void);

/* Invokes the second variant's indirect transition callback and returns its
 * result without otherwise interpreting global routing data. */
void func_ov062_02210b14(void);

/* Constructs the third, larger scripted scene, allocating multiple graphics
 * and actor records and initializing sound and scene flags; returns the scene. */
void func_ov062_02210b38(void);

/* Destroys third-variant actors, graphics, sound, and base Scene resources
 * while retaining the allocation; returns no meaningful value. */
void func_ov062_02211050(void);

/* Deleting destructor for the third variant; performs full teardown and frees
 * the scene when required by the ABI deletion flag. */
void func_ov062_022111e8(void);

/* Runs the third variant's large scripted state machine, updating sound,
 * actors, graphics, allocations, and transitions; returns frame status. */
void func_ov062_02211388(void);

/* Invokes the third variant's indirect transition callback selected through
 * shared routing data and returns its result. */
void func_ov062_02211acc(void);
