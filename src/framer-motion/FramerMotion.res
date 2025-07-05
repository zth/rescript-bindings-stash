// Installed version: "framer-motion": "4.1.3",

module AnimateSharedLayout = {
  @module("framer-motion") @react.component
  external make: (~children: React.element) => React.element = "AnimateSharedLayout"
}

module AnimatePresence = {
  @module("framer-motion") @react.component
  external make: (~children: React.element=?, ~exitBeforeEnter: bool=?) => React.element =
    "AnimatePresence"
}

type animationConfig = {
  opacity: option<float>,
  scale: option<float>,
  x: option<float>,
  y: option<float>,
}

let makeAnimationConfig = (~opacity=?, ~scale=?, ~x=?, ~y=?) => {
  opacity,
  scale,
  x,
  y,
}

type transitionConfig

type springTransitionConfig = {
  @as("type") type_: [#spring],
  damping: option<float>,
  stiffness: option<float>,
}

external springConfigToTransitionConfig: springTransitionConfig => transitionConfig = "%identity"

let makeSpringTransitionConfig = (~damping=?, ~stiffness=?) =>
  springConfigToTransitionConfig({
    type_: #spring,
    damping,
    stiffness,
  })

module M = {
  module Div = {
    @module("framer-motion") @scope("motion") @react.component
    external make: (
      ~id: string=?,
      ~children: React.element=?,
      ~className: string=?,
      ~layout: bool=?,
      ~layoutId: string=?,
      ~initial: animationConfig=?,
      ~animate: animationConfig=?,
      ~exit: animationConfig=?,
      ~transition: transitionConfig=?,
    ) => React.element = "div"
  }

  module Tr = {
    @module("framer-motion") @scope("motion") @react.component
    external make: (
      ~id: string=?,
      ~children: React.element=?,
      ~className: string=?,
      ~layout: bool=?,
      ~layoutId: string=?,
      ~initial: animationConfig=?,
      ~animate: animationConfig=?,
      ~exit: animationConfig=?,
      ~transition: transitionConfig=?,
    ) => React.element = "tr"
  }

  module Img = {
    @module("framer-motion") @scope("motion") @react.component
    external make: (
      ~id: string=?,
      ~className: string=?,
      ~alt: string=?,
      ~src: string=?,
      ~layout: bool=?,
      ~layoutId: string=?,
      ~initial: animationConfig=?,
      ~animate: animationConfig=?,
      ~exit: animationConfig=?,
      ~transition: transitionConfig=?,
    ) => React.element = "img"
  }

  module Span = {
    @module("framer-motion") @scope("motion") @react.component
    external make: (
      ~id: string=?,
      ~children: React.element=?,
      ~className: string=?,
      ~layout: bool=?,
      ~initial: animationConfig=?,
      ~animate: animationConfig=?,
      ~exit: animationConfig=?,
      ~title: string=?,
      ~layoutId: string=?,
      ~transition: transitionConfig=?,
    ) => React.element = "span"
  }

  module P = {
    @module("framer-motion") @scope("motion") @react.component
    external make: (
      ~id: string=?,
      ~children: React.element=?,
      ~className: string=?,
      ~layout: string=?,
      ~initial: animationConfig=?,
      ~animate: animationConfig=?,
      ~exit: animationConfig=?,
      ~transition: transitionConfig=?,
    ) => React.element = "p"
  }

  module Ul = {
    @module("framer-motion") @scope("motion") @react.component
    external make: (
      ~id: string=?,
      ~children: React.element=?,
      ~className: string=?,
      ~layout: string=?,
      ~initial: animationConfig=?,
      ~animate: animationConfig=?,
      ~exit: animationConfig=?,
      ~transition: transitionConfig=?,
    ) => React.element = "ul"
  }

  module Li = {
    @module("framer-motion") @scope("motion") @react.component
    external make: (
      ~id: string=?,
      ~children: React.element=?,
      ~className: string=?,
      ~layout: string=?,
      ~initial: animationConfig=?,
      ~animate: animationConfig=?,
      ~exit: animationConfig=?,
      ~transition: transitionConfig=?,
    ) => React.element = "li"
  }
}
