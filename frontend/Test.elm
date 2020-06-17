module Test exposing (main)

import Json.Encode as JE
import Realm.Test as RT


main =
    RT.app { tests = tests, title = "Realm Starter" }


tests : List RT.Test
tests =
    let
        context =
            [ ( "name", JE.string "Amit Upadhyay" ) ]

        f : String -> List RT.Step -> RT.Test
        f id steps =
            { id = id, context = context, steps = steps }

        t =
            [ f "todo-add" todoAdd
            ]
    in
    t


todoAdd : List RT.Step
todoAdd =
    [ RT.Navigate Index.anonymousEmpty Routes.index
    ]
