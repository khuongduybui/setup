import { exec, OutputMode } from "https://deno.land/x/exec/mod.ts";

type os = "linux" | "darwin" | "windows";
export const isWin = (os = Deno.build.os) => os === "windows";

export const homeDirectoryEnv = (os?: os) => isWin(os) ? "USERPROFILE" : "HOME";
export const homeDirectory = (os?: os) =>
  Deno.env.get(homeDirectoryEnv(os)) ?? "/";

export const userEnv = (os?: os) => isWin(os) ? "USERNAME" : "USER";
export const user = (os?: os) => Deno.env.get(userEnv(os)) ?? "/";

export const executable = async (command: string) => {
  const checkCommand = isWin()
    ? `cmd /C "where ${command}"`
    : `sh -c "command -v ${command}"`;
  return (await exec(checkCommand, { output: OutputMode.None })).status.success;
};

export const editor = async (options = { wait: true }) => {
  if (await executable("subl")) return ["subl", options.wait ? "-w" : ""];
  if (await executable("io.elementary.code")) return ["io.elementary.code"];
  if (await executable("micro")) return ["micro"];
  if (await executable("code")) return ["code", "-r", options.wait ? "-w" : ""];
  return (isWin() ? ["notepad"] : ["editor"]);
};

export const invoke = (cmd: string[], options = {}) => {
  return Deno.run({ cmd, ...options }).status();
};

export const invokeShell = (shell: string[], cmd: string[], options = {}) => {
  const shellCommand = [
    ...shell,
    cmd.join(" "),
  ];

  return invoke(shellCommand, options);
};

export const fuzzyShell = async (
  shell: string[],
  query: string,
  cmd: string,
) => {
  const process = Deno.run({
    cmd: [
      ...shell,
      `${cmd} | fzf -1 -q ${query}`,
    ],
    stdout: "piped",
  });
  await process.status();
  return new TextDecoder().decode(await process.output()).trimEnd();
};
export const fuzzy = (
  shell: string[],
  query: string,
  candidates: string[],
) => fuzzyShell(shell, query, `echo "${candidates.join('"\\n"')}"`);
