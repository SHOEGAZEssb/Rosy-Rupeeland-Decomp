/*
 * Recovered overlay 478 interpreter-data subsystem.
 *
 * The overlay installs an embedded interpreter program and initializes engine
 * state held in two zero-initialized work areas. Address-derived names remain
 * because the record semantics are not yet confirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov478_02233c60(void);

/* Interpreter records and zero-initialized work areas used by the initializer. */
extern unsigned char data_ov478_02233ca0[];
extern unsigned char data_ov478_022347b6[];
extern unsigned char data_ov478_02234b60[];
extern unsigned char data_ov478_02234b64[];
