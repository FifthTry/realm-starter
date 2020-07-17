module Pages.Index exposing (Config, Model, Msg, app, main)

import Browser as B
import Element as E
import Element.Font as EF
import Json.Decode as JD
import Realm as R


app : R.App Config Model Msg
app =
    R.App config init update subscriptions document


type alias Config =
    { message : String
    , count : Int
    }


type alias Model =
    { config : Config }


type Msg
    = NoOp


init : R.In -> Config -> ( Model, Cmd (R.Msg Msg) )
init _ c =
    ( { config = c }, Cmd.none )


update : R.In -> Msg -> Model -> ( Model, Cmd (R.Msg Msg) )
update _ _ m =
    ( m, Cmd.none )


subscriptions : R.In -> Model -> Sub (R.Msg Msg)
subscriptions _ _ =
    Sub.none


view : Model -> E.Element (R.Msg Msg)
view m =
    let
        c =
            m.config
    in
    E.column [ E.centerX, E.centerY, E.spacing 20 ]
        [ E.el [ E.centerX, EF.italic ]
            (E.text "Hello Elm")
        , E.text ("Message from server: " ++ c.message)
        , E.row [ E.spacing 10, E.alignRight ]
            [ E.text ("Count: " ++ String.fromInt c.count)
            , E.link []
                { url = "/increment/"
                , label = E.text "Go Up"
                }
            ]
        ]


document : R.In -> Model -> B.Document (R.Msg Msg)
document in_ =
    view >> R.document in_


config : JD.Decoder Config
config =
    JD.map2 Config
        (JD.field "message" JD.string)
        (JD.field "count" JD.int)


main =
    R.app app
