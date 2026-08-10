/*
 * Recovered overlay 552 interpreter-data subsystem.
 *
 * The overlay installs an embedded interpreter program and initializes engine
 * state held in three zero-initialized work areas. Address-derived names remain
 * because the record semantics are not yet confirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov552_02233c60(void);

/* Interpreter records and zero-initialized work areas used by the initializer. */
extern unsigned char data_ov552_022343ce[];
extern unsigned char data_ov552_02234440[];
extern unsigned char data_ov552_02234444[];
extern unsigned char data_ov552_02233ca0[];
