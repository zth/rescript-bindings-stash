// Installed version: "qrcode.react": "4.2.0",

module Canvas = {
  @react.component @module("qrcode.react")
  external make: (~value: string, ~size: float=?) => React.element = "QRCodeCanvas"
}

module Svg = {
  @react.component @module("qrcode.react")
  external make: (~value: string, ~size: float=?) => React.element = "QRCodeSVG"
}
