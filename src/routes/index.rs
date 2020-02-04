pub use realm::base::*;
pub use realm::Page as RealmPage;

#[realm_page(id = "Pages.Index")]
struct Page {
    message: String,
    count: i32,
}

fn get_count(in_: &In<bool>) -> Result<i32> {
    use crate::schema::hello_counter;
    use diesel::prelude::*;

    if let Ok(count) = hello_counter::table
        .select(hello_counter::count)
        .first(in_.conn)
    {
        return Ok(count);
    };

    diesel::insert_into(hello_counter::table)
        .values(hello_counter::count.eq(0))
        .execute(in_.conn)?;

    Ok(0)
}

pub fn get(in_: &In<bool>) -> realm::Result {
    Page {
        message: "hello world".to_string(),
        count: get_count(in_)?,
    }
    .with_title("Welcome")
}

pub fn redirect(in_: &In<bool>) -> realm::Result {
    get(in_).map(|r| r.with_url(crate::reverse::index()))
}
