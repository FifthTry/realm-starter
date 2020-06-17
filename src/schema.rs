table! {
    hello_counter (id) {
        id -> Integer,
        count -> Integer,
    }
}

table! {
    hello_todo (id) {
        id -> Integer,
        text -> Text,
        date -> Date,
        finished -> Integer,
    }
}

allow_tables_to_appear_in_same_query!(hello_counter, hello_todo,);
