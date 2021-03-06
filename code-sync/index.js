require('colors');
const fs = require('fs');
const JSON5 = require('json5');
const path = require('path');

const workspaceExtension = '.code-workspace';
const encoding = 'utf8';

// const codepath = path.resolve(__dirname, '..', '..', 'code');
const codepath = path.resolve(process.env.HOME, 'code');
const dirs = fs.readdirSync(codepath).filter((dir) => fs.lstatSync(path.resolve(codepath, dir)).isDirectory());

dirs
  .filter((dir) => {
    const dirpath = path.resolve(codepath, dir);
    const hasDevcontainer = fs.existsSync(path.resolve(dirpath, '.devcontainer')) || fs.existsSync(path.resolve(dirpath, '.devcontainer.json'));
    if (hasDevcontainer) {
      console.log('Skipping', dir.yellow.underline, 'as .devcontainer found under', dirpath.cyan.underline);
    }
    return !hasDevcontainer;
  })
  .forEach((dir) => {
    console.log('Processing', dir.yellow.underline);
    const dirpath = path.resolve(codepath, dir);
    const workspacePath = path.resolve(codepath, `${dir}${workspaceExtension}`);

    let workspace = { folders: [], settings: {} };
    if (fs.existsSync(workspacePath)) {
      console.log('>', 'Reading existing', workspacePath.cyan.underline);
      const workspaceRaw = fs.readFileSync(workspacePath, { encoding });
      workspace = JSON5.parse(workspaceRaw);
    }

    console.log('>', 'Listing existing directories in', dirpath.cyan.underline);
    workspace.folders = workspace.folders
      .concat(
        fs
          .readdirSync(dirpath)
          .filter((name) => fs.lstatSync(path.resolve(dirpath, name)).isDirectory())
          .map((name) => ({ path: path.join(dir, name) })),
      )
      .filter(({ path: folder }, index, folders) => folders.map(({ path: folder }) => folder).indexOf(folder) === index)
      .filter(({ path: folder }) => fs.existsSync(path.join(codepath, folder)))
      .sort(({ path: a }, { path: b }) => a.localeCompare(b));

    console.log('>', 'Syncing to', workspacePath.cyan.underline);
    fs.writeFileSync(workspacePath, JSON.stringify(workspace), { encoding });

    console.log('>', 'Done'.green.underline);
  });
