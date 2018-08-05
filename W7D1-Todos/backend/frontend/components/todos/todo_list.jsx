import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component{

  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.fetchTodos();
  }

  render(){
    const keys = Object.keys(this.props.todos);

    return(

      <div>
        <h1>Todo List goes here!</h1>
        <ul>
          {keys.map((key, idx) => <TodoListItem todo={this.props.todos[key]} removeTodo={this.props.removeTodo} key={idx} /> )}
        </ul>
        <TodoForm errors={this.props.errors} createTodo={this.props.createTodo}/>
      </div>
    );
  }


}


export default TodoList;
