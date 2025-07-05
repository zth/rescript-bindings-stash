// Installed version: "react-minimal-pie-chart": "8.3.0",

type data = {
  color: string,
  value: float,
  key: option<string>,
  title: string,
}

@obj
external makeDataPoint: (~color: string, ~value: float, ~title: string, ~key: string=?) => data = ""

type labelRenderProps = {dataEntry: data}

@module("react-minimal-pie-chart") @react.component
external make: (
  ~data: array<data>,
  ~viewBoxSize: (float, float)=?,
  ~className: string=?,
  ~onClick: (ReactEvent.Mouse.t, int) => unit=?,
  ~radius: float=?,
  ~segmentsShift: int => float=?,
  ~label: labelRenderProps => string=?,
  ~labelStyle: ReactDOM.Style.t=?,
  ~labelPosition: float=?,
  ~totalValue: float=?,
  ~startAngle: float=?,
) => React.element = "PieChart"
