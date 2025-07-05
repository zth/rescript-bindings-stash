// Installed version: "fetch-multipart-graphql": "2.0.1",

type fetchConfig = {
  @as("method")
  _method: string,
  headers: Dict.t<string>,
  body: string,
  onNext: JSON.t => unit,
  onError: JsExn.t => unit,
  onComplete: unit => unit,
  credentials: [#"same-origin"],
}

@module("fetch-multipart-graphql")
external fetch: (string, fetchConfig) => unit = "default"
