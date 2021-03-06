import * as log from "https://deno.land/std@0.82.0/log/mod.ts";
import * as path from "https://deno.land/std@0.82.0/path/mod.ts";

import { cac } from "https://unpkg.com/cac/mod.ts";

import { main as edit } from "./edit.ts";
import { homeDirectory } from "../utils.ts";

export async function main(scriptName: string) {
  const scriptPath = path.join(
    await homeDirectory(),
    "setup",
    "shell-utils",
    "scripts",
    `${scriptName}.ts`,
  );
  log.info(`Editing ~/setup/shell-utils/scripts/${scriptName}`);
  await edit(scriptPath);
}

const cli = cac((import.meta.url.split("/").pop() ?? "").replace(".ts", ""));
cli.command("[scriptName]", "Name of the script to edit").action(
  async (scriptName = "init") => {
    await main(scriptName);
  },
);
cli.help();

if (import.meta.main) {
  try {
    cli.parse();
  } catch (e) {
    log.error(e);
    cli.outputHelp();
  }
}
