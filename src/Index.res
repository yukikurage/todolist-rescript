switch ReactDOM.querySelector("#app") {
| Some(app) => ReactDOM.render(<Application />, app)
| None => ()
}
