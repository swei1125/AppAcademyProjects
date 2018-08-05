import React from 'react';
import uniqueId from '../../util/utils';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: "", body: "", done: false};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateVal = this.updateVal.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();
    const todo = Object.assign({}, this.state, {id: uniqueId()});
    this.props.createTodo(todo).then (
      () => this.setState({title: '', body: ''})
    );
  }

  updateVal(el) {
    return e => this.setState({[el]: e.target.value});
  }

  render() {
    const {handleSubmit, updateVal} = this;
    return(
      <div>
        <form onSubmit={handleSubmit}>
          <label>Title:
            <input onChange={updateVal('title')} id='title' placeholder='buy milk' value={this.state.title} />
          </label>

          <label>Body:
            <textarea onChange={updateVal('body')} id='body' cols='20' rows='5' value={this.state.body}></textarea>
          </label>

          <button className='create-button'>Create Todo!</button>
        </form>
        <p>{this.props.errors}</p>
      </div>
    );
  }
}
export default TodoForm;
