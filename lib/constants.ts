import { env } from "bun";
import { join } from "path";

export const COURSE_DIR = join(env.HOME!, "courses");
