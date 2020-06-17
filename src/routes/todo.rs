pub use realm::base::*;

pub fn add_todo(in_: &In0, text: String, finished: i32) -> realm::Result {
    crate::db::add(in_, text, finished)?;
    crate::routes::index::redirect_todo(in_)
}

pub fn index(in_: &In0) -> realm::Result {
    crate::routes::index::redirect_todo(in_)
}
