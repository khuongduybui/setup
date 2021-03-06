import { exec, OutputMode } from "https://deno.land/x/exec/mod.ts";

type os = "linux" | "darwin" | "windows";
export const isWin = (os = Deno.build.os) => os === "windows";

export const homeDirectoryEnv = (os?: os) => isWin(os) ? "USERPROFILE" : "HOME";
export const homeDirectory = (os?: os) =>
  Deno.env.get(homeDirectoryEnv(os)) ?? "/";

export const executable = async (command: string) => {
  const checkCommand = isWin()
    ? `cmd /C "where ${command}"`
    : `sh -c "command -v ${command}"`;
  return (await exec(checkCommand, { output: OutputMode.None })).status.success;
};

export const editor = async (options = { wait: true }) => {
  if (await executable("code")) return ["code", options.wait ? "-w" : ""];
  return (isWin() ? ["notepad"] : ["editor"]);
};
