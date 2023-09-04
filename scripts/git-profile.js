#! /usr/bin/env node
const fs = require("fs");
const os = require("os");
const path = require("path");

const [, , option, arg, additionalArg] = process.argv;

const HOME_PATH = os.homedir();
const BASE_PATH = `${HOME_PATH}/.git-profiles`;
const SECURITY_TYPE = "id_ed25519";

const VERSION = "1.1.0";

function checkIfExist(path) {
  return fs.existsSync(path);
}

function createDir(path) {
  const exist = checkIfExist(path);

  if (!exist) {
    fs.mkdirSync(path);
  }
}

function createFile(path, initialContent = "") {
  const exist = checkIfExist(path);

  if (!exist) {
    fs.writeFileSync(path, initialContent);
  }
}

function copyFile(src, dest) {
  fs.copyFileSync(src, dest);
}
function removeFile(src) {
  fs.rmSync(src);
}

function writeJson(path, data) {
  fs.writeFileSync(path, JSON.stringify(data));
}

function readJson(path, options = {}) {
  const file = fs.readFileSync(path, options);

  return JSON.parse(file);
}

const buildPath = (paths = [], startPoint = BASE_PATH) => {
  const path = [startPoint, ...paths];
  return path.join("/");
}

function init() {
  createDir(buildPath());
  createDir(buildPath([".ssh"]));
  createFile(buildPath(["profiles.json"]), "[]");
  createFile(buildPath(["current.json"]), "{}");
}

function print(message, level = 1) {
  const offset = " ".repeat(level * 4);

  console.log(`${offset}${message}`);
}

function set(arg = "") {
  if (arg === "") {
    print("You need to provide a name for the profile");
    return;
  }

  const profiles = readJson(buildPath(["profiles.json"]));
  const profile = profiles.find((profile) => profile.name === arg);

  if (!profile) {
    print("Profile does not exist");
    return;
  }

  const { securityType } = profile;

  copyFile(
    buildPath([`.gitconfig.${arg}`], BASE_PATH),
    buildPath([".gitconfig"], HOME_PATH),
  );

  copyFile(
    buildPath([".ssh", `${securityType}.${arg}`], BASE_PATH),
    buildPath([".ssh", securityType], HOME_PATH),
  );

  copyFile(
    buildPath([".ssh", `${securityType}.pub.${arg}`], BASE_PATH),
    buildPath([".ssh", `${securityType}.pub`], HOME_PATH),
  );

  writeJson(buildPath(["current.json"]), profile);

  print(`Profile ${arg} is set`);
}

function create(arg = "", securityType = SECURITY_TYPE) {
  if (arg === "") {
    print("You need to provide a name for the profile");
    return;
  }

  const profiles = readJson(buildPath(["profiles.json"]));
  const exist = profiles.find((profile) => profile.name === arg);

  if (exist) {
    print("Profile already exist");
    return;
  }

  copyFile(
    buildPath([".gitconfig"], HOME_PATH),
    buildPath([`.gitconfig.${arg}`], BASE_PATH),
  );

  copyFile(
    buildPath([".ssh", securityType], HOME_PATH),
    buildPath([".ssh", `${securityType}.${arg}`], BASE_PATH),
  );

  copyFile(
    buildPath([".ssh", `${securityType}.pub`], HOME_PATH),
    buildPath([".ssh", `${securityType}.pub.${arg}`], BASE_PATH),
  );

  const profile = { name: arg, securityType };

  profiles.push(profile);
  writeJson(buildPath(["profiles.json"]), profiles);
  writeJson(buildPath(["current.json"]), profile);

  print(`Profile ${arg} created`);
}

function remove(arg = "") {
  if (arg === "") {
    print("You need to provide a name for the profile");
    return;
  }

  const profiles = readJson(buildPath(["profiles.json"]));
  const profile = profiles.find((profile) => profile.name === arg);

  if (!profile) {
    print("Profile does not exist");
    return;
  }

  const { securityType } = profile;

  removeFile(buildPath([`.gitconfig.${arg}`], BASE_PATH));

  removeFile(buildPath([".ssh", `${securityType}.${arg}`], BASE_PATH));

  removeFile(buildPath([".ssh", `${securityType}.pub.${arg}`], BASE_PATH));

  const newProfiles = profiles.filter((profile) => profile.name !== arg);

  writeJson(buildPath(["profiles.json"]), newProfiles);

  const current = readJson(buildPath(["current.json"]));

  if (current.name === arg) {
    writeJson(buildPath(["current.json"]), {});
  }

  print(`Profile ${arg} is removed`);
}

function list() {
  const profiles = readJson(buildPath(["profiles.json"]));
  const current = readJson(buildPath(["current.json"]));

  if (profiles.length === 0) {
    print("No profiles created");
    return;
  }

  print("Profiles:");

  profiles.forEach((profile) => {
    print(`${current.name === profile.name ? "> " : "- "} ${profile.name}`, 1);
  });
}

function help() {
  print("git-profile $command $arg ?optionalInfo:");
  print("set $arg:", 1);
  print("changes the profile to the one requested", 2);
  print("create $arg ?security:", 1);
  print("will create an profile using the name given", 2);
  print(
    "security is the type of security you want to use, default: id_ed25519",
    2,
  );
  print("list:", 1);
  print("will list all the profiles", 2);
  print("help:", 1);
  print("will print help commands", 2);
  print("migrate:", 1);
  print("if you used git-profile in the past, run this once", 2);
}

function migrate() {
  fs.readdir(buildPath(), function (err, files) {
    if (err) {
      return console.log("Unable to scan directory: " + err);
    }

    print("Profiles found:")

    const profiles = files.reduce((acc, nxt) => {
      if (nxt.includes(".gitconfig")) {
        const name = nxt.replace(".gitconfig.", "");

        print(`- ${name}`, 1);
        print(`Using default security: ${SECURITY_TYPE}`, 2);

        acc.push({ name, securityType: SECURITY_TYPE });
      }

      return acc;
    }, [])

    writeJson(buildPath(["profiles.json"]), profiles);

    print("Migration complete");
    print("Please set a profile using: git-profile set $profileName");
  });
}

print(`Git Profile v${VERSION}`, 0);

init();

switch (option) {
  case "set":
    return set(arg);
  case "create":
    return create(arg, additionalArg);
  case "remove":
    return remove(arg);
  case "list":
    return list();
  case "migrate":
    return migrate();
  case "help":
  default:
    return help();
}