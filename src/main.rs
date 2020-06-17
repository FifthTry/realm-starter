use http::method::Method;
use realm::base::*;
realm::realm! {middleware}

pub fn middleware(ctx: &realm::Context) -> realm::Result {
    let conn = sqlite::connection()?;
    let in_: In0 = realm::base::In::from(&conn, ctx);

    route(&in_)
}

pub fn route(in_: &In0) -> realm::Result {
    let mut input = in_.ctx.input()?;

    match in_.ctx.pm() {
        t if realm::is_realm_url(t) => realm::handle(in_, t, &mut input),
        ("/", &Method::GET) => realm_tutorial::routes::index::get(in_),
        // ("/add/", &Method::POST) => {
        //     let (text, finished) = input.required2("text", "finished")?;
        //     realm_tutorial::routes::todo::add_todo(in_, text, finished)
        // },
        _ => realm_tutorial::routes::index::get(in_),
    }
}
