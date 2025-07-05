// Installed version: "react-helmet": "6.1.0",

@module("react-helmet") @react.component
external make: (
  ~children: React.element,
  ~titleTemplate: string=?,
  ~defaultTitle: option<string>=?,
) => React.element = "Helmet"
