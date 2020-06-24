module Pages.IndexTest exposing (..)

import Pages.Index as M
import Realm as R
import Realm.Utils as RU


newPage : ( String, String )
newPage =
    ( "Index", "newPage" )


main =
    R.test0 M.app init


init : R.In -> R.TestFlags M.Config -> ( M.Model, Cmd (R.Msg ()) )
init in_ test =
    let
        id =
            ( "Index", test.id )

        ( m, c ) =
            M.app.init in_ test.config

        f : List R.TestResult -> ( M.Model, Cmd (R.Msg ()) )
        f l =
            ( m, R.result c (l ++ [ R.TestDone ]) )
    in
    (if id == newPage then
        [ RU.match "message match"
            "hello world"
            test.config.message
        , RU.match "count match"
            0
            test.config.count
        ]

     else
        [ R.TestFailed test.id "IndexTest: id not known" ]
    )
        |> f
