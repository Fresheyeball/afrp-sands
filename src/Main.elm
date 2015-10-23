module Main where

import Automaton exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Signal exposing (..)

actionBox : Mailbox ()
actionBox = mailbox ()

toggle : Automaton () Bool
toggle = state False (always not)

view : Bool -> Html
view b = div []
  [ h1 [] [ text (if b then "Its true" else "nope")]
  , button [ onClick actionBox.address ()] [ text "Toggle" ] ]

main : Signal Html
main = view <~ run toggle False actionBox.signal
