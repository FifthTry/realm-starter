pub use realm::base::*;
pub use realm::Page as RealmPage;

#[realm_page(id = "Pages.Index")]
struct Page {
    items: Vec<Todo>,
}

#[derive(Serialize)]
struct Todo {
    text: String,
    finished: bool,
}

pub fn get(_in_: &In0) -> realm::Result {
    Page { items: vec![] }.with_title("Welcome")
}
