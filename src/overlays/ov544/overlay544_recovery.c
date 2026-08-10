/*
 * Recovered overlay 544 interpreter-data subsystem.
 *
 * The overlay installs an embedded interpreter program and initializes engine
 * state held in three zero-initialized work areas. Address-derived names remain
 * because the record semantics are not yet confirmed.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov544_02233c60(void);

/* Interpreter records and zero-initialized work areas used by the initializer. */
extern unsigned char data_ov544_0223468a[];
extern unsigned char data_ov544_02234a20[];
extern unsigned char data_ov544_02234a24[];
extern unsigned char data_ov544_02233ca0[];
