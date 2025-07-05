// Installed version: "posthog-js": "^1.231.0",

type options = {
  @as("api_host") apiHost: string,
  debug?: bool,
  autocapture?: bool,
  enable_recording?: bool,
  capture_pageview?: bool,
  capture_pageleave?: bool,
  disable_session_recording?: bool,
}

@unboxed
type rec posthogEventData =
  | String(string)
  | Bool(bool)
  | Date(Date.t)
  | Number(float)
  | Array(array<posthogEventData>)
  | Object(Dict.t<posthogEventData>)
  | @as(undefined) Undefined

module Client = {
  type t

  @module("posthog-js") @scope("default")
  external init: (~apiKey: string, ~options: options) => t = "init"

  @get external loaded: t => bool = "__loaded"

  @send external capture: (t, string, ~data: Dict.t<posthogEventData>=?) => unit = "capture"

  @send external identify: (t, string, ~properties: Dict.t<posthogEventData>=?) => unit = "identify"

  @send
  external organization: (
    t,
    @as("organization") _,
    ~slug: string,
    ~properties: Dict.t<posthogEventData>=?,
  ) => unit = "group"

  @send
  external resetGroup: t => unit = "resetGroup"

  @send external reset: t => unit = "reset"
}

module Provider = {
  @react.component @module("posthog-js/react")
  external make: (~client: Client.t, ~children: React.element) => React.element = "PostHogProvider"
}

@module("posthog-js/react")
external usePostHog: unit => Client.t = "usePostHog"
