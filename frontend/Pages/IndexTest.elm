module Pages.LikesTest exposing (..)

import Json.Encode as JE
import Pages.Index as I
import Realm as R
import Realm.Utils as RU


main =
    R.test0 I.app init
