@module("fs")
external readFileSync: (string, @as("utf8") _) => string = "readFileSync"

@module("fs")
external writeFileSync: (string, string, @as("utf8") _) => unit = "writeFileSync"

type globConfig = {
  dot?: bool,
  cwd?: string,
  onlyDirectories?: bool,
}

@module("fast-glob") @scope("default")
external globSync: (array<string>, globConfig) => array<string> = "sync"

type binding = {
  name: string,
  href: string,
}

let main = () => {
  let bindings =
    globSync(["./src/**/*.res"], {})
    ->Array.filter(dir => !(dir->String.startsWith("./src/scripts/")))
    ->Array.map(dir => {
      let name =
        dir
        ->String.replace("./src/", "")
        ->String.split("/")
        ->Array.slice(~start=0, ~end=-1)
        ->Array.join("/")

      let href =
        dir
        ->String.sliceToEnd(~start=2)
        ->String.split("/")
        ->Array.slice(~start=0, ~end=-1)
        ->Array.join("/")

      {
        name,
        href,
      }
    })
    ->Array.toSorted((a, b) => String.compare(a.name, b.name))

  let readmeTemplate = readFileSync("./templates/README.template")
  let readme =
    readmeTemplate->String.replace(
      "{{bindings}}",
      bindings->Array.map(binding => `- [${binding.name}](${binding.href})`)->Array.join("\n"),
    )
  writeFileSync("./README.md", readme)

  Console.log("README.md generated with " ++ bindings->Array.length->Int.toString ++ " bindings")
}

main()
