import * as log from "https://deno.land/std@0.129.0/log/mod.ts";
import * as path from "https://deno.land/std@0.129.0/path/mod.ts";

import { cac } from "https://unpkg.com/cac@6.7.12/mod.ts";

import { homeDirectory } from "../utils.ts";

export async function main() {
  const home = homeDirectory();
  const winhome = path.join(home, "winhome");
  const onedrive = path.join(winhome, "OneDrive");
  const storage = path.join(onedrive, "Essentials");
  log.info(`Processing dotfiles in ${storage}`);

  for await (const file of Deno.readDir(storage)) {
    if (file.name.startsWith("dotfile")) {
      const destinationName = file.name.replace("dotfile", "");
      const destinationPath = path.join(winhome, destinationName);
      const sourcePath = path.join(storage, file.name);
      log.debug(file);
      try {
        await Deno.lstat(destinationPath);
        log.warning(`${destinationPath} already exists`);
      } catch(error) {
        await Deno.symlink(sourcePath, destinationPath);
        log.info(`${destinationPath} created`);
      }
    }
  }

  // const appData = path.join(winhome, "AppData");
  // const appStorage = path.join(storage, "AppData");
  // log.info(appData);
  // log.info(appStorage);
  log.critical("AppData is not supported yet");

  await Promise.resolve();
}

const cli = cac((import.meta.url.split("/").pop() ?? "").replace(".ts", ""));
cli.command("", "Command description")
  // cli.command("[argument]", "Some optional positional argument")
  //   .option("--foo", "Some boolean option")
  //   .option("--bar <bar>", "Some text option")
  //   .option("--foobar [foobar]", "Some text or boolean option", { default: true })
  //   .action(async (argument = "default value", options: { foo: boolean, bar: string, foobar: boolean | string }) => {
  // cli.command("<argument>", "Some mandatory positional argument")
  .action(async () => {
    await main();
  });
cli.help();

if (import.meta.main) {
  try {
    cli.parse();
  } catch (e) {
    log.error(e);
    cli.outputHelp();
  }
}
