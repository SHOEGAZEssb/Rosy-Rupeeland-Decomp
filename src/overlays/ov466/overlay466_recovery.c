/*
 * Recovered overlay 466 interpreter-data subsystem.
 *
 * The overlay installs an embedded interpreter program and initializes engine
 * state held in three zero-initialized work areas. Address-derived names remain
 * because the record semantics are not yet confirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov466_02233c60(void);

/* Interpreter record and zero-initialized work areas used by the initializer. */
extern unsigned char data_ov466_022342a2[];
extern unsigned char data_ov466_02234380[];
extern unsigned char data_ov466_02234384[];
extern unsigned char data_ov466_02234388[];
