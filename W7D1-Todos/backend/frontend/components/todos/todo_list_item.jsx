import React from 'react';

class TodoListItem extends React.Component {
  constructor(props){
    super(props);
    this.handlerRemove = this.handlerRemove.bind(this);
  }

  handlerRemove(e){
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  render() {
    return(
      <li>{this.props.todo.title}
        <botton className="remove" onClick={this.handlerRemove}>Remove</botton>
      </li>
    )

  }


}


export default TodoListItem;
