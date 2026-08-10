/*
 * Recovered overlay 575 interpreter-data subsystem.
 *
 * The overlay installs an embedded interpreter program and initializes engine
 * state held in three zero-initialized work areas. Address-derived names remain
 * because the record semantics are not yet confirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov575_02233c60(void);

/* Interpreter records and zero-initialized work areas used by the initializer. */
extern unsigned char data_ov575_0223436a[];
extern unsigned char data_ov575_02234580[];
extern unsigned char data_ov575_02234584[];
extern unsigned char data_ov575_02233ca0[];
