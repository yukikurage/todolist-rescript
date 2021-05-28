switch(ReactDOM.querySelector("#app")){
| Some(root) => ReactDOM.render({<TaskList />}, root)
| None => () // do nothing
}