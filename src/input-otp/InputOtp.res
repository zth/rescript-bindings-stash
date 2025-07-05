// Installed version: "input-otp": "1.4.2"

type slotProps = {
  char: option<string>,
  placeholderChar: string,
  hasFakeCaret: bool,
  isActive: bool,
}
type renderConfig = {slots: array<slotProps>}

@module("input-otp") @react.component
external make: (
  ~maxLength: int=?,
  ~containerClassName: string=?,
  ~render: renderConfig => React.element,
  ~value: string,
  ~onChange: string => unit,
) => React.element = "OTPInput"
