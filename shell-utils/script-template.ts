import * as log from "https://deno.land/std@0.129.0/log/mod.ts";

import { cac } from "https://unpkg.com/cac@6.7.12/mod.ts";

export async function main(argument: string) {
  log.info(`Doing something with ${argument}`);
  await Promise.resolve();
}

const cli = cac((import.meta.url.split("/").pop() ?? "").replace(".ts", ""));
// cli.command("", "Command description")
// cli.command("[argument]", "Some optional positional argument")
//   .option("--foo", "Some boolean option")
//   .option("--bar <bar>", "Some text option")
//   .option("--foobar [foobar]", "Some text or boolean option", { default: true })
//   .action(async (argument = "default value", options: { foo: boolean, bar: string, foobar: boolean | string }) => {
cli.command("<argument>", "Some mandatory positional argument")
  .action(async (argument: string) => {
    await main(argument);
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
