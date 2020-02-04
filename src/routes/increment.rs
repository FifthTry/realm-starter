pub use realm::base::*;

fn increment(in_: &In<bool>) -> Result<()> {
    use crate::schema::hello_counter;
    use diesel::prelude::*;

    diesel::update(hello_counter::table)
        .set(hello_counter::count.eq(hello_counter::count + 1))
        .execute(in_.conn)
        .map(|_| ())
        .map_err(Into::into)
}

pub fn get(in_: &In<bool>) -> realm::Result {
    increment(in_)?;
    crate::routes::index::redirect(in_)
}
