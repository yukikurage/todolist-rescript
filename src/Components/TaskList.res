type taskT = {name: string, isFinished : bool}

@react.component
let make = () => {
  let (tasks, setTasks)= React.useState(() => [])

  let (taskName, setTaskName) = React.useState(() => ``) 

  let handleTaskName = (event) => {
    let value = ReactEvent.Form.currentTarget(event)["value"]
    setTaskName(_ => value)
  }

  let finishTask = (itr, event) => {
    ReactEvent.Mouse.preventDefault(event)
    tasks[itr] = {...tasks[itr], isFinished: true}
    setTasks(_ => Belt.Array.copy(tasks))
  }

  let addTask = (event) => {
    ReactEvent.Mouse.preventDefault(event)
    let _ = Js.Array2.push(tasks, {name:taskName, isFinished: false})
    setTaskName(_ => ``)
  }

  let rendTask = (i, task) => {
    <li key = {Belt.Int.toString(i)}> 
      <span className = (if task.isFinished {"finishedTask"} else {"unfinishedTask"})>{React.string(task.name)}</span>
      {
        if task.isFinished {
          React.null
        } else { 
          <button onClick = finishTask(i)> {React.string(`完了`)} </button>
        }
      }
    </li>
  }

  let rendTasks = <ul> {Belt.Array.mapWithIndex (tasks, rendTask) -> React.array} </ul>

  let rendNewTaskInput = 
    <div>
      {React.string (`タスク名`)}
      <input value = {taskName} onChange = handleTaskName />
      <button onClick = addTask> {React.string(`追加`)} </button>
    </div>

  <div>
    <div> {React.string(`タスク一覧`)} </div>
    {rendTasks}
    {rendNewTaskInput}
  </div>
}