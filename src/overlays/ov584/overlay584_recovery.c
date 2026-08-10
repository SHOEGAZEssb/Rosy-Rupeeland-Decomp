/*
 * Recovered overlay 584 interpreter-data subsystem.
 *
 * The overlay installs an embedded interpreter program and initializes engine
 * state held in three zero-initialized work areas. Address-derived names remain
 * because the record semantics are not yet confirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov584_02233c60(void);

/* Interpreter records and zero-initialized work areas used by the initializer. */
extern unsigned char data_ov584_0223455e[];
extern unsigned char data_ov584_022348e0[];
extern unsigned char data_ov584_022348e4[];
extern unsigned char data_ov584_02233ca0[];
